

Documentation

* [The Speech Synthesizer Module](https://www.unige.ch/medecine/nouspikel/ti99/speech.htm) - A thorough description of how the TMS5220 is used in the Texas Instruments 99/4a Spec Synthesizer.

## Design Approach
The TMS5220C is not straightforward to interface with. At issue is the fact is it s "slow memory device". Care needs to be taken to not interact with the chip too fast. It has a `READY` pin used to indicate when the chip cannot be interacted with. Back in the day, this line would be used to halt the clock of the CPU just to prevent interactions. I remember playing games on my TI 99/4a and the whole game would halt when the speech synthesizer would talk. I do not want to implement things this way.

My desired interface is to send the TMS5220 module some information, then poll it determine when the TMS5220C is ready for the next operation. To do this, I need to implement a register to hold information, and logic to manage each transaction. The hardware design I am using does not connect the TMS5220 to a speech ROM, so that simplifies the design.

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

0. The output of the `DATA_IN` registers starts in high-z state with `/DATAa` in a high state.
1. The CPU will write the byte value to the memory mapped `DATA_IN` 74LS173-based register. This is done as per the normal clock cycle using a `MDi` (memory device in) CPU operation, and only if the `MODULE_BUSY` status flag is unset. When `MDi` and `MMAP_x` and the appropriate address lines are set, the `DATAi` pin should go high with the system `CLK`.
2. When the data for the `DATA_IN` register is latched in, the `WS` latch is set, which will bring the `/WS` pin on the TMS5220 chip low. This will cause the `/READY` pin to go high 100 ns later. At this point the `DATA_IN` register output should be enabled by activating `/DATAa`.
    * While `WS` latch is active, the model's `MODULE_BUSY` flag should be set.
3. After the `WS` latch is set and `/READY` goes high, when the `/READY` goes low (indicting the TMS5220 is ready for the next operation after a t<sub>wait</sub> period), the `WS` latch should reset, which will bring the `/WS` pin high. The `DATA_IN` register output should be disabled.
3. After t<sub>wait</sub> period, the `MODULE_BUSY` status flag will get unset.
    * t<sub>wait</sub> is 10 µs. With a 1 MHz clock, that would be 10 clock cycles. 
    * Instead of waiting t<sub>wait</sub> before unsetting `MODULE_BUSY` status flag, the flag could be unset immediately when the `WS` latch is reset. However, software should take care to not initiate another operation within t<sub>wait</sub>. Given the typical data block write loop instruction sequence and the clock speed of of PUTEY-1, this is likely to happen anyway.
4. If the system `RST` (reset) signal is set, the `WS` latch should be reset.

Given this sequence, software should always check that the `MODULE_BUSY` status flag is unset before attempting to write a byte to the `DATA_IN` register.

### Fetch TMS5220 Status
The TMS5220 has an internal status register that can be read when the `/RS` pin on the TMS5220 is taken low. The `/READY` pin is brought high at this point. Then it takes about 6-12 uS from the time `/RS` is brought low until the status is presented on the TMS5220 data pins. This happens when the `/READY` line returns to being low, so that can be used a signal that the status is ready. 

To enable this action, fetching the TMS5220 status will be a two step process for PUTEY-1. The first step will be to write any value to the `FETCH_STATUS` register to signal the desire to fetch data. This will trigger the process of fetching the TMS5220 status as follows:

1. When the  `FETCH_STATUS` memory mapped address lines are configured and the CPU data operation is `MDi` (memory device in) and the `MODULE_BUSY` is currently unset, on the rising edge of the system clock the `RS_CLK` line will be triggered which will latch the `WS` signal and bring the `/RS` line low. Furthermore, the `MODULE_BUSY` status flag will get set.
2. Independent of the system clock, the `/READY` line will go high, and then when the `/READY` returns to low, the `STATUSi` clock line should be pulsed, and the data value will get latched into the register chip. Simultaneously, the `RS_RST` line should be set to clear the `RS` value.
3. When the `RS` value becomes unset, then the `MODULE_BUSY` flag will be unset.

At this point, after the `MODULE_BUSY` is unset, the CPU can read the value in the `FETCH_STATUS` register with a `MDo` (memory device out) operation. Note that since the TMS5220 status is latched into the `FETCH_STATUS` register, it only gets updated with the fetch process described above. This should be kept in mind when designing software for this module.

When the `/RS` pin goes high (`RS` is unset), the TMS5220 will continue to assert a byte value on its data pins for 10.5 µs. This is about 11 PUTEY-1 clock cycles at 1 MHz. Given that after writing a value the `FETCH_STATUS` register a typical program will be in a wait loop on the `MODULE_BUSY` value and that the next operation would be to read the `FETCH_STATUS` register, it is unlikely that bus contention on the TMS5220 data lines is a concern.

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
This project continues to use the control logic design introduced in the [8-Bit Instruction Register project](../instruction-register-8-bit/), however this project inherits from state of things in the "Bidirectional Flags Register" project. No further control logic changes are made.
