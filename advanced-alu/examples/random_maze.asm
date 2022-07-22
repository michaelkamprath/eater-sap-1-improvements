; Random Maze Generator
; 
;   The PUTEY-1 version of the infamous 1-line of basic code from the 1980s. Clearly not
;   one line of assembly code.  
;
#include "system.asm"
#require "putey-1-beta >= 0.4.1"

.org $8000
buffer:
    .zero 32


.org 0

init:
    rsp                             ; init stack pointer
    call lcd_init                   ; init device
    ; install maze line characters
    push2 left_wall_char            ; push character buffer address on stack
    push 1                          ; custom character ID
    call lcd_create_character       ; install custom character
    pop                             ; restore stack
    pop2
    push2 right_wall_char           ; push character buffer address on stack
    push 2                          ; custom character ID
    call lcd_create_character       ; install custom character
    pop                             ; restore stack
    pop2
    ; initialize the random number generator with seeds
    push $42
    push 42
    push $69
    call init_random8
    pop pop pop
 outer_loop:
    mov i,19                        ; set up character position counter
    mov2 hl,buffer                  ; place buffer addres in HL
 line_cstr_loop:
    call random8                    ; get a random 8-bit number in A
    and %00000001                   ; mask out the last bit of the random value
    add 1                           ; add 1 to the last bit of the random value to get character code
    mov [hl+i],a                    ; place calculated character code in buffer.
    cmp i,0                         ; are we are the end of the line string loop?
    je end_line_loop
    dec i                           ; decrement the character position
    jmp line_cstr_loop
 end_line_loop:
    mov [hl+20],0                   ; this line's tring has been build. append the terminator.
    push2 buffer                    ; print the built line string
    call lcd_print_line_cstr
    pop2
    push2 $8000
    call delay16                    ; delay some so line is visible on LCD
    pop2
    jmp outer_loop


left_wall_char:
    .byte %10000
    .byte %01000
    .byte %01000
    .byte %00100
    .byte %00100
    .byte %00010
    .byte %00010
    .byte %00001

right_wall_char:
    .byte %00001
    .byte %00010
    .byte %00010
    .byte %00100
    .byte %00100
    .byte %01000
    .byte %01000
    .byte %10000