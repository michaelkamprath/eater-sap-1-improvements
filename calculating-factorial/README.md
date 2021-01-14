# Factorial on SAP-1
## Project Overview
The goal of this project is to figure out how to enable the SAP-1 to calculating the factorial function within the confines of the 16 bytes of RAM that the original SAP-1 design has. As a reminded, the factorial function is defined to be:

![Factorial Equation](https://latex.codecogs.com/svg.latex?factorial%28n%29%3Dn%20%5Ctimes%20%28n-1%29%20%5Ctimes%20%28n-2%29%20%5Cldots%202%20%5Ctimes%201)


It turns that that the unenhanced SAP-1 as Ben Eater originally designed cannot accomplish this goal. While the instruction set can accomplish the goal, more than 16 bytes of RAM is needed to encompass the two loops needed to calculate factorial. It might be surprising that more than one loop is needed, but since the SAP-1 does not have a direct multiplication operation, multiplications have to be calculated by repeated addition operations. 

To illustrate the two loops needed, here is an implementation of factorial in Python that does not use any multiplication operation:

```
def factorial(n):
  result = n
  for i in range(n-1,1,-1):
    x = result
    for j in range(i,1,-1):
      result += x
  return result
```

The challenge with this factorial algorithm is that is has two loops and a variable into which the results is accumulated. Handling the loops requires a number of instructions simply to move the iterated variable into the A register and then add or subtract 1 from it. This is what causes the factorial algorithm to not fit within the 16 bytes of memory available in the SAP-1. To illustrate this, here is how factorial would be implemented using he original SAP-1 instructions set if there was no RAM limitations:
```
 0: LDA 25      ; Load N value
 1: STA 23      ; Store N value in results variable
 2: SUB 20      ; Subtract 1 from I. On first pass, N and I are equivalent
 3: JZ 17       ; If I is 0, end both loops
 4: STA 21      ; Save current I value
 5: STA 22      ; Initialize J value with current I value
 6: LDA 23      ; Load results variable
 7: STA 24      ; Store results variable to X variable
 8: LDA 22      ; Load J loop index
 9: SUB 20      ; Decrement J
10: JZ 15       ; End J loops if J is zero
11: LDA 23      ; Load results variable
12: ADD 24      ; Add X variable to results variable
13: STA 23      ; Save updated results variable
14: JMP 8       ; restart J loop
15: LDA 21      ; Load current I index
16: JMP 2       ; restart I loop
17: LDA 23      ; Load results variable
18: OUT         ; Display results
19: HLT         ; end program
20:             ; storage location for value of 1
21:             ; Storage location for I index variable
22:             ; storage location for J index variable
23:             ; storage location for results variable
24:             ; storage location for X variable
25:             ; storage location for N value
```

As can be seen, more than 16 bytes are needed to implement factorial in the original SAP-1 instruction set.

## Solution Approach
One idea for solving this would be to add a "subtract immediate" type command that does not require an additional memory location to story the 1 value. However all this does is remove the requirement for the memory location to store the 1-value, and it still requires too many load and store commands to move values in and out of the A register to iterate through both loops and do the results accumulation. 

Another approach that does allow for the factorial machine code to be within 16 bytes is to add two new registers to the SAP-1 that have integrated up/down counters. Call these registers `I` and `J`. These registers would behave similar to the existing `A` register, except that they can be signaled to either increment or decrement the register's value without directly interacting with the ALU. These then can be used to manage the I and J loops in this factorial algorithm.

If you had such registers, the commands you could create using these registers include:

* `INCx` - Increment value in register `x` (`I` or `J`). If incrementing from 255, carry flag and zero is set.
* `DECx` - Decrement value in register `x`. If decrement results in zero, zero flag is set. 
* `LDx` - Load into register `x` the value found at the memory location specified in command parameter.
* `STx` - Store current value in register `x` into memory location in command parameter.
* `MVxy` - Copy (move) value in register `x` to register `y`. For example, `CPIJ` would copy the value in register `I` to register `J`. 

Also, for clarity, load immediate instructions will be notated `LDiX` (note the lower case `i`) where `X` is the register the lower 4 bits if the instruction will be loaded into.

The SAP-1 uses a 4-bit instruction code and thus has room for the definition of 16 different instructions. The original instruction set has 12 defined instructions, leaving room for only 4 new instructions. For the factorial algorithm with the `I` and `J` registers, we would need the `DECI`, `DECJ`, `LDI`, and `CPIJ` instructions in addition to the original SAP-1 instruction set. With those new instructions defined and the corresponding I and J registers implemented in hardware, the factorial program then becomes:

```
 0: LDI 15    ; Load value N in register I
 1: LDA 15    ; Load register A with N value
 2: DECI      ; decrement I. start of outer I loop
 3: JZ 12     ; jump to end of loop of I is zero
 4: STA 14    ; Store current A register to results variable, "X variable"
 5: MVIJ      ; Copy current I value to J for multiplication loop
 6: DECJ      ; decrement J before start of multiplication loop
 7: JZ 2      ; don't start multiplication loop if J started at 1
 8: ADD 14    ; Add "x variable" to A
 9: DECJ      ; decrement multiplication loop
10: JZ 2      ; exit multiplication loop if at zero
11: JMP 8     ; multiplication loop
12: OUT       ; register A still contains accumulated results
13: HLT       ; end of program
14:           ; storage location for X variable
15:           ; storage location for input N
```

Here, the `A` register is equivalent to the python `results` variable, and memory location 14 is equivalent to the variable `x`. Also notice we effectively get the equivalent of the non-inclusive end of range value in the python loops. 

## Solution Design

### Expanding the Control Logic
The original SAP-1 only has capacity for 16 distinct control lines, and uses them all. In order to add additional registers as described, more control lines are needed. So we will need to expand the SAP-1 CPU control logic. [This project documented here](../expanded-control-logic/) describes the approach for adding additional control lines to the control logic of the SAP-1. 

### `I` and `J` Counting Registers
Creating counting registers proved to be a mild challenge, mostly on the part of integrating the counting registers' `Z` and `C` flags with the rest of the computer. [This project documented here](../counting-registers/) describes both how to build the counting registers and how to integrate them into a SAP-1 with the expanded control logic. Implementing the factorial algorithm requires two fo these counting registers, `I` and `J`.

### Microcode
The [microcode included with the original counting register implementation project](../counting-registers/microcode/) is the correct microcode for this project. 

