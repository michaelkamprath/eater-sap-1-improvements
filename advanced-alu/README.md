

* Add and subtract instructions have a "with carry" version
* The A register can shift and rotate values left or right.
* A "test bit" instruction will test a 8-bit source and set the Z flag accordingly. Uses a 74ls151 8-to-1 selector, and a 74ls173 4-bit register to store bit selection. 
* The test bit hardware can also add ability to check for a zero and negative value on the 8-bit value and set the flags accordingly. Would have to be its own instruction though.
* A compare function


## Design
### Flags
There are now four status flags on the system that provide input to the control logic. Some of these flags have slight different means depending on what unit set it. The flags and how they are set are:
* `ZF` - **zero** - Set when the results of a math or logic operation results in a zero value, when data bus value being tested is zero, or when the bit being tested is equal to zero.
* `CF` - **carry** - Set when the addition math operation results in a carry, the subtraction math operation does not require a borrow, or when the left or right shift operation in the A register shifts a one-valued bit out.
* `OF`  - **overflow** - Set when the math operation of the `74LS382` results in an overflow or when the compare operation indicates that the left hand value (the value in the high byte of the temp register) is greater than the right hand value (the value being read from the data bus).
* `EF` - **equal** - Set when compare operation indicates both values are equal. 

One flag that is not present that one frequently sees in these sort of projects is the negative flag, set if bit 7 of a value it equal to 1. I did not implement it here because I don't yet see the use case and if I ever did need it, the bit testing functionality being implemented in this project would fully cover that use case (one would just test bit 7). 

### Control Line Assignment
This project continues to use the control logic design introduced in the [8-Bit Instruction Register project](../instruction-register-8-bit/), however the control line assignments are redone some. The control line assignments are:

| Control Line Position | Bank | Group | Symbol | Notes |
|:-:|:--|:--|:-:|:--|
|1 | Left | Direct | `HILO` | Indicates which byte of a 16-bit register is being operated on |
|2 | Left | Direct | `PCa` | Write program counter value to address bus |
|3 | Left | Direct | `ARa` | Write memory address register value to address bus |
|4 | Left | Direct | `SPa` | Stack pointer address activate |
|5 | Left | Direct | `HLa` | `HL` register address activate |
|6 | Left | Direct | `AOa` | Write Address Offset results to address bus adder |
|7 | Left | Direct | `XTD` | Activate extended instruction bit |
|8 | Left | Direct | `AOi` | Address Offset register in from data bus |
|9 | Left | Direct | `PCi` | Read data bus value into single program counter byte indicated by `HILO`, or address bus value if `DSs` is selected |
|10 | Left | Direct | `IRi` | Read data bus value into instruction register |
|11 | Left | High | `MDi` | Memory device read from data bus |
|12 | Left | High | `Ai` | Read data bus value into `A` register |
|13 | Left | High | `Ti` | Read data bus value into singled byte of temp register indicated by `HILO` |
|14 | Left | High | `HLi` | Read data bus value into single `HL` register byte indicated by `HILO` |
|15 | Left | High | `Ii` | Read data bus value into `I` register |
|16 | Left | High | `Ji` | Read data bus value into `J` register |
|17 | Left | High | `ARi` | Read data bus value into single memory address register byte indicated by `HILO` |
|18 | Left | Low | `PCe` | Activate program counter increment |
|19 | Left | Low | `ARe` | Activate memory address register increment |
|20 | Left | Low |  `SPe` | Increments stack pointer value,  or decrements when `SUB` is active |
|21 | Left | Low | `Ie` | Activate register `I` increment, or decrement when `SUB` is active  |
|22 | Left | Low | `Je` | Activate register `J` increment, or decrement when `SUB` is active |
|23 | Left | Low |  `HLe` | `HL` register increment enable |
|24 | Left | Low |  | *unused* |
|25 | Right | Direct | `SUB` | Indicates whether the increment operation should instead be a decrement operation |
|26 | Right | Direct | `CRY` | Use carry flag to ALU operation |
|27 | Right | Direct | `S0` | ALU control bit `S0` |
|28 | Right | Direct | `S1` | ALU control bit `S1` |
|29 | Right | Direct | `S2` | ALU control bit `S2` |
|30 | Right | Direct | `S3` | ALU control bit `S3` |
|31 | Right | Direct |  | **Reserved:** `INTr` (reset interrupt status) |
|32 | Right | Direct |  | **Reserved:** `INTi` (load interrupt status) |
|33 | Right | Direct | `AP1` | Add 1 to value on address bus |
|34 | Right | Direct | `ABo` | Write the byte indicated by `HILO` of the address bus to the data bus |
|35 | Right | High | `MDo` | Memory device output to data bus |
|36 | Right | High | `Ao` | Write contents of `A` register to data bus |
|37 | Right | High | `To` | Write at the temp register byte indicated by `HILO` to the data bus |
|38 | Right | High | `Fo` | Writes the Flags register to the data bus |
|39 | Right | High | `Io` | Write contents of `I` register to data bus |
|40 | Right | High | `Jo` | Write contents of `J` register to data bus |
|41 | Right | High | `∑o` | Write the results of the ALU operation to data bus |
|42 | Right | Low | `SCr` | Resets both the step counter, the offset register,  the extended instruction bit. A step counter overflow needs to do the same thing. |
|43 | Right | Low |  `SPr` | Reset stack pointer to "empty stack" value |
|44 | Right | Low |  `DSs` | Data source input select for 16-bit registers that can load from either address or data bus. LOW is data bus, HIGH is address bus. |
|45 | Right | Low | `CMPs` | Write the High byte of the temp register to the comparison unit |
|46 | Right | Low |  | *unused* |
|47 | Right | Low |  | *unused* |
|48 | Right | Low | `HLT` | Halt the system clock |

The significant changes over the last project are:

* `CRY`, `S0`, `S1`, `S2`, and `S3`, `CMPi` control bits are added to manage the ALU through the gate array logic. 
* The `∑f` control line for controlling when the flag register reads in flags from the ALU is replaced by the ALU control bits.
* `If` and `Jf` flags control lines removed. Now, microcode will use the comparison unit to test for zero in the `I`, `J`, and `HL` registers during increment and decrement operations.
* `Fo` flags out control line added
* The temp register is now 16-bit so `Ti` and `To` are moderated by the `HILO` control line.
 * ERROR - The temp register being controled by `HILO` creates problems in microcode when using `ABo`.
* The `SUB` signal is now relevant only to decrement operations in the `I`, `J`, and `HL` registers.

### Gate Array Logic
#### ALU Instruction Control Line Configurations
The gate array logic for the ALU controller is configured such that the following control line configurations effect the indicated operation:

| Operation | Description | `CRY` | `S0` | `S1` | `S2` | `S3` | `CMPi` | Flags Set? |
|:--|:--|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|`add`| Add low temp value to `A` register | 0 | 1 | 1 | 0 | 0 || `ZF`, `CF`, `OF` |
|`addc`| Add low temp value and carry flag to `A` register | 1 | 1 | 1 | 0 | 0 || `ZF`, `CF`, `OF` |
|`sub`| Subtract low temp value from `A` register | 0 | 0 | 1 | 0 | 0 || `ZF`, `CF`, `OF` | 
| `subb` | Subtract low temp value from `A` register with carry flag used to indicate whether borrow is taken from `A` when `CF` = 0. | 1 | 0 | 1 | 0 | 0 || `ZF`, `CF`, `OF` |
| `and` | AND low temp value with register `A` | 0 | 0 | 1 | 1 | 0 || `ZF` |
| `or` | OR low temp value with register `A` | 0 | 1 | 0 | 1| 0 || `ZF` |
| `xor` | XOR low temp value with register `A` | 0 | 0 | 0 | 1 | 0 || `ZF` |
| `lsr` | logical shift right register `A` | 0 | 1 | 0 | 0 | 1 || `CF` |
| `lsrc` | logical shift right register `A` with carry flag filling in leftmost bit | 1 | 1 | 0 | 0 | 1 || `CF` |
| `lsl` | logical shift left register `A` | 0 | 0 | 1 | 0 | 1 || `CF` |
| `lslc` | logical shift left register `A` with carry flag filling in rightmost bit | 1 | 0 | 1 | 0 | 1 || `CF` |
| `rotr` | rotate bits in register `A` right one | X | 1 | 0 | 1 | 1 || - |
| `rotl` | rotate bits in register `A` left one | X | 0 | 1 | 1 | 1 || - |
| `comp` | determine the equality or greater than of high temp with database value | X | 1 | 1 | 1 | 1 | 1 | `OF`, `EF` |
| `tstz` | determine whether a data bus value is zero | X | 1 | 1 | 1 | 1 | 0 | `ZF` |
| `tstb` | determine if a bit is zero for a value on the data bus  | X | 0 | 0 | 0 | 1 || `ZF` |

### Updated Extended Instruction Logic
One of the shortcomings of my 8-bit instruction register project was how I enabled the `XTD` bit. The `XTD` bit effectively made the instruction register a 9-bit instruction space, and this bit would be set by a control line. The unfortunate design element is that when the `XTD` bit got set, the step counter was not itself reset. So, if the `XTD` bit get set on step 2 of an instruction, the first step under the `XTD` bit space would be step 3. The primary issue with the design is that the `SCr` control line is what was used to reset both the step counter and the `XTD` bit.

To address this issue, I updated what the `XTD` control line does. It now not only sets the `XTD` bit, but also reset the step counter. The step counter is reset near the falling edge of the clock after the `XTD` bit is set. That way, the first step with the `XTD` bit is set is step 0. Note that the `XTD` bit still gets reset on `SCr`, step counter overflow, and `CLR`.  To use the `XTD` control line properly in microcode, the XTD control line must be active on both the extended and non-extended version of the instruction step. Because of this, if a new instruction value is not loaded while in the extended steps, the `SCr` control line should be asserted before the extended step that contains the `XTD` control line. Furthermore, the `XTD` control line should not be asserted on step 7 because the hardware will reset the `XTD` bit at the end of step 7. With careful usage, this mechanism can also be used to extend the steps of an instruction from a max usable of 7 useful steps to 11 useful steps.

### Comparison Unit
The comparison unit is intended to provide general value comparison to the PUTEY-1. The basic design goal is to compare the value on the data bus to a reference value, and then set flags accordingly. There are two parts to the comparison unit implemented. The actual comparison operation is select by the ALU control lines as indicated above.

#### Value Comparison
The value comparison part uses a 74LS682 8-bit comparator to compare the data bus value to either the value in the high byte of the temp register, or to zero. The 74LS682 as able to magnitude comparison and equality comparison, and this allows this part to set a `ZF` zero flag, `EF` equal flag, or `OF` overflow flag (which in this context means "greater than"). The `CMPs` line selects whther the comparison is being made to the temp register high byte or zero.  When `CMPs` is LOW, the value comparison part compares the bus value to zero setting the `ZF` if it is equal to zero, and when `CMPs` is HIGH, the databuys value is compared to the value in the high byte of the temp register, setting `EF` if they are equal or settin `OF` if the temp register high byte is greater than the data bus value.

#### Bit Testing
The bit testing part uses a  multiplexer to determine if a specific bit on the data bus is equal to zero or not. The 74LS151 requires a 3 bit value to select which input bit to select. This is provided by the lest signficant 3 bits of the high byte of the temp register. Then, the `ZF` zero flag is set if the selected data bus bit is equal to zero.

### Updated Counting Registers `I` and `J`
While I was happy with the `I` and `J` counting registers when I built them, time and use has shown me that they were probably more complicated than they needed to be. Specifically the circuitry to detect zero and carry conditions. In this build, I decided to simplify these registers' implementation by removing the zero and carry detection, and then leverage the comparison unit to detect zero values on increment and decrement operations. This means there is no longer a carry flag generated by the `I` and `J` registers. This is OK, as the carry flag was detected when an increment operation resulted in a zero value. One can just detect the zero value directly.

After removing the circuitry for flag detection, the `I` and `J` registers reduced down to each being two 74LS169 up/down counters and a 74LS245 bus transceiver.

