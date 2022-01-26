

* Add and subtract instructions have a "with carry" version
* The A register can shift and rotate values left or right.
* A "test bit" instruction will test a 8-bit source and set the Z flag accordingly. Uses a 74ls151 8-to-1 selector, and a 74ls173 4-bit register to store bit selection. 
* The test bit hardware can also add ability to check for a zero and negative value on the 8-bit value and set the flags accordingly. Would have to be its own instruction though.
* A compare function


## Control Logic
### Flags
There are now four status flags on the system that provide input to the control logic. Some of these flags have slight different means depending on what unit set it. The flags and how they are set are:
* `ZF` - **zero** - Set when the results of a math or logic operation results in a zero value, when the increment/decrement operation in the `I` or `J` register results in a zero value, or when the bit being tested is equal to zero.
* `CF` - **carry** - Set when the addition math operation results in a carry, the subtraction math operation does not require a borrow, when the increment operation in the `I` or `J` register results in a carry, or when the left or right shift operation in the A register shifts a one-valued bit out.
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
|9 | Left | Direct | `PCi` | Read data bus value into single program counter byte indicated by `HILO` |
|10 | Left | Direct | `IRi` | Read data bus value into instruction register |
|11 | Left | High | `MDi` | Memory device read from data bus |
|12 | Left | High |  | *unused* |
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
|36 | Right | High | `Ao`	 | Write contents of `A` register to data bus |
|37 | Right | High | `To` | Write at the temp register byte indicated by `HILO` to the data bus |
|38 | Right | High |  | *unused* |
|39 | Right | High | `Io` | Write contents of `I` register to data bus |
|40 | Right | High | `Jo` | Write contents of `J` register to data bus |
|41 | Right | High | `∑o` | Write the results of the ALU operation to data bus |
|42 | Right | Low | `SCr` | Resets both the step counter, the offset register,  the extended instruction bit. A step counter overflow needs to do the same thing. |
|43 | Right | Low |  `SPr` | Reset stack pointer to "empty stack" value |
|44 | Right | Low |  `DSs` | Data source input select for 16-bit registers that can load from either address or data bus. LOW is data bus, HIGH is address bus. |
|45 | Right | Low |  |  *unused* |
|46 | Right | Low | `If` |  Write register `I` flags status to the flags register |
|47 | Right | Low | `Jf` | Write register `J` flags status to the flags register |
|48 | Right | Low | `HLT` | Halt the system clock |

The significant changes over the last project are:

* `CRY`, `S0`, `S1`, `S2`, and `S3` control bits are added to manage the ALU through the gate array logic. 
* Register `A` reading in from the data bus is now controlled by the ALU control bits rather than a dedicated control line `Ai`.
* The `∑f` control line for controlling when the flag register reads in flags from the ALU is replaced by the ALU control bits.
* The temp register is now 16-bit so `Ti` and `To` are moderated by the `HILO` control line.
* The `SUB` signal is now relevant only to decrement operations in the `I`, `J`, and `HL` registers.

### Gate Array Logic
#### ALU Instruction Control Line Configurations
The gate array logic for the ALU controller is configured such that the following control line configurations effect the indicated operation:

| Operation | Description | `CRY` | `S0` | `S1` | `S2` | `S3` | Flags Set? |
|:--|:--|:-:|:-:|:-:|:-:|:-:|:-:|
| `Ai` | Copy data buss value into the `A` register. Replaces `Ai` control line. | X | 1 | 1 | 0 | 1 | - |
|`add`| Add low temp value to `A` register | 0 | 1 | 1 | 0 | 0 | `ZF`, `CF`, `OF` |
|`addc`| Add low temp value and carry flag to `A` register | 1 | 1 | 1 | 0 | 0 | `ZF`, `CF`, `OF` |
|`sub`| Subtract low temp value from `A` register | 0 | 0 | 1 | 0 | 0 | `ZF`, `CF`, `OF` | 
| `subb` | Subtract low temp value from `A` register with carry flag used to indicate whether borrow is taken from `A` when `CF` = 0. | 1 | 0 | 1 | 0 | 0 | `ZF`, `CF`, `OF` |
| `and` | AND low temp value with register `A` | X | 0 | 1 | 1 | 0 | - |
| `or` | OR low temp value with register `A` | X | 1 | 0 | 1| 0 | - |
| `xor` | XOR low temp value with register `A` | X | 0 | 0 | 1 | 0 | - |
| `lsr` | logical shift right register `A` | 0 | 1 | 0 | 0 | 1 | `CF` |
| `lsrc` | logical shift right register `A` with carry flag filling in leftmost bit | 1 | 1 | 0 | 0 | 1 | `CF` |
| `lsl` | logical shift left register `A` | 0 | 0 | 1 | 0 | 1 | `CF` |
| `lslc` | logical shift left register `A` with carry flag filling in rightmost bit | 1 | 0 | 1 | 0 | 1 | `CF` |
| `rotr` | rotate bits in register `A` right one | X | 1 | 0 | 1 | 1 | - |
| `rotl` | rotate bits in register `A` left one | X | 0 | 1 | 1 | 1 | - |
| `comp` | determine the equality or greater than of high temp with database value | X | 1 | 1 | 1 | 1 | `OF`, `EF` |
| `tstb` | determine if a bit is zero for a value on the data bus  | X | 0 | 0 | 0 | 1 | `ZF` |



