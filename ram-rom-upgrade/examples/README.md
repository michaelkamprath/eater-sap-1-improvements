# Example Code
The code in this directory proveds examples of how to use the 16-bit memory space that this project built. Since the instruction register is still the roiginal 4-bit rgister from the origina Eater SAP-1, the instruction set is limitted.

To build this code and assembler is needed. I have seperated written a configuraable assbler, called [BespokeASM](https://github.com/michaelkamprath/bespokeasm). Instructions on how to install BespokeASM can be [found at its wiki](https://github.com/michaelkamprath/bespokeasm/wiki/Installation-and-Usage).

Provided in this directory is [the BespokeASM YAML configuration file](kamprath-16bit-addr-4bit-instrs-bespokeasm.yaml) needed to compile the bytecode for breadboard CPU's achitecure as of this project.

To compile the assebly code into a binary image that can be used to burn the ROM of this project's memory module:

```sh
bespokeasm compile -e 32767 -c kamprath-16bit-addr-4bit-instrs-bespokeasm.yaml factorial_sap1_isa.asm
```
Note that the `-e` option is needed so that BespokeASM only emits the first 32K of code into the binary image, and thus can be used to burn the ROM which is only the first 32K of the memory space.
