#require "putey-1-beta >= 0.4.dev"
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
    ; call lcd_on_cursor_blink        ; I want it to blink
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
    ; Print third and fourth line, scrolling up in the process
    push2 line3_cstr
    call lcd_print_line_cstr
    mov2 [sp], line4_cstr           ; don't pop and re-push, faster just to alter the stack
    call lcd_print_line_cstr
    pop2
    push2 $08FF
    call delay16
    pop2
    ; Print numeric value converted to text in code
    push2 magic_number_cstr     ; address of prefix
    call cstr_len8              ; determine length of prefix
    mov [str_len_value], a      ; save length to a variable
    pop2                        ; restore stack
    push 0                      ; place computed numeric string at begginging of buffer
    push2 string_buffer         ; the string buffer to place the numeric string
    push2 MAGIC_NUMBER          ; the value to convert to hex
    call uint16_to_hex_cstr     ; convert it
    pop2                        ; restore stack
    pop2
    pop
    push2 magic_number_cstr     ; place string prefix address on stack
    call lcd_print_line_cstr    ; print the prefix with scrolling the display
    pop2                        ; restore stack
    push 3                      ; print numeric string on bottom row
    push [str_len_value]        ; print numeric string at end of prefix
    push2 string_buffer         ; the translated hex value cstr
    call lcd_write_cstr_at      ; place it on screen at specific place
    pop2                        ; restore stack
    pop
    pop
    push2 $08FF                 ; set delay timer
    call delay16
    pop2
    ; scroll all text off screeen slowly
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
    jmp _start                  ; restart the cycle

hello_world_cstr:
    .cstr "Hello World!"
line2_cstr:
    .cstr " \x01 \x02 \x01 \x02 \x01"
line3_cstr:
    .cstr "Would you like to"
line4_cstr:
    .cstr "play a game?"
blank_line_cstr:
    .cstr " "
magic_number_cstr:
    .cstr "Magic Number: $"

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
