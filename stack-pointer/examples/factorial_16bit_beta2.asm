; 16 bit math demo for PUTEY-1 BETA-2
; 
; Calcualtings a 16 bit factorial and displays result in memory address 
; register LEDs. Not ideal, as a proper display is needed, but this
; works as a demo as to how to do higher but math on a 8 bit computer.
;
; To use, set RAM value at $8000 to be the N a factorial is desired for.
; This should be a two byte value in little endian order. Max value should
; be 8 since 8! is the lagest factorial results that 16 bits can represent.

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
    rsp

start:
    push2 [value1]
    call calc_factorial16
    pop2 mar
    hlt


; calc_factorial
;
; arguments passed on stack:
;   sp+2 : the N value to calculate factorial for, 2 byte vlue
;
; returns:
;   sp+2 : results overwite the N value
;
calc_factorial16:
    push2 [sp+2]                    
    call checkone16
    jeq .basecase, 1
    call dec16
    call calc_factorial16
    push2 [sp+4]
    call multiply16
    pop2 mar
    pop2
    mov2 [sp+2], mar
    jmp .finish
.basecase:
    pop2
.finish:
    ret                             ; return. result is in A

; multiply16
;
; Arguments
;   sp+2 - value A, two byte value, ideally the smaller value
;   sp+4 - value B, two byte value
;
; Return Value
;   sp+2 - replace the origin two byte value with the result
;
multiply16:
    push2 [sp+2]
    call checkzero16
    pop2
    jeq .return_zero, 1
    push2 [sp+4]
    call checkzero16
    pop2
    jeq .return_zero, 1   

    mov2 [multiply_results], 0              ; init results variable to 0
    mov [multiply_counter], [sp+2]          ; set multiply counter to multiplicand B. Must move bytes one at
    mov [multiply_counter+1], [sp+3]        ; ... a time due to ISA limitations
.sum_loop:
    push2 [sp+4]                            ; push multiplicand A
    push2 [multiply_results]                ; push results value
    call add16                              ; add A+results
    pop2 [multiply_results]                 ; save addition results bacl into results variable
    pop2                                    ; clear stack
    push2 [multiply_counter]                ; push multiply counter
    call dec16                              ; subtract
    call checkzero16
    pop2 [multiply_counter]
    jeq .return_results, 1                  ; check register A to see if results are true
    jmp .sum_loop
.return_results:
    mov [sp+2],[multiply_results]           ; setting multiplicand A to results. need to do this 1 byte at 
    mov [sp+3],[multiply_results+1]         ; ... a time due to ISA limitation
    ret
.return_zero:
    mov2 [sp+2], 0
    ret

; checkone16
;
; Arguments
;   sp+2 - the value to check to see if one
;
; Resturn Value
;   a - a 1 if one else 0
checkone16:
    mov a, [sp+2]
    jeq .second_byte, 1
    mov a, 0
    ret
.second_byte:
    mov a, [sp+3]
    jeq .zero, 0
    mov a, 0
    ret
.zero:
    mov a, 1
    ret

; checkzero16
;
; Arguments
;   sp+2 - the value to check to see if zero
;
; Resturn Value
;   a - a 1 if zero else 0
checkzero16:
    mov a, [sp+2]
    jeq .second_byte, 0
    mov a, 0
    ret
.second_byte:
    mov a, [sp+3]
    jeq .zero, 0
    mov a, 0
    ret
.zero:
    mov a, 1
    ret

; add16
;   A+B
;
; Arguments
;   sp+2 - value A, two byte value
;   sp+4 - value B, two byte value
;
; Return Value
;   sp+2 - replace the original two byte value with the sum
;
; uses register A

add16:
    mov a, [sp+2]
    add [sp+4]
    mov [sp+2], a
    mov a, [sp+3]
    jc .add_one
    jmp .second_byte
.add_one:
    add 1
.second_byte:
    add [sp+5]
    mov [sp+3], a
    ret

; dec16
;  
; Arguments
;   sp+2 - the value to decrement
; 
; Returns
;   sp+2 - replaces argument with decremented value
; 
; uses register I
dec16:
    mov i, [sp+2]
    dec i
    mov [sp+2],i
    inc i
    jz .high_byte
    ret
.high_byte:
    mov i, [sp+3]
    dec i
    mov [sp+3], i
    ret