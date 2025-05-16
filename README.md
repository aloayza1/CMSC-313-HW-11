# CMSC-313-HW-11
Authoring: Angelina Loayza, UMBC, CMSC-313 2:30-3:45pm, Spring 2025

Date: 15 May 2025

Purpose of Software: 
  1. Translates raw byte values into ACSII hexadecimal and print them
  2. Have grader download files
  3. Compile and analyze files

Files: translate2Ascii.asm

Build Instructions: compile translate2Ascii.asm using 

nasm -f elf32 -g -F dwarf -o translate2Ascii.o translate2Ascii.asm

ld -m elf_i386 -o translate2Ascii translate2Ascii.o

run using ./translate2Ascii

Testing Methodology: testing conversion of 0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A to verify a accurate conversion

Additional Information:
