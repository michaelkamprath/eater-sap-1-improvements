# Eater SAP-1 Improvements
Ben Eater released [a YouTube video series](https://eater.net/8bit) that works you through the process of building a simple 8-bit computer on a breadboard made with simple logic gates. It's a great learning experience if you are so interested.

Captured in this repository are various projects that extend and improve on the original SAP-1. The goal of these project is to build upon and reinforce what was learned with Ben Eater's original series.

Note that I've made a video explaining most of these projects. The video series [can be found here](https://www.youtube.com/playlist?list=PLC4jDTViU38EQzCYaRsoOLeGLLW5cMN4A).

# Projects
Multiple independent projects are described in this repository. It is recommended that you do them in the following order:

1. **[Halt system clock when programming](./clock-halt-when-programming/)** - Fixes the annoying issue that the SAP-1's microcode counter continues iterating when in program mode.
2. **[Making the 16 Byte RAM Module more reliable](./improving-reliability-of-ram-module/)** - Ben Eater's original design for the RAM module has two issues that cause the bread board computer to be unreliable. This project fixes those problems.
3. ~~**[Expanding the SAP-1 Control Logic](./expanded-control-logic/)**~~ - **It is recommended that this project be skipped in instead implement the control lines expansion describe in the Instruction Register project below**. The original SAP-1 can control at most 16 control lines in the computer. This project add more control lines that and sets the SAP-1 up for other future expansions.
4. **[Adding Two General Purpose Increment Registers to the SAP-1](./increment-registers/)** - This project adds to the SAP-1 two general purpose registers that have the ability to increment or decrement the value they contain.
5. **[Calculating Factorial](./calculating-factorial/)** - This project builds on everything done up to this point to enable the SAP-1 to calculating the _n!_ math algorithm.
6. ~~**[Adding 64K of RAM and ROM](./ram-rom-upgrade/)**~~ - **It is recommended that this project be partially skipped. The program counter, memory address register, and run mode selector from this project should be completed, but is recommended to skip the rest and implement the 16 bit memory architecture describe in the Instruction Register project below**. This project changes the SAP-1's memory address space to 16 bit, and then splits the address space between ROM and RAM. The original 4-bit instructions are still maintained, as that will be changed in a later project. This project also introduces an assembler to help build the ROM code.
7. **[Instruction Register and Memory Map Update](./instruction-register-8-bit/)** - In this project I upgrade the instruction register to use the full 8-bits. I also realized that I once again needed to upgrade my control logic, so I expanded the instruction-based control logic plus added a memory map mechanism.
8. **[Stack Pointer and Index Register](./stack-pointer/)** - A stack pointer is added to enable things like subroutines and stack memory. Also adds an index register that can be used to track 16-bit values and memory addresses.
9. **[LCD Display](./lcd-display/) - A 20x4 LCD character display is added to give the TTL CPU the ability to display more complex output to the user than is afforded by the original 8-bit display of the SAP-1. 


# Future Projects
The following projects are planned but have not been designed yet, however, I have put sufficient thought into them or have seen other attempt them to be convinced that they are viable:
* Improved ALU
* Adding a 8x8 LED pixel display
* Interfacing with the TMS9918a video processor (?)
* Interfacing with a 80's tech sound chip



# Interesting SAP-1 Links

* [SAP-1 Simulator](https://github.com/milen-patel/SAP-1)
* [Ben Eater Reddit forum](https://www.reddit.com/r/beneater/)


