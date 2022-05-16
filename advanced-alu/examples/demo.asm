#require "putey-1-beta >= 0.4.dev"
#include "system.asm"

NUMBER_VALUE = 48879

.org $8000
string_buffer:
    .zero 32
str_len_value:
    .byte 0

.org 0
_init:
    rsp                             ; init stack pointer
    call lcd_init                   ; init device
    ; install custom characters
    push2 smilie_character_buffer   ; push character buffer address on stack
    push 1                          ; custom character ID
    call lcd_create_character       ; install custom character
    pop                             ; restore stack
    pop2
    push2 heart_character_buffer    ; push character buffer address on stack
    push 2                          ; custom character ID
    call lcd_create_character       ; install custom character
    pop                             ; restore stack
    pop2
_start:
    ; Print "Hello World"
    push2 hello_world_cstr          ; address of string to print
    call lcd_print_line_cstr        ; print it
    pop2                            ; restore stack
    push2 $04FF                     ; set delay timer
    call delay16                    ; run delay
    pop2                            ; restore stack
    ; Print second line, scrolling up in the process
    push2 line2_cstr
    call lcd_print_line_cstr
    pop2
    push2 $08FF
    call delay16
    pop2

    ; convert value to hex
    push2 magic_number_cstr         ; hex number prefix string address
    push2 string_buffer             ; string buffer in RAM
    call cstr_copy                  ; coppy it
    pop2                            ; remove buffer address from stack
    call cstr_len8                  ; get length of hex number string prefix
    mov [str_len_value],a           ; copy string length value to variable
    pop2                            ; remove hex number prefix address from stack
    push [str_len_value]            ; place prefix length on stack
    push2 string_buffer             ; place address to buffer on stack
    push2 NUMBER_VALUE              ; place value to convert on stack
    call uint16_to_hex_cstr         ; convert value to hex string, placing at end of prefix
    pop2
    pop2
    pop                             ; restore stack
    push2 blank_line_cstr           ; push black line one stack
    call lcd_print_line_cstr        ; print it
    pop2                            ; restore stack
    push2 string_buffer             ; place updated string buffer address on stack
    call lcd_print_line_cstr        ; print the string buffer
    pop2                            ; restore stack
    push2 $08FF
    call delay16                    ; delay some
    pop2
    ; scroll to clear screen
    push2 blank_line_cstr           ; push black line one stack
    call lcd_print_line_cstr        ; print it
    call lcd_print_line_cstr        ; print it
    call lcd_print_line_cstr        ; print it
    call lcd_print_line_cstr        ; print it
    pop2
    jmp _start                      ; loop again.

hello_world_cstr:
    .cstr "Hello World!"
line2_cstr:
    .cstr " \x01 \x02 \x01 \x02 \x01"
blank_line_cstr:
    .cstr " "
magic_number_cstr:
    .cstr "Hex Number: $"

smilie_character_buffer:
    .byte %00000
    .byte %11011
    .byte %11011
    .byte %00000
    .byte %00100
    .byte %10001
    .byte %01110
    .byte %00000

heart_character_buffer:
    .byte %00000
    .byte %01010
    .byte %11011
    .byte %11111
    .byte %11111
    .byte %01110
    .byte %00100
    .byte %00000
