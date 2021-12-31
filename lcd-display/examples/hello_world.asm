#include "system.asm"

MAGIC_NUMBER = $BEEF

.org $8000
string_buffer:
    .zero 32
str_len_value:
    .byte 0

.org 0
_init:
    rsp                             ; init stack pointer
    call lcd_init                   ; init device
 ;   call lcd_on_cursor_blink        ; I want it to blink
_start:
    push2 hello_world_cstr          ; address of string to print
    call lcd_print_line_cstr        ; print it
    pop2
    push2 $04FF
    call delay16
    pop2
    push2 line2_cstr
    call lcd_print_line_cstr
    pop2
    push2 $08FF
    call delay16
    pop2
    push2 line3_cstr
    call lcd_print_line_cstr
    mov2 [sp], line4_cstr
    call lcd_print_line_cstr
    pop2
    push2 $08FF
    call delay16
    pop2 
    ; print magic number sequence
    push2 magic_number_cstr
    call cstr_len8
    mov [str_len_value], [sp]
    pop2
    push 0                      ; place string at begginging of buffer
    push2 string_buffer         ; the string buffer
    push2 MAGIC_NUMBER          ; the value to convert to hex
    call uint16_to_hex_cstr     ; convert it
    pop2
    pop2
    pop
    push2 magic_number_cstr     ; place string prefix on stack
    call lcd_print_line_cstr
    pop2
    push 3                      ; print on bottom row
    push [str_len_value]        ; print at end of prefix
    push2 string_buffer         ; the translated hex value
    call lcd_write_cstr_at      ; place it on screen at specific place
    pop2
    pop
    pop 
    push2 $08FF
    call delay16
    pop2 
    ; scroll all off screeen
    push2 blank_line_cstr
    call lcd_print_line_cstr
    pop2
    push $FF
    call delay8
    pop
    push2 blank_line_cstr
    call lcd_print_line_cstr
    pop2
    push $FF
    call delay8
    pop
    push2 blank_line_cstr
    call lcd_print_line_cstr
    pop2
    push $FF
    call delay8
    pop
    jmp _start

hello_world_cstr:
    .cstr "Hello World!"
line2_cstr:
    .cstr ":-) :-) :-)"
line3_cstr:
    .cstr "Would you like to"
line4_cstr:
    .cstr "play a game?"
blank_line_cstr:
    .cstr " "
magic_number_cstr:
    .cstr "Magic Number: $"