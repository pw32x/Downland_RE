# Downland_RE
Reverse enginerring Downland for the Tandy Color Computer

Downland is a game for the Tandy Color Computer written by Micheal Aichlmayr. It was released in 1983 by Spectral Associates.

This project is to reverse engineer the Downland game rom and produce an assembly file that is buildable by LWTOOLS (http://www.lwtools.ca/) that will create a byte-for-byte reproduction.

Information about Downland can be found here: https://www.cocopedia.com/wiki/index.php/Downland

The work is based on Downland V1.1, released later to support the Tandy Color Computer 3.

The reverse engineering is always a work in progress. There are a lot of small areas and functions that need to be figured out, but a lot of the major parts are there. And what is there is very likely not 100% accurate and some parts are probably completely wrong. I am not an assembly language expert nor a Color Computer hardware expert. Fair warning! :)

The Notes folder is where the research findings (fun facts!) are located.

While the RE isn't complete, what is there is enough to build a Downland rom identical to the original from the assembly. 

To Generate downland.asm:

- Build the GhidraToLWTOOLS solution
- Run GhidraToLWTOOLS.exe in the same folder as where downland.ghidra.txt is located
- the tool will generate a downland.asm in the exported_asm folder

To build downland.asm into downland.bin:
- install LWTOOLS (http://www.lwtools.ca/)
- enter the exported_asm folder
- update build.bat with the lwasm path
- run build.bat
- a downland.bin will be generated

## CONTACT

Send questions, comments, & bugs about Downland_RE to pw32x at jump@puffweet.com
