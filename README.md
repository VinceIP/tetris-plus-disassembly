# tetris-plus-disassembly
A disassembly of Tetris Plus for the Game Boy.

It builds the following ROM:
- Tetris Plus (USA, Europe)(SGB Enhanced).gb 'dfab75ab6bdc0765ba9a5d33a93ffdb114a49cbf'

This project is still in progress and in a very early stage!

## Building

- Get the latest release of [RGBDS](https://github.com/gbdev/rgbds/releases/tag/v1.0.1) or follow the installation instructions for your system here: (https://rgbds.gbdev.io/install)
- Clone this repo and navigate to it in your terminal or command line. Run 'make' or 'make clean && make' to build the ROM.
- Note: The makefile is configured to optionally verify that the SHA1 of the output file is an exact match to the original ROM. To compare the build output to the original, place an original ROM in the src/ directory. Rename it to 'baserom.gb'.

## Contributing

I'd be thrilled if you would like to contribute. Tetris Plus is an often overlooked spin on Tetris and deserves a throrough disassembly for study and preservation.

Ways to contribute:
- Document, name, and annotate functions with comments. What are the functions doing?
- Identify and name constants, variables, etc.
- Distinguish code from graphics and music.
- Once functions are identified and documented, move them into relevant separate .asm files where appropriate for clean organization while ensuring the byte order of the ROM stays exactly the same.

If you'd like to submit a pull request, make sure your changes still build successfully via 'make clean && make' and your output shows 'Comparing SHA1...
OK — Match: dfab75ab6bdc0765ba9a5d33a93ffdb114a49cbf'.

## Game Boy resources
- [RGBDS docs](https://rgbds.gbdev.io/docs/master)
- [PANDocs](https://gbdev.io/pandocs/)