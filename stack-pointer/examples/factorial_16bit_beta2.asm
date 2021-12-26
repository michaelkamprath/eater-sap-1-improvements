; 16 bit factorial demo for PUTEY-1 BETA-2
;
; Calcualtings a 16 bit factorial and displays result in HL
; register LEDs. Not ideal, as a proper display is needed, but this
; works as a demo as to how to do higher but math on a 8 bit computer.
;
; Will cycle through calculaintg factorial from N=1 to N=8 (max
; calculatable factorial for 16 bit math). 

#include "math16.asm"

DISPLAY = $7800          ; The display register is found at address $7800
DELAY_COUNT = 32         ; Number of steps for delay counter
MAX_N = 8

;
; RAM variables
;
.org $8000
current_n:
    .2byte 0

;
; Code
;
.org 0
init:
    rsp                                ; init the stack pointer
    mov2 [current_n], 1                ; init N variable
start:
    mov [DISPLAY], [current_n]         ; copy low (first) byte of current_n to DISPLAY
    push2 [current_n]                  ; push the desired factorial N value onto the stack
    call calc_factorial16              ; call the factorial function
    pop2 mar                           ; pop the factorual function results into the MAR 
    mov2 hl, mar
    mov j, DELAY_COUNT                 ; init delay counter
.delay_loop:
    dec j
    jz .calc_loop
    jmp .delay_loop
.calc_loop:
    push2 1                            ; set up for an increment to N
    push2 [current_n]                  ; place current N value on the stack
    call add16                         ; add it up
    pop2 [current_n]                   ; update current N
    pop2                               ; clear stack
    mov a, [current_n]                 ; check the low byte of current_n for value
    jeq init, MAX_N+1
    jmp start


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
    call checkone16                         ; check N value for base case
    jeq .basecase, 1                        ; if N == 1, return as N value is return value
    call dec16                              ; decrement N value
    call calc_factorial16                   ; recurse to calculate factorial(N-1)
    push2 [sp+4]                            ; push N value on stack
    call multiply16                         ; multiply factorial(N-1)*N
    pop2 mar                                ; place multiply results into 16-bit MAR
    pop2                                    ; clear stack
    mov2 [sp+2], mar                        ; write results onto return position in stack
    jmp .finish                             ; return
.basecase:
    pop2                                    ; clear stack
.finish:
    ret
