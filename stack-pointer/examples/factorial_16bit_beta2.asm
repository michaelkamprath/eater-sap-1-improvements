; 16 bit factorial demo for PUTEY-1 BETA-2
;
; Calcualtings a 16 bit factorial and displays result in memory address
; register LEDs. Not ideal, as a proper display is needed, but this
; works as a demo as to how to do higher but math on a 8 bit computer.
;
; To use, set RAM value at $8000 to be the N a factorial is desired for.
; This should be a two byte value in little endian order. Max value should
; be 8 since 8! is the lagest factorial results that 16 bits can represent.

#include "math16.asm"

;
; RAM variables
;
.org $8000
value1:
    .2byte 0
value2:
    .2byte 0
multiply_results:
    .2byte  0
multiply_counter:
    .2byte  0
;
; Code
;
.org 0
init:
    rsp                                ; init the stack pointer

start:
    push2 [value1]                     ; push the desired factorial N value onto the stack
    call calc_factorial16              ; call the factorial function
    pop2 mar                           ; pop the factorual function results into the MAR for (kind of) display
    hlt                                ; HALT


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
