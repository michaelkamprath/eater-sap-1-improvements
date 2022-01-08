; 16 bit factorial demo for PUTEY-1 BETA-3
;
; Calcualtings a 16 bit factorial and displays result on LCD Module using hex
;
; Will cycle through calculaintg factorial from N=1 to N=8 (max
; calculatable factorial for 16 bit math). The DELAY_COUNT is used to pause
; display long enough for a human to see the results. It is tuned for a system
; clock of about 4 KHz. 
#require "putey-1-beta >= 0.3.0"
#include "system.asm"

DISPLAY = $7800          ; The display register is found at address $7800
DELAY_COUNT = $0300      ; Number of steps for delay counter
MAX_N = 8                ; max calculatable N value

;
; RAM variables
;
.org $8000
current_n:
    .2byte 0

string_buffer:
    .zero 32
;
; Code
;
.org 0
init:
    rsp                                ; init the stack pointer
    call lcd_init                      ; init device
restart:
    mov2 [current_n], 1                ; init N variable
    ; display title banner
    push2 title_cstr
    call lcd_print_line_cstr
    mov2 [sp], blank_line_cstr
    call lcd_print_line_cstr
    pop2
start:
    mov [DISPLAY],[current_n]          ; copy lower byte of current_n to display register
    push2 [current_n]
    call display_calculating           ; display the current N value to calculate
    call calc_factorial16              ; call the factorial function, results on stack
    push2 [current_n]                  ; put N value on stack for results printing. results already on stack
    call display_results               ; display factorial results and current n value
    call inc16                         ; inclrement the n value
    pop2 [current_n]                   ; update current_n with next value
    pop2                               ; pop factorial result. stack is restored
    ; delay some for your viewing pleasure
    push2 DELAY_COUNT
    call delay16
    pop2
    mov a,[current_n]                  ; check the low byte of current_n for value
    jeq restart, MAX_N+1
    jmp start


; display_calculating
;   displays the value currently being calculated
;
;   Arguments
;       sp+2 : N value being calculated (2 byte)
display_calculating:
    push2 calculating_prefix_cstr
    push2 string_buffer
    call cstr_copy                      ; copy prefix to buffer
    pop2
    call cstr_len8                      ; get length of prefix. results in A
    pop2
    push a                              ; prefix length is where index of where hex value should be written
    push2 string_buffer                 ; the string buffer
    push2 [sp+5]                        ; push the N value
    call uint16_to_hex_cstr
    pop2
    pop2
    pop
    push2 string_buffer                 ; the cstr to print
    call lcd_print_line_cstr            ; print it
    pop2
    ret

; display_results
;   Displays the results value
;
;   Arguments
;       sp+2 : the N value calculated (2 byte)
;       sp+4 : the results value (2 byte)
display_results:
    push2 factorial_results_prefix_cstr
    push2 string_buffer
    call cstr_copy                      ; copy prefix to buffer
    pop2
    call cstr_len8                      ; get length of prefix. results in A
    pop2
    push a                              ; prefix length is where index of where hex value should be written
    push2 string_buffer
    push2 [sp+5]                        ; push the N value
    call uint16_to_hex_cstr
    pop2                                ; pop the N value
    call cstr_len8                      ; top of stack is string buffer. get current string length
    pop2
    pop                                 ; pop string length. stack is restored
    push2 string_buffer
    push 0                              ; push high byte of 2-byte value equal to A (for little endian ordering)
    push a                              ; push low byte of 2-byte value equal to A
    call add16
    pop2 hl                             ; copy string_buffer incremented address to HL
    pop2                                ; pop A converted to 16 bit value. stack is restored
 .copy_results:
    push2 factorial_results_mid_cstr
    push2 hl                            ; HL is currently at the position in string_buffer to copy results
    call cstr_copy
    pop2
    pop2
    push2 string_buffer
    call cstr_len8                      ; get updated string buffer length
    pop2                                ; stack is restored
    push a                              ; sting length will be where the hex value will be placed.
    push2 string_buffer                 ; push string buffer
    push2 [sp+7]                        ; push the results value to be converted
    call uint16_to_hex_cstr
    pop2                                ; pop results value
    call lcd_print_line_cstr            ; current top of stack is string buffer. print it.
    pop2                                ; pop string buffer
    pop                                 ; pop string size. stack is restored.
    push2 blank_line_cstr               ; now print a blank line
    call lcd_print_line_cstr
    pop2                                ; stack is restored.
    ret

; calc_factorial
;   calculate the factorial of two byte value N
;
; arguments passed on stack:
;   sp+2 : the N value to calculate factorial for, 2 byte value
;
; returns:
;   sp+2 : results overwite the N value
;
calc_factorial16:
    push2 [sp+2]                            ; place N value on stack
    push2 1
    call is_equal16                         ; check N value for base case
    pop2
    jeq .basecase, 1                        ; if N == 1, return as N value is return value
    pop2 hl                                 ; pop the n value in to HL
    dec hl                                  ; decrement HL to get N-1
    push2 hl                                ; place N-1 on the stack
    call calc_factorial16                   ; recurse to calculate factorial(N-1)
    push2 [sp+4]                            ; push N value on stack
    call multiply16                         ; calculate factorial(N-1)*N
    pop2 mar                                ; place multiply results into 16-bit MAR
    pop2                                    ; stack is restored
    mov2 [sp+2], mar                        ; write results onto return position in stack
    jmp .finish                             ; return
.basecase:
    pop2                                    ; stack is restored
.finish:
    ret


;
; Strings
;

title_cstr:
    .cstr "PUTEY-1 Factorial"
blank_line_cstr:
    .cstr " "
calculating_prefix_cstr:
    .cstr "Calculating: $"
factorial_results_prefix_cstr:
    .cstr "($"
factorial_results_mid_cstr:
    .cstr ")! = $"