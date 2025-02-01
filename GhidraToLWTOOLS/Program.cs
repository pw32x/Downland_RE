﻿using System.Drawing;
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

        public string m_comment = "";
        public string m_label = "";
        public string m_code;
        public bool m_isDataLabel = false; // we only know if it's a data label after reading the next line

        public enum ParsedLineType
        {
            Nothing,
            Label,
            Comment,
            Code
        }


        public ParsedLineType m_parsedLineType = ParsedLineType.Nothing;

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();

            switch (m_parsedLineType) 
            {
            case ParsedLineType.Label: 
                sb.Append(m_label);
                if (m_isDataLabel)
                {
                    sb.Append(" equ 0x");
                    sb.Append(Convert.ToString(m_address, 16));
                }
                else
                {
                    sb.Append(":");
                }
                break;
            case ParsedLineType.Code:
                sb.Append(m_code);
                break;
            }

            string spacing = "                                                           ";

            sb.Append(spacing.Substring(sb.ToString().Length));

            sb.Append(m_comment);

            return sb.ToString();
        }

        public ParsedLine(string line, ParseState parseState)
        {
            // if the line is only a comment
            if (line.Trim().StartsWith("//"))
            {
                m_comment = line;
                m_parsedLineType = ParsedLineType.Comment;
                return;
            }

            // find the comment at the end of the line
            int commentIndex = line.IndexOf(';');
            if (commentIndex != -1)
            {
                string comment = line.Substring(commentIndex);

                if (comment != "; = ??")
                {
                    if (parseState.m_lastParsedLine != null && 
                        parseState.m_lastParsedLine.m_parsedLineType == ParsedLineType.Label &&
                        string.IsNullOrEmpty(parseState.m_lastParsedLine.m_comment))
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

            m_address = ExtractAddress(line);

            parseState.UpdateAddress(m_address);

            if (m_address == ParseState.NoAddress) 
            {
                // is this a label?
                var label = line.Length >= 77 ? line.Substring(29, 48).Trim() : line.Trim();

                if (!string.IsNullOrEmpty(label))
                {
                    m_label = label;
                    m_parsedLineType = ParsedLineType.Label; 
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
                                }
                            }
                        }
                    }
                }
                else
                {
                    // is in ROM. Could be data or could be code.

                    if (commentIndex != -1)
                    {
                        int size = commentIndex - 36;
                        m_code = line.Substring(36, size).Trim();
                    }
                    else
                    {
                        m_code = line.Substring(36, line.Length - 36).Trim();
                    }
                    m_parsedLineType = ParsedLineType.Code;                    
                }
            }
        }

        private uint ExtractAddress(string line)
        {
            string address = line.Substring(12, 4);

            if (string.IsNullOrWhiteSpace(address))
                return ParseState.NoAddress;

            if (uint.TryParse(address, 
                              NumberStyles.HexNumber, 
                              CultureInfo.CurrentCulture, out uint result))
                return result;

            return ParseState.NoAddress;
        }
    }

    static void Main(string[] args)
    {
        var fileLines = File.ReadAllLines(@"..\..\..\..\downland.txt");

        var parseState = new ParseState();

        foreach (var fileLine in fileLines)
        {
            parseState.ParseLine(fileLine);
        }

        foreach (var parsedLine in parseState.m_parsedLines)
        {
            Console.WriteLine(parsedLine.ToString());
        }
    }
}