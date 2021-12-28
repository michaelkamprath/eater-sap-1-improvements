#include "system.asm"


.org 0
_init:
    rsp                             ; init stack pointer
    call lcd_init                   ; init device
    call lcd_on_cursor_blink        ; I want it to blink
    push 1                          ; print to row 1
    push2 hello_world_cstr          ; address of string to print
    call lcd_print_cstr             ; print it
    pop2
    pop
    hlt

hello_world_cstr:
    .byte "Hello World!"