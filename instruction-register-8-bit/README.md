# 8-bit Instruction Register

## Overview
The goal of this project was to do the natural next step of the previous 64K RAM/ROM upgrade and now extend the instruction register to use the full 8 bits, thus enabling at least 256 distinct instructions. To prepare for that, I went ahead and designed an 8-bit instruction set, and in that process, I realized that there were some shortcomings of my breadboard TTL CPU to date, and that I needed to iterate on some of my previous changes. So this project will not only update on the instruction register, but iterate on both the control lines architecture and the memory architecture. 

## Design Goals
1. The primary design goal for this change is to enable 8-bit instructions in my breadboard CPU. Furthermore, I would like to enable the ability to do extended instructions at least once, thus bringing the total possible instructions to 511. It's doubtful I'd ever use that main distinct instruction, but it's be nice to enable.
 * The motivation for using the full 8-bit instruction space is that the instruction can be "parameterize". The idea here is that the first few bits in the instruction byte indicate the actual operation, while the subsequent bits pertain to specific operands. Constructing instruction values in this way will make it easier to enable an assembler for my breadboard CPU's instruction set.
2. Update the control logic to enable full 8-bit instructions. Furthermore, In preparation for projects yet to come, rework the control logic to also enable more control lines.
 * My prior expansion of the control lic was not forward looking enough and was only sized for 6-bit instructions. As a result, the EEPROMs selected do not have enough address lines to enable 8-bit instruction, and 4 flag lines, and 3 bit steps, and and a few other inputs to the control logic I am thinking about. 
3. Iterate on the memory module to enable memory mapped I/O. While this project will not yet use the memory mapped I/O, I wanted to put the components for it in while I was restructuring things to address the needed changes in control logic. 
 * If I didn't introduce memory mapped I/O into the design, I would need to add more control logic and customize the microcode for every peripheral I would like to add. This will get out of hand rather soon, if it hasn't already. 
4. When designing the implementation of the goals above, before forward thinking about the eventual need to add a stack pointer, upgrade the ALU, add a more sophisticated output display, and add several other capabilities to the system.
 
# Design

## Instruction Set
To understand the architecture I need to be building towards, I found designing an instruction set be be a very informative exercise. The general approach was to define prefixes to define the type of operation, then bit parameters are appended to the prefix to define variations on that operation. 

A good example of this is the `mov` instruction, which is used to copy a value from one location to another. If, for example, we want to copy the value currently in register `A` to register `I`, the assembly instruction would look something like this:
```asm
mov i,a
```
To indicate this in the 8-bit instruction code, there would be a bit prefix to indicate a `mov` instruction, then two bit parameters to indicate both the destination and source registers. For example, something like this:
```
    Byte 0    
  ========== 
  01 011 001 
  -- --- --- 
   |  |   |   
   |  |   +------------ The byte code 110 indicating the second operand is register A
   |  +---------------- The byte code 011 indicating the first operand is register I
   +------------------- The byte code 01 indicating the mov instruction 
```
This then produces a single 8-bit value, `b01011001`, which represents the entire `mov i,a` instruction, and this instruction can then be programmed into the microcode. 

This approach can be extended to instruction that require numeric parameters. For example, consider this `mov` instruction place the immediate value `$F0` into register `A`:
```asm
mov a,$F0
```
In addition to the byte code for the instruction, the machine code will need the second operand's immediate value added to indicate the value. In this case, the bit parameter for the second operand would indicate that an immediate value would follow the instruction's byte, and the overall machine code would be constructed something like this:

```
    Byte 0    Byte 1
  ========== ========
  01 001 111 11110000
  -- --- --- --------
   |  |   |     |
   |  |   |     +------ The second operand's operand value of $F0 
   |  |   +------------ The byte code 111 indicating the second operand is a direct value
   |  +---------------- The byte code 001 indicating the first operand is register A
   +------------------- The byte code 01 indicating the mov mnemonic 
 ```
 
So to flesh out this approach, one just needs to define the instruction prefix bits and the set of operand parameter bits, and which operands would require trailing byte code values. There will be some instructions that do not require operand parameters, such as `HLT`, and some may only require 1 operand parameter. 

What came from this is an approach of defining "operand sets" that indicate the various values that can be the operand parameter for any given set of instructions. An important aspect of these operand sets is that depending on the type of instruction, the operand parameter bits are a set width, and thus the set of possible operand values have a set cardinality. For an 8-bit instruction, this limits the design of the actual CPU. For example, you could have a large number of registers in the CPU, but you may not be able to identify them in instructions given the limited bit width afforded in an 8-bit instruction. Of course, this issue could be mitigated by using an 16-bit instruction, but that would require a 16-bit instruction register and the ability for the control logic to be driven by 16-bit instruction. I take an alternate approach for expanding the instruction space beyond what a single 8-bit word affords by using an "extended instructions" approach I describe below. 

For the breadboard computer I intend to build, the types of operands sets I will need the following operand sets:

* **8-bit Value Source** - Represents a location from where an 8-bit value could be copied from. Examples include registers, immediate values, and values at specified memory locations. 
* **8-bit Value Destination** - Represents a location to where an 8-bit value could be copied to. Similar to the set of 8-bit Value Sources, but would not include an immediate value destination. 
* **16-bit Address Source** - These are sources where a 16-bit memory address value can be found. The most common one will be immediate values and 2-byte values that start at an indicated address.
* **Incrementable Destination** - The set of destinations that can be directly incremented or decremented. Examples include [the increment registers I added to the CPU a few projects back](../increment-registers/). 

A future iteration of this CPU could add 16-bit ValueSource/Destination type operands. 

Then, the definition ofo the instruction set begins to look like this:

| Instruction | Instruction Bit Prefix | Operand 1 Type | Operand 2 Type | Description |
|:-:|:--|:-:|:-:|:--|
| `hlt` | `b00000001` | - | - | Stop the system clock |
| `out` | `b00000011` | - | - | Copy value in register `A` to display register |
| `jmp X` | `b001011xx` | 16-bit Address Source | - | Set program counter to 16-bit value found at `X` |
| `jc X` | `b001100xx` | 16-bit Address Source | - | Set program counter to 16-bit value found at `X` if carry flag is set |
| `jz X` | `b001101xx` | 16-bit Address Source | - | Set program counter to 16-bit value found at `X` if zero flag is set |
| `mov X,Y` | `b01xxxyyy`| 8-bit Value Destination | 8-bit Value Source | Copy 8 bit value at source `Y` into destination `X` |
| `add X` | `b10111xxx` | 8-bit Value Source | - | Add value found at `X` to value in Register `A` |
| `sub X` | `b11001xxx` | 8-bit Value Source | - | Subtract value found at `X` from value in Register `A` |
| `inc X` | `b110110xx` | Incrementable Destination | - | Increment the value currently found n `X` |
| `dec X` | `b110110xx` | Incrementable Destination | - | Decrement the value currently found n `X` |

Of course, this is just a starting point and does not represent the full instruction set, but it already enables a much richer set of instructions than the original 4-bit instruction codes previously used. One thing I intend to do is not define meaningless instructions, such as `mov a,a`, and instead use the bit code that would have been used to construct the meaningless instruction for something else. 


### Extended Instructions
One thing that I realized when I was developing the full instruction set design is that 256 instructions is not really that much when you start to factor in combinatorics of all registers, indirect addresses, and direct values, the instruction set and fill up rather quick. So, I wanted to introduce the concept of extended instructions. These would be instructions that take two bytes to identify rather than just one. The benefit here is that the instruction set has more bits to allow for instructions with high cardinality operand sets. For example, the `mov` instruction takes up 25% of the 8-bit instruction space to enable all the possible combinations of operands. To create a similar type instruction, such as a `swap` instruction that allows the wapping of values between any register and/or memory location, there is likely not enough remaining instruction space to account for all the possible operand combinations after other instructions, such as jumps and ALU operations, are implemented. An extended instruction space could enable the creation of more such high cardinality instructions.

What I developed isn't very sophisticated. In the approach I developed, the first byte is an `XTD`, which is in the "normal" instruction set only flags that the next byte is an instruction from the extended set. To make this work, the instruction register needs to maintain an extended flag that indicates to the microcode whether the instruction is a "normal" or "extended" instruction.  This flag is implemented as a flip flop that gets set by a control line activated by the `XTD` instruction. This flip flop drives an address line into the microcode ROMs. Then from this point the next byte is loaded  is treated as a new instruction, but since the `XTD` bit is set on the microcode ROM address lines, the next byte can be a completely different instruction even if its bit pattern matches a "normal" instruction. The flip flop gets reset at the end of every instruction when the `SCr` (Step Counter Reset) control line is activated. 

## Instruction Register
The instruction register design is simply two 74LS173 4-bit flip flops with the addition of a single flip flop for the `XTD` bit using a 74LS74. Collectively these drive nine address lines of the microcode ROMs. 

Furthermore, a step counter is implemented with 74LS161 counter. The step counter is driven by the `/CLK` signal, and only three of its binary output are connected to address lines of the microcode ROMs, resulting in a maximum of 8 steps per instruction. 

Finally, the step counter reset circuit has a couple enhancements. As with before, it is driven either the `CLR` signal, the `SCr` signal, or exceeding the maximum allowed step. However, the when the step counter reset occurs, it also resets the `XTD` flip flop, unsetting the `XTD` bit if it was set. The second change is more with the `CLR` signal generation. As with before, this signal is generated by a push button. However, a simple power-on reset circuit is added to generate a reset signal when the computer is first powered so that the computer starts up in a a reset state. This signal is generated by a simple RC circuit, and as currently designed holds a reset signal for about 0.2 seconds after power on. 


## Control Logic


### Microcode

## Memory Map Controller

```
    0xFFFF  +-----+
            | RAM | <-- Stack
    0xF000  +-----+
            |     |
            | RAM | <-- Variables, programs
            |     |
    0x8000  +-----+
            | MAP | <-- Memory Mapped I/O
    0x7800  +-----+
            |     | 
            | ROM | <-- Boot code, programs
            |     |
    0x0000  +-----+

```

