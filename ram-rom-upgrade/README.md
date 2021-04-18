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
* Smaller clock footprint
  * This project a larger than normal breadboard footprint. In order to save save, the clock module is made smaller by using a LM556 dual timer chip in replacement to two LM555 timers.  
  * Also, the sense of the `PROG` signal is changed to a HIGH indicating that the computer should be in manual program mode. This requires a small change to the [Halt system clock when programming](../clock-halt-when-programming/) project.


Not in scope for this project:

* While expanding the RAM and how it is addressed is the necessary prerequisite to allowing the instruction register use more than 4 bits for instruction codes, this project will not accomplish instruction register expansion. 


## Design Approach



### RAM and ROM
With a 16 bit address space, the computer will be able to address a total of 64K of memory. There are many ways to allocate the memory space's usage. Here, we are going to simply evenly split the memory space between ROM and RAM, with the ROM being in the lower 32K of the address space. Both the ROM and RAM could be used for program code, with the ROM code being burned onto the ROM and the RAM code being manually entered via DIP switches. Since only RAM will be mutable at run time, all variables for any cod should be in the RAM address space even if the program code is in ROM. 

A simple visualization of memory space is as follows:

```
    0xFFFF  +-----+
            |     |
            | RAM | <-- Variables, programs
            |     |
    0x8000  +-----+
            |     |
            | ROM | <-- Boot code, programs
            |     |
    0x0000  +-----+

```

To implement this, a 28C256 EEPROM will be used for the ROM and a UM61512AK-15 will be used for RAM. In order to select whether the RAM or ROM is active, address line 16 (the MSB) will be routed to each chip's enable rather than an address input on the chip. Fortunately, the 28C256 chip enable is active low and the UM61512AK-15 chip enable is active high, thus making it very straightforward as to which chip should be active based on the MSB of the address. 

One design challenge that had to be overcome is that the UM61512AK-15 uses the same pin for both data input and data output. This creates the potential for bus contention if the RAM is outputting a value at the moment a value is read in from the data bus. Bus contention could also occur is the 74LS157 2-to-2 multiplexers are used to switch between input from the DIP switches and input from the data bus. The reason for this is that when inactive, the 74LS157's output pins are set to LOW. This creates a short circuit of the RAM or ROM chip are writing a HIGH to any data line. In order to address these issues, 74LS257 2-to-1 multiplexes are used instead, as these chips have a tri-state output and places the output lines to high impedance if the chip is set to inactive. Then, logic is added to ensure that the 74LS257s are only active when the RAM chip is reading from the data lines. Otherwise, the 74LS257s will be set inactive so bus contention does not develop when either the RAM or ROM are writing to the data lines.

### Program Counter and Memory Address Register

### Address Bus


## Assembler

## Boot Loaders

### Component Data sheets

* [UM61512AK-15](./datasheets/UM61512A.pdf) - 64 K x 8 bit SRAM. Any 32K or larger SRAM chip could be used for this project with minimal modifications. 
* [AT28C256](https://www.mouser.com/datasheet/2/268/doc0006-1108095.pdf) - 32K x 8 bit EEPROM. Any 32K or larger EPROM could be used with minimal modification to the wiring. EEPROMs are convenient for reprogramming, which we will likely do often.

## Design Notes

