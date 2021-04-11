# 16 Bit Memory Expansion for SAP-1

## Design Goals

* The memory space should use 16 bit addressing
* Have both ROM and RAM in the memory address space.
  * ROM would be used for a boot-loader, common subroutines, and programs
  * 32K of ROM and 32K of RAM. The ROM will be `0x0000` though `0x7FFF`, and the RAM will be at `0x8000` through `0xFFFF`.
* Both the program counter and memory address register should be 16 bit registers.
* Like the program counter, The memory address register should enable being incremented in order to quickly get the next location in memory. 
  * This feature is actually needed due to memory address values now occupying two bytes, and we want our instruction parameters to just point at the first byte.
 * This would be controlled by microcode.
* For multi-byte values in RAM, such as memory addresses and 16-bit integers, the values will be arranged as little endian.
  * This makes implementing multi-byte math so much easier later on. It does make data entry a little less intuitive. 
  * The program counter and memory address register will be physically arranged as big endian to make the LEDs used to represent their values more human interpretable.
* Implement an assembler using [the `customasm` tool](https://github.com/hlorenzi/customasm).
  * This is done to make creating the ROM images easier. 


Not in scope for this project:

* While expanding the RAM and how it is addressed is the necessary prerequisite to allowing the instruction register use more than 4 bits for instruction codes, this project will not accomplish instruction register expansion. 


### Component Data sheets

* [UM61512AK-15](./datasheets/UM61512A.pdf) - 64 K x 8 bit SRAM. Any 32K or larger SRAM chip could be used for this project with minimal modifications. 
* [AT28C256](https://www.mouser.com/datasheet/2/268/doc0006-1108095.pdf) - 32K x 8 bit EEPROM. Any 32K or larger EPROM could be used with minimal modification to the wiring. EEPROMs are convenient for reprogramming, which we will likely do often.