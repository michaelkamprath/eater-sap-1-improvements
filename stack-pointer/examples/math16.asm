; Math library variables
.org $F000
_multiply_results:
    .2byte  0
_multiply_counter:
    .2byte  0

; Math library location
.org $1000

; multiply16
;   multiply two byte values X*Y
;
; Arguments
;   sp+2 - value X, two byte value, ideally the smaller value
;   sp+4 - value Y, two byte value
;
; Return Value
;   sp+2 - replace the origin two byte value with the result
;
multiply16:
    push2 [sp+2]                            ; place X on stack
    call checkzero16                        ; check to see if X is 0
    pop2                                    ; clear stack
    jeq .return_zero, 1                     ; if checkzero16 was TRUE, return a zero value
    push2 [sp+4]                            ; place Y on stack
    call checkzero16                        ; check to see if Y is 0
    pop2                                    ; clear stack
    jeq .return_zero, 1                     ; if checkzero16 was TRUE, return a zero value
    mov2 [_multiply_results], 0              ; init results variable to 0
    mov [_multiply_counter], [sp+2]          ; set multiply counter to multiplicand B. Must move bytes one at
    mov [_multiply_counter+1], [sp+3]        ; ... a time due to ISA limitations
.sum_loop:
    push2 [sp+4]                            ; push multiplicand Y
    push2 [_multiply_results]                ; push results value
    call add16                              ; add Y to running sum
    pop2 [_multiply_results]                 ; save addition results baclkinto results variable
    pop2                                    ; clear stack (value Y)
    push2 [_multiply_counter]                ; push multiply counter on stack
    call dec16                              ; decrement multiply counter
    call checkzero16                        ; check whether decremented multiply counter is 0
    pop2 [_multiply_counter]                 ; pop decremented multiply counter into multiply counter variable
    jeq .return_results, 1                  ; check register A to see if results are TRUE (multiply counter == 0)
    jmp .sum_loop                           ; continue with sum loop
.return_results:                            ; done with sum loop. return results.
    mov [sp+2],[_multiply_results]           ; setting multiplicand A to results. need to do this 1 byte at
    mov [sp+3],[_multiply_results+1]         ; ... a time due to ISA limitation
    ret
.return_zero:
    mov2 [sp+2], 0                          ; results are 0. set 0 return value
    ret

; checkone16
;   Check whether 2 byte value on stack is qual to 1 or not
;
; Arguments
;   sp+2 - the value to check to see if one
;
; Return Value
;   a - a is 1 if passed value is one else 0
checkone16:
    mov a, [sp+2]                       ; move low byte of value into A
    jeq .second_byte, 1                 ; check if equal to 1.
    mov a, 0                            ; the low byte is not equal to 1. load A with FALSE
    ret
.second_byte:                           ; low byte was 1. now check high byte.
    mov a, [sp+3]                       ; move high byte into A
    jeq .zero, 0                        ; check for 0
    mov a, 0                            ; high byte was not zero. load A with FALSE
    ret
.zero:
    mov a, 1                            ; both bytes were the proper value. load A with TRUE
    ret

; checkzero16
;   Check wehter the 2 byte value on the stack is equal to 0 or not
;
; Arguments
;   sp+2 - the value to check to see if zero
;
; Return Value
;   a - a is 1 if passed value is zero else 0
checkzero16:
    mov a, [sp+2]                       ; move low byte of value into A
    jeq .second_byte, 0                 ; check if equal to 0.
    mov a, 0                            ; the low byte is not equal to 0. load A with FALSE
    ret                                 ; return
.second_byte:                           ; low byte was zero. now check high byte.
    mov a, [sp+3]                       ; move high byte into A
    jeq .zero, 0                        ; check for 0
    mov a, 0                            ; high byte was not zero. load A with FALSE
    ret
.zero:
    mov a, 1                            ; both bytes were the proper value. load A with TRUE
    ret

; add16
;   adds values X+Y
;
; Arguments
;   sp+2 - value X, two byte value
;   sp+4 - value Y, two byte value
;
; Return Value
;   sp+2 - replace the original two byte value with the sum
;
; uses register A
add16:
    mov a, [sp+2]                       ; move low byte of value X into register A
    add [sp+4]                          ; add low byte of value Y to alue in regsiter A
    mov [sp+2], a                       ; move addition results to low byte of return value
    mov a, [sp+3]                       ; move high byte of value X into register A
    jc .add_one                         ; if the prior addition had a carry, we need to add 1 to high byte
    jmp .second_byte                    ; no carry on prior addition
.add_one:
    add 1                               ; add 1 to the high byte
.second_byte:
    add [sp+5]                          ; add the high byte of value Y to register A
    mov [sp+3], a                       ; move the the high bye results to the stack
    ret

; dec16
; Decrements a 16-bit interger by 1.
;
; Arguments
;   sp+2 - the value to decrement
;
; Returns
;   sp+2 - replaces argument with decremented value
;
; uses register I
dec16:
    mov i, [sp+2]                       ; move low byte of passed value to register I
    dec i                               ; decrement the low byte.
    mov [sp+2],i                        ; move the decremented low bye back onto the stack
    inc i                               ; increment i to see if the prior decrement was from a zero value
    jz .high_byte                       ; The prior increment to trigger the zero detection.
    ret                                 ; we only needed to decrement the low byte. return.
.high_byte:                             ; the low bye was decremented from zero. need to decrement high byte.
    mov i, [sp+3]                       ; move high byte into register I
    dec i                               ; decrement high byte
    mov [sp+3], i                       ; move decremented high byte back onto stack
    ret                                 ; return
