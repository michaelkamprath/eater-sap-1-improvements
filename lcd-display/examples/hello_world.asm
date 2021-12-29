#include "system.asm"


.org 0
_init:
    rsp                             ; init stack pointer
    call lcd_init                   ; init device
 ;   call lcd_on_cursor_blink        ; I want it to blink
_start:
    push2 hello_world_cstr          ; address of string to print
    call lcd_print_cstr             ; print it
    mov2 [sp], line2_cstr
    call lcd_print_cstr
    mov2 [sp], line3_cstr
    call lcd_print_cstr
    mov2 [sp], line4_cstr
    call lcd_print_cstr
    mov2 [sp], line5_cstr
    call lcd_print_cstr
    pop2
    jmp _start

hello_world_cstr:
    .byte "Hello World!"
line2_cstr:
    .byte "..."
line3_cstr:
    .byte "Would you like to"
line4_cstr:
    .byte "play a game?"
line5_cstr:
    .byte " "