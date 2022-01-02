

; is_equal16
;   Checks whether two 16-bit values are equal
;
;   Arguments
;       sp+2 : Value x (2 bytes)
;       sp+4 : Value Y (2 bytes)
;
;   Returns
;       register A : 1 indicating equality, 0 if not
is_equal16:
    mov a,[sp+2]            ; check low bytes first
    jeq .high_byte, [sp+4]  ; if low bytes are equal, check high byte
    jmp .not_equal          ; not zero, so not equal
.high_byte:
    mov a,[sp+3]
    jeq .equal, [sp+5]      ; if high bytes are equal, then return true
.not_equal:
    mov a,0
    ret
.equal:
    mov a,1
    ret



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
    push2 0
    call is_equal16                         ; check to see if X is 0
    pop2                                    ; clear stack
    pop2
    jeq .return_zero, 1                     ; if checkzero16 was TRUE (1 in a), return a zero value
    push2 [sp+4]                            ; place Y on stack
    push2 0
    call is_equal16                         ; check to see if Y is 0
    pop2                                    ; clear stack
    pop2
    jeq .return_zero, 1                     ; if checkzero16 was TRUE, return a zero value
    push2 [sp+2]                            ; make room on stack for counter variable init to X
    push2 0                                 ; make room on stack for multiply results
                                            ; at this point, stack variable locations:
                                            ;   [sp]   : results (initialized to 0)
                                            ;   [sp+2] : loop counter (initialized to value X)
                                            ;   [sp+6] : argument value X
                                            ;   [sp+8] : argument value Y
.sum_loop:
    push2 [sp+8]                            ; push multiplicand Y
    push2 [sp+2]                            ; push results value
    call add16                              ; add Y to running sum
    mov [sp+4],[sp]                         ; save addition results baclkinto results variable
    mov [sp+5],[sp+1]                       ; must do it 1 byte at a time due to ISA
    pop2                                    ; pop2 results value
    pop2                                    ; clear stack (value Y)
    push2 [sp+2]                            ; push multiply counter on stack
    call dec16                              ; decrement multiply counter
    mov [sp+4],[sp]                         ; copy decremented multiply counter into multiply counter variable
    mov [sp+5],[sp+1]                       ; two pushes due to ISA
    push2 0
    call is_equal16                         ; check whether decremented multiply counter is 0
    pop2                                    ; remove 0 from stack
    pop2                                    ;
    jeq .return_results, 1                  ; check register A to see if results are TRUE (multiply counter == 0)
    jmp .sum_loop                           ; continue with sum loop
.return_results:                            ; done with sum loop. return results.
    mov [sp+6], [sp]                        ; copy results into return variable on stack
    mov [sp+7], [sp+1]                      ; in two steps because of ISA
    pop2                                    ; remove local results variable
    pop2                                    ; remove local loop counter variable
    ret
.return_zero:
    mov2 [sp+2], 0                          ; results are 0. set 0 return value
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


; inc16
;   Increments a 16-bit interger by 1.
;
; Arguments
;   sp+2 - the value to increment
;
; Returns
;   sp+2 - replaces argument with incremented value
;
inc16:
    mov2 hl, [sp+2]             ; move value to be incremented in hl
    inc hl                      ; increment it
    mov2 [sp+2], hl             ; place results back into position on stack
    ret                         ; return

; dec16
; Decrements a 16-bit interger by 1.
;
; Arguments
;   sp+2 - the value to decrement
;
; Returns
;   sp+2 - replaces argument with decremented value
;
dec16:
    mov2 hl, [sp+2]             ; move value to be decremented in hl
    dec hl                      ; decrement it
    mov2 [sp+2], hl             ; place results back into position on stack
    ret                         ; return
