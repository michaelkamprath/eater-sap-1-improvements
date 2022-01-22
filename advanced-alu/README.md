

* Add and subtract instructions have a "with carry" version
* The A register can shift and rotate values left or right.
* A "test bit" instruction will test a 8-bit source and set the Z flag accordingly. Uses a 74ls151 8-to-1 selector, and a 74ls173 4-bit register to store bit selection. 
* The test bit hardware can also add ability to check for a zero and negative value on the 8-bit value and set the flags accordingly. Would have to be its own instruction though.
* A compare function