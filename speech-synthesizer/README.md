

Documentation

* [The Speech Synthesizer Module](https://www.unige.ch/medecine/nouspikel/ti99/speech.htm) - A thorough description of how the TMS5220 is used in the Texas Instruments 99/4a Spec Synthesizer.

## Design Approach
The TMS5220C is not straightforward to interface with. At issue is the fact is it s "slow memory device". Care needs to be taken to not interact with the chip too fast. It has a `READY` pin used to indicate when the chip cannot be interacted with. Back in the day, this line would be used to halt the clock of the CPU just to prevent interactions. I remember playing games on my TI 99/4a and the whole game would halt when the speech synthesizer would talk. I do not want to implement things this way.

My desired interface is to send the TMS5220 module some information, then poll ti determine when it is ready for the next operation. To do this, I need to implement a register to hold information, and logic to manage each transaction. The hardware design I am using does not connect the TMS5220 to a speech ROM, so that simplifies the design. 

Given that this design does not support using a speech ROM, writing data will be done for and in conjunction with the following TMS5220 commands:

| Command | Byte Value | Description |
|:-:|:-:|:--|
|NOP| `x000xxxx` | No operation |
| Speak External | `x110xxxx` | Start the process of loading "external" speech data. |
| Reset | `x111xxxx` | Resets the TMS5220, but does not halt a speak external in process. |
| Load Frame Rate | `x0x0xvrr` | Indicates whether a fixed frame rate should be used. (rr=rate code, v=0:use rr, 1: variable) _TMS5520C only_ |

This module is designed around supporting the above instructions.

## Speech Module Operations
The speech module will have the following memory mapped interfaces:

| ID | A1 | A0 | Read/Write | Description |
|:-:|:-:|:-:|:-:|:--|
|`DATA_IN`|0|0| W |Register used for writing commands and data to the TMS5220|
|`FETCH_STATUS`|0|1| R/W | Register to initiate fetching and then read the TMS5220 status |
|`MODULE_STATE`|1|0|R| Register to read the module state |

All of the operations below assume the data registers clock in their value on the rising edge and are not transparent latches.

### Write Byte to Data Register
Since this design only supports "speak external" speech operation, writing a byte to the TMS5220 is designed around the timing requirements as specified in the TMS5220 data sheet under "WRITE CYCLE FOR EXTERNAL SPEECH DATA". From the TMS5220's perspective, the sequence of events are:

1. The `/WS` pin goes low
2. When the TMS5200 is ready to receive data, the `/READY` pin will go high. 
3. Within 6 uS later, the data pins will be read for the input byte.


To hardware of this module will behave as follows:

0. The output of the `DATA_IN` registers starts in high-z state.
1. The CPU will write the byte value to the memory mapped `DATA_IN` 74LS173-based register. This is done as per the normal clock cycle using a `MDi` (memory device in) CPU operation, and only if the `MODULE_BUSY` status flag is unset.
2. When the data for the `DATA_IN` register is latched in, the speech module will set the `MODULE_BUSY` status flag and place the `/WS` pin on the TMS5220 low.
3. Independent of the system clock, when TMS5220 `/READY` pin goes high, the 74LS173s of the `DATA_IN` register will have their output enabled. 
4. When the `/READY` pin goes low, then the 74LS173s of the `DATA_IN` will have their outputs returned to high-Z (disabled), and the `MODULE_BUSY` status flag will get unset.

Given this sequence, software should always check that the `MODULE_BUSY` status flag is unset before attempting to write a byte to the `DATA_IN` register.

### Fetch TMS5220 Status
The TMS5220 has an internal status register that can be red when the `/RS` pin on the TMS5220 is taken low. However, it takes about 6-12 uS from the time `/RS` is brought low until the status is presented on the TMS5220 data pins. This happens when the `/READY` line is brought low, so that can be used a signal that the status is ready. 

To enable this action, fetching the TMS5220 status will be a two step process. The first step will be to write any value to the `FETCH_STATUS` register. This will trigger the process of fetching the TMS5220 status as follows:

1. When the  `FETCH_STATUS` memory mapped address lines are configured and the CPU data operation is `MDi` (memory device in) and the `MODULE_BUSY` is currently unset, on the rising edge of the system clock the `/RS` line will be brought low. Furthermore, the `MODULE_BUSY` status flag will get set.
2. Independent of the system clock, when the `/READY` line goes high, then the `FETCH_STATUS` register chip's input will get enabled, and then when the `/READY` returns to low, the data value will get latched into the register chip on the subsequent system clock going high. 
3. When the system clock goes low after the last step, the `/RS` line will be brought back high, and the `MODULE_BUSY` status flag will get unset.

At this point, after the `MODULE_BUSY` is unset, the CPU can read the value in the `FETCH_STATUS` register with a `MDo` (memory device out) operation. Note that since the TMS5220 status is latched into the `FETCH_STATUS` register, it only gets updated with the fetch process described above. This should be kept in mind when designing software for this module.

### Get Module State
The `MODULE_STATE` memory mapped address will support a read (`MDo` - memory device out) operation at any time. It will provide the state of the following in the form of status bits:

| Bit | Name | Description |
|:-:|:-:|:--|
|0|`MODULE_BUSY `|The TMS5220 is doing something and the module cannot perform any operation at the moment.|
|2|`/READY`|The state of the TMS5220 `READY` pin. This is an active low line.|
|3|`/INT`|The state of the TMS5220 interrupt pin. This is an active low line.|


### Hardware Reset
When the CPU `RST` line goes high ...

## Hardware Design

### Implementing Logic with ATF22V10C

### Flags Register Update

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
|7 | Left | Direct | `Fi` | Reads into the flags register from the data bus |
|8 | Left | Direct | `AOi` | Address Offset register in from data bus |
|9 | Left | Direct | `PCi` | Read data bus value into single program counter byte indicated by `HILO`, or address bus value if `DSs` is selected |
|10 | Left | Direct | `IRi` | Read data bus value into instruction register |
|11 | Left | High | `MDi` | Memory device read from data bus |
|12 | Left | High | `Ai` | Read data bus value into `A` register |
|13 | Left | High | `Ti` | Read data bus value into temp register |
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
|37 | Right | High | `To` | Write at the temp register to the data bus |
|38 | Right | High | `Fo` | Writes the Flags register to the data bus |
|39 | Right | High | `Io` | Write contents of `I` register to data bus |
|40 | Right | High | `Jo` | Write contents of `J` register to data bus |
|41 | Right | High | `∑o` | Write the results of the ALU operation to data bus |
|42 | Right | Low | `SCr` | Resets both the step counter and the extended instruction bit. A step counter overflow needs to do the same thing. |
|43 | Right | Low |  `SPr` | Reset stack pointer to "empty stack" value |
|44 | Right | Low |  `DSs` | Data source input select for 16-bit registers that can load from either address or data bus. LOW is data bus, HIGH is address bus. |
|45 | Right | Low | `CMPs` | Write the temp register to the comparison unit |
|46 | Right | Low | | *unused* |
|47 | Right | Low |  `XTD` | Activate extended instruction bit and resets the step counter. |
|48 | Right | Low | `HLT` | Halt the system clock |

The significant changes over the last project are:
* Added the `Fi` flag register in control line.
