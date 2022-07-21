; Random Maze Generator
; 
;   The PUTEY-1 version of the infamous 1-line of basic code from the 1980s. Clearly not
;   one line of assembly code.  
;
#include "system.asm"

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
    mov i,20                        ; set up character position counter
    mov2 hl,buffer                  ; place buffer addres in HL
 line_cstr_loop:
    call random8                    ; get a random 8-bit number in A
    tstb a,0                        ; determine if last bit of random number is 1 or 0
    jnz right_line
    mov [hl+i],1                    ; it's 0, place the left line character in buffer at position I
    jmp loop_continue
 right_line:
    mov [hl+i],2                    ; it's 1, place the right line character in buffer at position I
 loop_continue:
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