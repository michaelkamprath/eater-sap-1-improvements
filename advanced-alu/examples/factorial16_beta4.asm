; 16 bit factorial demo for PUTEY-1 BETA-4a
;
; Calcualtings a 16 bit factorial and displays result on LCD Module using hex
;
; Will cycle through calculaintg factorial from N=1 to N=8 (max
; calculatable factorial for 16 bit math). The DELAY_COUNT is used to pause
; display long enough for a human to see the results. It is tuned for a system
; clock of about 4 KHz. 
#require "putey-1-beta >= 0.4.0"
#include "system.asm"

DELAY_COUNT = $0300      ; Number of steps for delay counter
MAX_N = 8                ; max calculatable N value
BUFFER_SIZE = 32

;
; RAM variables
;
.org $8000
current_n:
    .2byte 0

string_buffer:
    .zero BUFFER_SIZE

decimal_buffer:
    .zero BUFFER_SIZE

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
    cmp [current_n],MAX_N+1            ; check the low byte of current_n for value
    je restart
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
    pop2
    push BUFFER_SIZE                    ; buffer size
    push2 decimal_buffer                ; the decimal string buffer
    push2 [sp+5]                        ; push the N value
    call uint16_to_decimal_cstr         ; cconver N value to decimal string
    pop2
    pop2
    pop
    push BUFFER_SIZE
    push2 string_buffer
    push2 decimal_buffer
    push2 string_buffer
    call cstr_concat
    pop2
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
    push BUFFER_SIZE                    ; buffer size
    push2 string_buffer                 ; the string buffer
    push2 [sp+(2+3)]                        ; push the N value
    call uint16_to_decimal_cstr         ; cconver N value to decimal string
    pop2
    pop2
    pop
    push BUFFER_SIZE
    push2 string_buffer
    push2 factorial_results_mid_cstr
    push2 string_buffer
    call cstr_concat                    ; concat mid string
    pop2
    pop2
    pop2
    pop
    push BUFFER_SIZE                    ; buffer size
    push2 decimal_buffer                ; the string buffer
    push2 [sp+(4+3)]                    ; push the results value
    call uint16_to_decimal_cstr         ; cconver results value to decimal string
    pop2
    pop2
    pop
    push BUFFER_SIZE
    push2 string_buffer
    push2 decimal_buffer    
    push2 string_buffer
    call cstr_concat                    ; concat result decimal cstr
    pop2
    pop2
    pop2
    pop

    push2 string_buffer
    call lcd_print_line_cstr            ; current top of stack is string buffer. print it.
    pop2                                ; pop string buffer
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
    call cmp16                              ; check N value for base case
    pop2
    je .basecase                            ; if N == 1, return as N value is return value
    pop2 hl                                 ; pop the n value in to HL
    dec hl                                  ; decrement HL to get N-1
    push2 hl                                ; place N-1 on the stack
    call calc_factorial16                   ; recurse to calculate factorial(N-1)
    push2 [sp+(2+2)]                        ; push N value on stack
    call multiply16                         ; calculate factorial(N-1)*N
    pop2 [sp+(2+4)]                         ; discard first two bytes. Assume 16 bit solution
    pop2                                    ; write multiplicaiton results into return value
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
    .cstr "Calculating: "
factorial_results_mid_cstr:
    .cstr "! = "