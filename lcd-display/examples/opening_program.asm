#require "putey-1-beta >= 0.3.0"
#include "system.asm"

.org 0
_init:
    rsp                             ; init stack pointer
    call lcd_init                   ; init device
    ; install custom characters
    push2 left_bar_char             ; push character buffer address on stack
    push 1                          ; custom character ID
    call lcd_create_character       ; install custom character
    pop                             ; restore stack
    pop2
    push2 right_bar_char            ; push character buffer address on stack
    push 2                          ; custom character ID
    call lcd_create_character       ; install custom character
    pop                             ; restore stack
    pop2
    push2 horiz_bar_char            ; push character buffer address on stack
    push 3                          ; custom character ID
    call lcd_create_character       ; install custom character
    pop                             ; restore stack
    pop2
    push2 top_left_corner_char      ; push character buffer address on stack
    push 4                          ; custom character ID
    call lcd_create_character       ; install custom character
    pop                             ; restore stack
    pop2
    push2 top_right_corner_char     ; push character buffer address on stack
    push 5                          ; custom character ID
    call lcd_create_character       ; install custom character
    pop                             ; restore stack
    pop2
    push2 bottom_left_corner_char   ; push character buffer address on stack
    push 6                          ; custom character ID
    call lcd_create_character       ; install custom character
    pop                             ; restore stack
    pop2
    push2 bottom_right_corner_char  ; push character buffer address on stack
    push 7                          ; custom character ID
    call lcd_create_character       ; install custom character
    pop                             ; restore stack
    pop2

_draw_frame:
    push 0
    push2 top_line_cstr
    call lcd_write_row_cstr
    pop2
    pop
    push 1
    push2 middle_line_cstr
    call lcd_write_row_cstr
    pop2
    pop
    push 2
    push2 middle_line_cstr
    call lcd_write_row_cstr
    pop2
    pop
    push 3
    push2 bottom_line_cstr
    call lcd_write_row_cstr
    pop2
    pop    

_delay:
    push2 $0200
    call delay16
    pop2
_draw_hello_horld:
    ; Print "Hello World"
    push 1                          ; place on row 1
    push2 hello_world_cstr          ; address of string to print
    call lcd_center_cstr_on_row     ; print it centered
    pop2                            ; restore stack
    pop
    call lcd_redraw_screen
    push2 $0300                     ; set delay timer
    call delay16                    ; run delay
    pop2                            ; restore stack
    ; blank out howw world
    push 1
    push2 middle_line_cstr
    call lcd_write_row_cstr
    pop2
    pop
    call lcd_redraw_screen
    push2 $0080
    call delay16
    pop2
    jmp _draw_hello_horld           ; loop forever
    

hello_world_cstr:
    .cstr "Hello World!"
top_line_cstr:
    .cstr "\x04\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x05"
middle_line_cstr:
    .cstr "\x01                  \x02"
bottom_line_cstr:
    .cstr "\x06\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x07"




left_bar_char:
    .fill 8, %11000

right_bar_char:
    .fill 8, %00011

horiz_bar_char:
    .fill 3, %00000
    .fill 2, %11111
    .fill 3, %00000 

top_left_corner_char:
    .fill 3, %00000
    .fill 2, %11111
    .fill 3, %11000

top_right_corner_char:
    .fill 3, %00000
    .fill 2, %11111
    .fill 3, %00011

bottom_left_corner_char:
    .fill 3, %11000
    .fill 2, %11111
    .fill 3, %00000

bottom_right_corner_char:
    .fill 3, %00011
    .fill 2, %11111
    .fill 3, %00000
