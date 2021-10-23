# Stack Pointer

## Overview
I'm finally at the point where I can add what I feel is the key upgrade to my SAP-1 based TTL computer: a stack pointer. A stack pointer enables general purpose programming in a computer, specifically the ability to call and return from subroutines and the ability to effectively make temporary variables in memory. 



# Design

## Stack Operations

### Subroutine Calling

### Address Offset


### Setting Program Counter With Address Bus Value
The `call` instruction has a lot happening. Load immediate address, push value of program counter to stack, set program counter to the address. This sequence of control lines needed 9 total steps (including prefix) to make that instruction work, but the step counter only allows for 8. I could have changed the control logic to allow a step counter with 16 steps, but that didn't seem like the best approach. So I ended updating the design of the program counter to be able to read in a value either from the data bus or the address bus.

### Halt on Error
I have implemented a few error conditions into the design. these error conditions represent states for which there is no clear "next step" for the hardware. I would consider it to be a programming error if the states were ever achieved, however, the CPU wouldn't be able to gracefully recover without an undesirable amount of additional hardware. So I turn these error states into control signals that will cause the system clock to halt. At that point the only possible recovery is to manually reset the CPU.

The error states implemented in this project are:
* `ERR_AOC` - The address bus and the address offset value sum up that causes a carry to occur.
* `ERR_SPO` - The stack pointer was incremented or decremented beyond its valid 32K range.

### Control Line Assignment


| Control Line Position | Bank | Group | Symbol | Notes |
|:-:|:--|:--|:-:|:--|
|1 | Left | Direct | `HILO` | Indicates which byte of a 16-bit register is being operated on |
|2 | Left | Direct | `PCa` | Write program counter value to address bus |
|3 | Left | Direct | `ARa` | Write memory address register value to address bus |
|4 | Left | Direct | `SPa` | Stack pointer address activate |
|5 | Left | Direct | `NXa` | `NX` register address activate |
|6 | Left | Direct | `AOa` | Write Address Offset results to address bus adder |
|7 | Left | Direct | `XTD` | Activate extended instruction bit |
|8 | Left | Direct | `AOi` | Address Offset register in from data bus |
|9 | Left | Direct | `PCi` | Read data bus value into single program counter byte indicated by `HILO` |
|10 | Left | Direct | `IRi` | Read data bus value into instruction register |
|11 | Left | High | `MDi` | Memory device read from data bus |
|12 | Left | High | `Ai` | Read data bus value into `A` register |
|13 | Left | High | `Ti` | Read data bus value into temp register (attached to ALU) |
|14 | Left | High | `NXi` | Read data bus value into single `NX` register byte indicated by `HILO` |
|15 | Left | High | `Ii` | Read data bus value into `I` register |
|16 | Left | High | `Ji` | Read data bus value into `J` register |
|17 | Left | High | `ARi` | Read data bus value into single memory address register byte indicated by `HILO` |
|18 | Left | Low | `PCe` | Activate program counter increment |
|19 | Left | Low | `ARe` | Activate memory address register increment |
|20 | Left | Low |  `SPe` | Iincrements stack pointer value,  or decrements when `SUB` is active |
|21 | Left | Low | `Ie` | Activate register `I` increment, or decrement when `SUB` is active  |
|22 | Left | Low | `Je` | Activate register `J` increment, or decrement when `SUB` is active |
|23 | Left | Low |  `NXe` | `NX` register increment enable |
|24 | Left | Low |  | *unused* |
|25 | Right | Direct | `SUB` | Indicates whether the addition operation should instead be a subtraction operation |
|26 | Right | Direct |  | **Reserved:** `CRY`: input carry flag to ALU operation |
|27 | Right | Direct |  | **Reserved:** ALU `S0` |
|28 | Right | Direct |  | **Reserved:** ALU `S1` |
|29 | Right | Direct |  | **Reserved:** ALU `S2` |
|30 | Right | Direct |  | **Reserved:** ALU `S3` (1 for Shift, Rotate, etc; 0 for ALU) |
|31 | Right | Direct |  | **Reserved:** `INTr` (reset interrupt status) |
|32 | Right | Direct |  | **Reserved:** `INTi` (load interrupt status) |
|33 | Right | Direct | `AP1` | Add 1 to value on address bus |
|34 | Right | Direct | `ABo` | Write the byte indicated by `HILO` of the address bus to the data bus |
|35 | Right | High | `MDo` | Memory device output to data bus |
|36 | Right | High | `Ao`	 | Write contents of `A` register to data bus |
|37 | Right | High | `To` | Temp register (attached to ALU) |
|38 | Right | High |  | *unused* |
|39 | Right | High | `Io` | Write contents of `I` register to data bus |
|40 | Right | High | `Jo` | Write contents of `J` register to data bus |
|41 | Right | High | `∑o` | Write the results of the ALU operation to data bus |
|42 | Right | Low | `SCr` | Resets both the step counter, the offset register,  the extended instruction bit. A step counter overflow needs to do the same thing. |
|43 | Right | Low |  `SPr` | Reset stack pointer to "empty stack" value |
|44 | Right | Low |  `DSs` | Data source input select for registers that can load from either address or data bus. LOW is data bus, HIGH is address bus. |
|45 | Right | Low | `∑f` |  Write the ALU flags status to the flags register |
|46 | Right | Low | `If` |  Write register `I` flags status to the flags register |
|47 | Right | Low | `Jf` | Write register `J` flags status to the flags register |
|48 | Right | Low | `HLT` | Halt the system clock |

## Microcode
The "Beta 2" microcode configuration for this project is available [here](./microcode/). I have also visualized the microcode in [a spreadsheet here](https://docs.google.com/spreadsheets/d/18CuuxS1goGVBhtNIjpiRaWfcekohQJE2gV_eJJca56g/edit?usp=sharing).