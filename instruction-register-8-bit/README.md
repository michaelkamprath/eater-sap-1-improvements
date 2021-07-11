# 8-bit Instruction Register


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