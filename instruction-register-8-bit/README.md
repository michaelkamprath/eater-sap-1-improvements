# 8-bit Instruction Register

## Overview
The goal of this project was to do the natural next step of the previous 64K RAM/ROM upgrade and now extend the instruction register to use the full 8 bits, thus enabling at least 256 distinct instructions. To prepare for that, I went ahead and designed an 8-bit instruction set, and in that process, I realized that there were some shortcomings of my breadboard TTL CPU to date, and that I needed to iterate on some of my previous changes. So this project will not only update on the instruction register, but iterate on both the control lines architecture and the memory architecture. 

## Design Goals
1. The primary design goal for this change is to enable 8-bit instructions in my breadboard CPU. Furthermore, I would like to enable the ability to do extended instructions at least once, thus bringing the total possible instructions to 511. It's doubtful I'd ever use that main distinct instruction, but it's be nice to enable.
 * The motivation for using the full 8-bit instruction space is that the instruction can be "parameterize". The idea here is that the first few bits in the instruction byte indicate the actual operation, while the subsequent bits pertain to specific operands. Constructing instruction values in this way will make it easier to enable an assembler for my breadboard CPU's instruction set.
2. Update the control logic to enable full 8-bit instructions. Furthermore, In preparation for projects yet to come, rework the control logic to also enable more control lines.
 * My prior expansion of the control lic was not forward looking enough and was only sized for 6-bit instructions. As a result, the EEPROMs selected do not have enough address lines to enable 8-bit instruction, and 4 flag lines, and 3 bit steps, and and a few other inputs to the control logic I am thinking about. 
3. Iterate on the memory module to enable memory mapped I/O. While this project will not yet use the memory mapped I/O, I wanted to put the components for it in while I was restructuring things to address the needed changes in control logic. 
 * If I didn't introduce memory mapped I/O into, I would need to add more control logic and customize the microcode for every peripheral I would like to add. This will get out of hand rather soon, if it hasn't already. 
4. When designing the implementation of the goals above, before forward thinking about the eventual need to add a stack pointer, upgrade the ALU, add a more sophisticated output display, and add several other capabilities to the system.
 
# Design
## Instruction Set

## Instruction Register

## Control Lines and Microcode

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

