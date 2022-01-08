# LCD Display Module
## Overview
As I iterate on the PUTEY-1 to expand its capabilities, the original 1-byte display of the Ben Eater SAP-1 just won't cut it anymore for my display needs. If I want to achieve 64-bit math on this computer, I will need a a way to display values greater than 8-bits. While eventually I do want to connect an 80's style video display processor to this computer, such as the [TMS9918A](https://en.wikipedia.org/wiki/Texas_Instruments_TMS9918), I felt the first step here would be to attach to the CPU one of those ubiquitous LCD displays based on [the Hitachi HD44780 controller](https://en.wikipedia.org/wiki/Hitachi_HD44780_LCD_controller). 

The work I did in a previous project to add memory mapped IO to the CPU really made this project pretty straight forward. There ended up being som gotchas around stability, which I discuss below, but from design to implementation, this was a pretty simple project. More work was put into designing the demonstration software than creating the hardware. But I am pretty happy with the results.

# Design

## LCD Module

### Overview
The LCD module I went with is the LCD2004 module with 4 rows of 20 characters. [These are pretty cheap on eBay](https://ebay.us/opX5g1). You will find many different manufacturers of these modules, but their electrical characteristics are all the same (if they are using the Hitachi HD44780 controller). Your biggest choices are price and color. 

The data sheets for these modules highlight the standard pin connections to the modules, which I list here:

| Pin | Symbol | Description |
|:-:|:-:|:--|
| 1 | `VSS` | **Ground** - Power supply for the device logic. |
| 2 | `VDD` | **+5V** - Power supply for the device logic. |
| 3 | `V0` | **Voltage Reference** - used to adjust LCD brightness. |
| 4 | `RS` | **Register Select** - controls whether the data register (`HIGH`) or the instruction register (`LOW`) is being communicated with.|
| 5 | `R/W` | **Read/Write** - controls whether the device is accepting input (write mode `LOW`) and sending output (read mode `HIGH`) |
| 6 | `E` | **Enable** - In write mode the module will latch the contents of the data lines on the falling edge of this line. In read mode the module will present data to be read on the rising edge of this line. |
| 7 | `DB0` | **Data Bus 0** |
| 8 | `DB1` | **Data Bus 1** |
| 9 | `DB2` | **Data Bus 2** |
| 10 | `DB3` | **Data Bus 3** |
| 11 | `DB4` | **Data Bus 4** |
| 12 | `DB5` | **Data Bus 5** |
| 13 | `DB6` | **Data Bus 6** |
| 14 | `DB7` | **Data Bus 7** |
| 15 | `LED+` | **+5V** - Power supply for the backlight. |
| 16 | `LED-` | **Ground** - Power supply for the backlight. |

### Interface

The biggest challenge in using this module is dealing with the enable `E` behavior of acting on the falling edge of the clock for writes and the rising edge of the clock for reads. This would imply that we need an inverted clock driving the `E` signal, but care had to be taken in the design to deliver both edges *after* all the other control lines were configured. Since the other control lines would be driven by the memory map IO logic, there is relatively significant gate delay before the `RS` and `R/W` signals arrive. To account for this, I gate the inverted clock sign with the logical combination of `MMAP_1 AND (MDi OR MDo)`, which will allow the clock to pass only if both the memory map IO controller has activated the LCD module and the is either a memory write or read operation happening. After that gate, I pass the clock signal through a double inverter to delay it a bit more to ensure these is some time in between when the LCD module is configured and when it sees a rising edge on `E`. I also found in practice the Hitachi HD44780 is extremely sensitive to noise on the `E` line. I discuss noise mitigation later in this document.  

## Memory Mapped IO

## Increasing Maximum Clock Speed

## Stability Issues
While the basic concept of adding this LCD module to the breadboard CPU are pretty straightforward, there is a rather significant stability issues I had to solve. The issue was a combination of the LCD Module's enable line being sensitive to triggering on the falling and and general signal integrity issues caused by the growing size of my breadboard CPU. Basically, noise in both the `CLK` and `MDi` lines would separately have noisy (enough) transitions between `LOW` and `HIGH` that the LCD module would see multiple falling edges. This noise is caused by the inductance of long wires in my large breadboard layout. In the case of `MDi`, I route it through the power rail bus in the middle of the breadboard layout along side the data bus. That's nearly a half meter of breadboard power rail. The falling edge of the `MDi` signal had a very distinct "second hump" as current from the collapsing magnetic field around the `MDi` bus rails created a second voltage spike.  The LCD module would see this as a second trigger when reading in data. 

To address the noise on the `MDi` trailing edge, I simply placed a 1 nF capacity between the `MDi` bus rail (where most the inductance is) and ground. This create a small [LC circuit](https://en.wikipedia.org/wiki/LC_circuit) based on the inductance (`L`) of the bus rail and capacitance (`C`) of the added capacitor. Th `LC` circuit smooths out the transition from `HIGH` to `LOW` (and vice versa) in the `MDi` line, but it does have the effect of lengthening the transition time. I measured the transition with an oscilloscope and found it now takes about 140 nanoseconds. This means that my breadboard computer now has a maximum frequency of about 7 MHz. I'm currently running PUTEY-1 at about 4 KHz, so I find that margin acceptable.

