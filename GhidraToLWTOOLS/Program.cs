using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Reflection.Emit;
using System.Text;



namespace MyProject;

class Program
{
    class ParseState
    {
        public const uint NoAddress = 0xFFFF;

        public bool m_isInRamAddressSpace = true;
        public uint m_lastAddress = 0;
        public uint m_currentLine = 0;
        public List<ParsedLine> m_parsedLines = new();
        public ParsedLine? m_lastParsedLine = null;

        public void UpdateAddress(uint addr)
        {
            if (addr == NoAddress)
                return;

            m_isInRamAddressSpace = (addr < 0xC000);
            m_lastAddress = Math.Max(addr, m_lastAddress);
        }

        internal void ParseLine(string fileLine)
        {
            var newLine = new ParsedLine(fileLine, this);

            if (newLine.m_parsedLineType != ParsedLine.ParsedLineType.Nothing)
            {
                m_parsedLines.Add(newLine);
                m_lastParsedLine = newLine;
            }

            m_currentLine++;
        }
    }

    class ParsedLine
    {
        public uint m_address;
        public string m_addressString = "";

        public string m_comment = "";
        public string m_label = "";
        public string m_code = "";
        public string m_dataToken = "";
        private string m_dataValue = "";
        public bool m_isDataLabel = false; // we only know if it's a data label after reading the next line
        public bool m_addSpacing = false;

        public enum ParsedLineType
        {
            Nothing,
            Label,
            Comment,
            Code,
            Data
        }


        public ParsedLineType m_parsedLineType = ParsedLineType.Nothing;

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            string spacing = "                                                                     ";

            switch (m_parsedLineType) 
            {
            case ParsedLineType.Label: 
                
                if (!m_isDataLabel)
                    sb.Append("\n");

                sb.Append(m_label);

                if (m_isDataLabel)
                {
                    sb.Append(" equ 0x");
                    sb.Append(m_addressString);
                }
                else
                {
                    sb.Append(":");
                }
                sb.Append(spacing.Substring(sb.ToString().Length));
                break;
            case ParsedLineType.Code:
                sb.Append("        ");
                sb.Append(m_code);
                
                break;
            case ParsedLineType.Data:
                sb.Append("        ");
                sb.Append(m_dataToken);
                sb.Append("        ");
                sb.Append(m_dataValue);

                break;
            }

            if (m_addSpacing)
                sb.Append(spacing.Substring(sb.ToString().Length));

            sb.Append(m_comment);

            return sb.ToString();
        }

        public ParsedLine(string line, ParseState parseState)
        {
            string trimmedLine = line.Trim();

            // if the line is only a comment
            if (trimmedLine.StartsWith("//"))
            {
                m_comment = line.Replace("//", ";").Trim();
                m_parsedLineType = ParsedLineType.Comment;
                return;
            }

            if (trimmedLine.StartsWith("*"))
            {
                m_comment = ';' + trimmedLine;
                m_parsedLineType = ParsedLineType.Comment;
                return;                
            }

            m_addSpacing = true;

            // find the comment at the end of the line
            int commentIndex = line.IndexOf(';');
            if (commentIndex != -1)
            {
                string comment = line.Substring(commentIndex);

                if (!comment.StartsWith("; = "))
                {
                    if (parseState.m_lastParsedLine != null && 
                        parseState.m_lastParsedLine.m_parsedLineType == ParsedLineType.Label &&
                        string.IsNullOrEmpty(parseState.m_lastParsedLine.m_comment) &&
                        parseState.m_isInRamAddressSpace)
                    {
                        parseState.m_lastParsedLine.m_comment = comment;
                    }
                    else
                    {
                        m_comment = comment;
                        m_parsedLineType = ParsedLineType.Comment;
                    }
                }
            }

            (m_address, m_addressString) = ExtractAddress(line);

            parseState.UpdateAddress(m_address);

            if (m_address == ParseState.NoAddress) 
            {
                // is this a label?
                var label = line.Length >= 77 ? line.Substring(29, 48).Trim() : line.Trim();

                if (!string.IsNullOrEmpty(label))
                {
                    if (label.Contains(' ') || // if the label contains a space, then for sure it's a comment.
                        label.Contains(':'))   // or punctuation. yes, very hardcoded
                    {
                        // if the last line isn't a comment, add a line separator
                        if (parseState.m_lastParsedLine.m_parsedLineType != ParsedLineType.Comment)
                            m_comment = "\n";

                        m_comment += ";" + line.Trim();
                        m_parsedLineType= ParsedLineType.Comment;
                        m_addSpacing = false;
                    }
                    else
                    {
                        // when labels have something like +1 at the end, 
                        // Ghidra seems to think they're used but they don't
                        // appear to be. Just rename the + to _ to make a 
                        // harmless but unused label.

                        label = label.Replace("+", "_");

                        m_label = label;
                        m_parsedLineType = ParsedLineType.Label; 
                    }
                }
            }
            else 
            {
                if (parseState.m_isInRamAddressSpace)
                {
                    // is in RAM
                    var data1 = line.Substring(36, 2);
                    var data2 = line.Substring(47, 2);

                    if (data1 == "??" || data2 == "??")
                    {
                        if (parseState.m_lastParsedLine != null)
                        {
                            // go back from the last line and set the data label and address
                            // to all the labels until we find one that has already been set.

                            for (int loop = parseState.m_parsedLines.Count - 1; loop >= 0; loop--)
                            {
                                var previousLine = parseState.m_parsedLines[loop];

                                if (previousLine.m_isDataLabel)
                                    break;

                                if (previousLine.m_parsedLineType == ParsedLineType.Label)
                                {
                                    previousLine.m_isDataLabel = true;
                                    previousLine.m_address = m_address;
                                    previousLine.m_addressString = m_addressString;
                                }
                            }
                        }
                    }
                }
                else
                {
                    // first line of code, add the "org 0xC000" to the previous label
                    if (m_address == 0xc000)
                    {
                        parseState.m_lastParsedLine.m_label = "        org 0xc000\n" + parseState.m_lastParsedLine.m_label;
                    }

                    string subString = "";
                    if (commentIndex != -1)
                    {
                        int size = commentIndex - 36;
                        subString = line.Substring(36, size).Trim();
                    }
                    else
                    {
                        subString = line.Substring(36, line.Length - 36).Trim();
                    }

                    bool isData = false;
                    // is in ROM. Could be data or could be code.

                    var tokens = subString.Split(' ');
                    string firstToken = tokens[0];

                    if (firstToken == "addr")
                    {
                        firstToken = "dw";
                    }

                    if (firstToken == "db" ||
                        firstToken == "dw" ||
                        firstToken.StartsWith("undef") ||
                        firstToken == "??")
                     {
                        isData = true;
                     }

                    if (isData)
                    {
                        if (firstToken != "dw")
                            firstToken = "db";
                        m_parsedLineType = ParsedLineType.Data;

                        m_dataToken = "." + firstToken;

                        int counter = 1;
                        m_dataValue = tokens[counter];
                        while (string.IsNullOrEmpty(m_dataValue))
                        {
                            counter++;
                            m_dataValue = tokens[counter];
                        }

                        if (m_dataValue.EndsWith("h"))
                        {
                            m_dataValue = "0x" + m_dataValue.Substring(0, m_dataValue.Length - 1);
                        }
                    }
                    else
                    {
                        m_code = subString;

                        int arrowIndex = m_code.IndexOf("=>");
                        if (arrowIndex >= 0) 
                        {
                            m_code = m_code.Substring(0, arrowIndex);
                        }

                        if (m_code.StartsWith("PULS") ||
                            m_code.StartsWith("PSHS"))
                         {
                            // add commas to the registers
                            string registers = m_code.Substring(4).Trim();
                            registers = registers.Replace(" ", ",");
                            m_code = m_code.Substring(0, 4) + "        " + registers;
                         }

                        string replaceTag = "REPLACE: ";

                        if (m_comment.Contains(replaceTag))
                        {
                            int startIndex = m_comment.IndexOf(replaceTag) + replaceTag.Length;
                            m_code = m_comment.Substring(startIndex);
                            m_comment = "";
                        }

                        m_parsedLineType = ParsedLineType.Code;                    
                    }
                }
            }
        }

        private (uint, string) ExtractAddress(string line)
        {
            string addressString = line.Substring(12, 4);
            uint result = ParseState.NoAddress;

            if (!string.IsNullOrWhiteSpace(addressString))
            {
                if (!uint.TryParse(addressString, 
                                   NumberStyles.HexNumber, 
                                   CultureInfo.CurrentCulture, out result))
                {
                    addressString = "";
                    result = ParseState.NoAddress;
                }
            }

            return (result, addressString);
        }
    }

    private static void AddHardwareVariables(StringBuilder sb)
    {
        sb.AppendLine("; Hardware constants");
        sb.AppendLine("PIA0_A_DATA_REG__FF00 equ 0xff00");
        sb.AppendLine("PIA0_A_CONTROL_REG__FF01 equ 0xff01");
        sb.AppendLine("PIA0_B_DATA_REG__FF02 equ 0xff02");
        sb.AppendLine("PIA0_B_CTRL_REG__FF03 equ 0xff03");

        sb.AppendLine("VMODE_REG__FF98 equ 0xff98");

        sb.AppendLine("PIA1_A_DATA_REG__FF20 equ 0xff20");
        sb.AppendLine("PIA1_B_DATA_REG__FF22 equ 0xff22");
        sb.AppendLine("PIA1_B_CONTROL_REG__FF23 equ 0xff23");

        sb.AppendLine("PALETTE_FFB4 equ 0xffb4");
        sb.AppendLine("PALETTE_FFB6 equ 0xffb6");

        //sb.AppendLine("LAB_c003 equ ");

        sb.AppendLine("SAM_V0_FFC0 equ 0xffc0");
        sb.AppendLine("SAM_V1_FFC3 equ 0xffc3");
        sb.AppendLine("SAM_V2_FFC5 equ 0xffc5");
        sb.AppendLine("SAM_PAGE_SELECT_REG_SAM_F0_FFC6 equ 0xffc6");

        sb.AppendLine("RomRam_MapType_FFDE equ 0xffde");        
        sb.AppendLine();
        sb.AppendLine();
    }

    static void Main(string[] args)
    {
        var fileLines = File.ReadAllLines(@"..\..\..\..\downland.txt");

        var parseState = new ParseState();

        foreach (var fileLine in fileLines)
        {
            parseState.ParseLine(fileLine);
        }


        // write to file
        StringBuilder sb = new StringBuilder();

        AddHardwareVariables(sb);

        foreach (var parsedLine in parseState.m_parsedLines)
        {
            string exportedLine = parsedLine.ToString();
            //Console.WriteLine(exportedLine);



            sb.AppendLine(exportedLine);
        }

        Directory.CreateDirectory(@"..\..\..\..\exported_asm");
        File.WriteAllText(@"..\..\..\..\exported_asm\downland.asm", sb.ToString());


    }


}