# LCD Display Module
## Overview
As I iterate on the PUTEY-1 to expand its capabilities, the original 1-byte display of the Ben Eater SAP-1 just won't cut it anymore for my display needs. If I want to achieve 64-bit math on this computer, I will need a a way to display values greater than 8-bits. While eventually I do want to connect an 80's style video display processor to this computer, such as the [TMS9918A](https://en.wikipedia.org/wiki/Texas_Instruments_TMS9918), I felt the first step here would be to attach to the CPU one of those ubiquitous LCD displays based on [the Hitachi HD44780 controller](https://en.wikipedia.org/wiki/Hitachi_HD44780_LCD_controller). 

The work I did in a previous project to add memory mapped IO to the CPU really made this project pretty straight forward. There ended up being some gotchas around stability, which I discuss below, but from design to implementation, this was a pretty simple project. More work was put into designing the demonstration software than creating the hardware. But I am pretty happy with the results.

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

### Interfacing with the LCD Module
The register select `RS` line into the LCD module controls whether we are interacting with the command or data register of the module. Prior to me implementing the memory mapped IO controller, the answer here might have been to create a new control line that would be controlled via microcode. That, of course, is an approach that doesn't scale where and the reason why I added [the memory mapped IO controller](../instruction-register-8-bit#memory-map). The basic idea is that we will use a memory mapped IO controller control line, `MMAP_x`, in combination with the lowest address lines to determine which device and register of that device is actively being used. In the case of the LCD module, I decided to assign it to the `MMAP_1` memory map control line and use address line `A0` to control the `RS` line directly. The `MMAP_1` control line is active for addresses between `0x7810` and `0x781F`. By connecting `A0` to `RS`, that means even addresses in that range will cause `RS` to be `LOW` and thus we would be interacting with the instruction register, and odd addresses would activate the data register. For simplicity, I just declare the address `0x7810` to be the instruction register, and `0x7811` is the data register. 

The `R/W` line of the LCD module is controlled by both the `MDi` (memory device in) and `MDo` (memory device out) control lines. When `MDi` is `HIGH` and `MMAP_1` is active, we want `R/W` to indicate that the device will be written to, or set `LOW`. And when `MDo` is `HIGH`, we want `R/W` to be set high. Furthermore, in order to prevent spurious data changes, I wanted to hold `R/W` in read mode whenever `MMAP_1` or both `MDi` and `MDo` are not active. This way any stray pulse into the device on another control line won't cause an unwanted write. To accomplish this, I introduced some logic to the design, which can be reviewed in the schematic.

The biggest challenge in using this module is dealing with the enable `E` behavior of acting on the falling edge of the clock for writes and the rising edge of the clock for reads. This would imply that we need an inverted clock driving the `E` signal, but care had to be taken in the design to deliver both edges *after* all the other control lines were configured. Since the other control lines would be driven by the memory map IO logic, there is relatively significant gate delay before the `RS` and `R/W` signals arrive. To account for this, I gate the inverted clock sign with the logical combination of `MMAP_1 AND (MDi OR MDo)`, which will allow the clock to pass only if both the memory map IO controller has activated the LCD module and the is either a memory write or read operation happening. After that gate, I pass the clock signal through a double inverter to delay it a bit more to ensure these is some time in between when the LCD module is configured and when it sees a rising edge on `E`. I also found in practice the Hitachi HD44780 is extremely sensitive to noise on the `E` line. I discuss noise mitigation later in this document.

Since the LCD module's data lines, `DB0` through `DB7`, can both read and write data, they cannot be connected to the CPU's data bus directly. An connection is needed that will architrave when the device is in read more and write mode in order to prevent contention on the bus. This is where the oft-used `74LS245` octal bus transceiver ready shines. It has the `DIR` line (pin 1) which controls the direction of the transceiver's signal repeating. Here, the `MDo` control line is used to drive the direction of the transceiver. Furthermore, the transceiver is only made active (chip enable line) when both the `MMAP_1` line and either of the `MDo` or the `MDi` line is active.

## Software Support
### Implementing a Vertical Scroll
The LCD2004 module is pretty rudimentary and its only "convenience" function is auto-incrementing the its active memory address when it is read or written to. So to write the contents of a particular row on the device you just have to set its data address to the row's start position and then bang out each o the row's character's in order. However, if you want to do something more sophisticated, such as creating a vertically scrolling display, you have to implement it in software.

So I did desire a vertically scrolling display. What I wanted for an interface is to simply give the module a line of text, and it would automatically display it on the bottom row after scrolling the existing rows upward. It is conceptually pretty straight forward to scroll, just read the contents of one from for the LCD module, and then write those contents to the line above. In practice, I found this to be slow given all the instructions that are needed to set the read and write address of the LCD module for moving the data around. This is actually not an uncommon problem with displays in general.

One way to improve the permanence of managing what is being displayed on a display is to buffer the display data in RAM, do any manipulations you want to do with the display data there in RAM (which is usually much faster than interacting with the display), and then when ready, simply blast the RAM display data into the the display module. This "download display data to the module" activity is usually optimized for speed in display modules, and this LCD2004 module is no different. 

Once I have the display module's display contents in RAM, effecting a fast vertical scroll becomes much easier. The method I used was to first create a single block of RAM that represents all of the specific character data positions on the display. The first position in this RAM block would represent the first position (left most) on the first (top) row, and the last position in this RAM block would be the last position (rightmost) on the last (bottom) row. Then, I additionally create four pointer variables in RAM that each have the address to the start of their specific row in the display data in RAM. This can be visualized like this:

```

                     0      Columns     19
                    +--------------------+
  row 0 pointer --> |                    |
                    +--------------------+ R
  row 1 pointer --> |                    | o
                    +--------------------+ w
  row 2 pointer --> |                    | s
                    +--------------------+
  row 3 pointer --> |                    |
                    +--------------------+
                                        79

```

When I want to updated the contents of a row, I simply write into the RAM block starting at the memory address contained by the pointer variable to that row. Then when I need to update the contents of a row on the LCD module, I set the LCD module's data address to its address for that particular row, then send it 20 characters from the RAM block starting at the address contained by the pointer variable for that row. 

Effecting a fast scroll then becomes pretty simple. I first rotate the pointers variables. That is, the row 0 pointer assigned the address that is currently in the row 1 pointer, the row 1 pointer gets the row 2 pointer value, the row 2 pointers gets row 3 pointer value, and and row 3 pointer gets the original value of the row 0 pointer. Then I write the new string data that I want to display to the updated memory location in the row 3 pointer. The updated pointer configuration after the first scroll would look like this relative to the buffer RAM block:

```

                     0      Columns     19
                    +--------------------+
  row 3 pointer --> |                    |
                    +--------------------+ R
  row 0 pointer --> |                    | o
                    +--------------------+ w
  row 1 pointer --> |                    | s
                    +--------------------+
  row 2 pointer --> |                    |
                    +--------------------+
                                        79

```
At this point, the LCD module display can be quickly updated by blasting the entire buffer contents into the LCD module one row at a time starting at the address of the updated row 0 pointer and then working through each subsequent row in turn. 

The advantage of this approach is that you have to move less data around to effect the vertical scroll. Since the LCD module does not support a hardware scroll, you can't get around needing to completely update the LCD module's RAM content. However, this row pointer approach allows you to effectively rearrange the buffer's row arrangement without needing to read and rewrite the contents of the buffer. 

### Standard Libraries
With the addition of a stack pointer in my last update, and the addition of the LCD module in this update, its time to start implementing a standard suite of functions for use to build software for the PUTEY-1 TTL CPU. With this project, I created the start of the following libraries:

* `memlib` : **Memory Library** - Provides some utilities around managing emory, notably copying data from one area in ROM or RAM to another.
* `stringlib` : **String Library** - Provides functions for the manipulation of strings, notably determining their length, concatenating two strings, and converting numeric values to a string for display. This library primarily uses null-terminated strings, also known as C-style strings. 
* `mathlib` : **Math Library** - Provides functions for calculating math at high bit sizes than the 8-bit math the the ALU supports. Currently provides an addition, subtraction, multiplication, and division function for 16-bit math.
* `lcdlib` : **LCD Display Library** - Provides all the of the functions needed to display text and special characters on the LCD2004 module.

The current version of these libraries can be found in [the examples folder](./examples/) of this project. These libraries can be used in the code independently, or all can be imported by [including](https://github.com/michaelkamprath/bespokeasm/wiki/Assembly-Language-Syntax#include-other-files) the `system.asm` file in your program's code.

## Increasing Maximum Clock Speed
At the start of this project, I was still using the original clock design from [Ben Eater's SAP-1](https://eater.net/8bit). As it was designed the maximum speed of the clock is 481 Hz. Certainly that is faster than what you eye can see, but it proved to be pretty slow with all the work that needs to happen to maintain the LCD display. A quick fix here was to change the capacitor that controls the timing of the astable `555`. In Ben Eater's original design, this capacitor was 1 µF. I changed it to a 100 nF capacity and got a 10x increase in the maximum speed of the clock, to 4.8 KHz. This made the display of text and scrolling on the LCD module much more snappy.

## Stability Issues
While the basic concept of adding this LCD module to the breadboard CPU are pretty straightforward, there is a rather significant stability issues I had to solve. The issue was a combination of the LCD Module's enable line being sensitive to triggering on the falling and and general signal integrity issues caused by the growing size of my breadboard CPU. Basically, noise in both the `CLK` and `MDi` lines would separately have noisy (enough) transitions between `LOW` and `HIGH` that the LCD module would see multiple falling edges. This noise is caused by the inductance of long wires in my large breadboard layout. In the case of `MDi`, I route it through the power rail bus in the middle of the breadboard layout along side the data bus. That's nearly a half meter of breadboard power rail. The falling edge of the `MDi` signal had a very distinct "second hump" as current from the collapsing magnetic field around the `MDi` bus rails created a second voltage spike.  The LCD module would see this as a second trigger when reading in data. 

To address the noise on the `MDi` trailing edge, I simply placed a 1 nF capacity between the `MDi` bus rail (where most the inductance is) and ground. This create a small [LC circuit](https://en.wikipedia.org/wiki/LC_circuit) based on the inductance (`L`) of the bus rail and capacitance (`C`) of the added capacitor. Th `LC` circuit smooths out the transition from `HIGH` to `LOW` (and vice versa) in the `MDi` line, but it does have the effect of lengthening the transition time. I measured the transition with an oscilloscope and found it now takes about 140 nanoseconds. This means that my breadboard computer now has a maximum frequency of about 7 MHz. I'm currently running PUTEY-1 at about 4 KHz, so I find that margin acceptable. I also found I needed to add a 1 pF capacitor to the `MDo` control line for all the same reasons. 

A similar problem was found in the `MMAP_1` memory map control line. A limitted investigation leads me to suspect the `74HCT238` creates a spurious signal spike as its address lines transition. This this spike was small, the LCD module would detect and act on it. I found that placing a 22 pF capacitor between the `MMAP_1` line and ground dampened the spike enough to not be detected by the LCD module.



