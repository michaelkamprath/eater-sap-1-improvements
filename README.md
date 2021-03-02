# Eater SAP-1 Improvements
Ben Eater released [a YouTube video series](https://eater.net/8bit) that works you through the process of building a simple 8-bit computer on a breadboard made with simple logic gates. It's a great learning experience if you are so interested.

Captured in this repository are various projects to extend and improve on the original SAP-1. The goal of these project is to build upon and reinforce what was learned with Ben Eater's original series. 

# Projects
Multiple independent projects are described in this repository. It is recommended that you do them in the following order:

1. **[Halt system clock when programming](./clock-halt-when-programming/)** - Fixes the annoying issue that the SAP-1's microcode counter continues iterating when in program mode.
2. **[Making the 16 Byte RAM Module more reliable](./improving-reliability-of-ram-module/)** - Ben Eater's original design for the RAM module has two issues that cause the bread board computer to be unreliable. This project fixes those problems.
3. **[Expanding the SAP-1 Control Logic](./expanded-control-logic/)** - The original SAP-1 can control at most 16 control lines in the computer. This project add more control lines that and sets the SAP-1 up for other future expansions. 
4. **[Adding Two General Purpose Increment Registers to the SAP-1](./increment-registers/)** - This project adds to the SAP-1 two general purpose registers that have the ability to increment or decrement the value they contain.
5. **[Calculating Factorial](./calculating-factorial/)** - This project builds on everything done up to this point to enable the SAP-1 to calculating the _n!_ math algorithm. 


# Future Projects
The following projects are planned but have not been designed yet, however, I have put sufficient though into them or have seen other attempt them to be convinced that they are viable:
* Expanding the RAM to use 8-bit addressing
* Adding a boot ROM
* Improved ALU
* Adding a 8x8 LED pixel display
* Interfacing with the TMS9918a video processor (?)
* Interfacing with a 80's tech sound chip



# Interesting SAP-1 Links

* [SAP-1 Simulator](https://github.com/milen-patel/SAP-1)
* [Ben Eater Reddit forum](https://www.reddit.com/r/beneater/)


