#require "putey-1-beta >= 0.4.dev"

; is_equal16
;   Checks whether two 16-bit values are equal
;
;   Arguments
;       sp+2 : Value x (2 bytes)
;       sp+4 : Value Y (2 bytes)
;
;   Returns
;       register A : 1 indicating equality, 0 if not
;
; Registers used:
;    a
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
; Registers used:
;    a, hl
multiply16:
    push2 [sp+2]                            ; place X on stack
    push2 0
    call is_equal16                         ; check to see if X is 0
    pop2                                    ; clear stack
    pop2
    jeq .return_zero, 1                     ; if equal to zero (1 in a), return a zero value
    push2 [sp+4]                            ; place Y on stack
    push2 0
    call is_equal16                         ; check to see if Y is 0
    pop2                                    ; clear stack
    pop2
    jeq .return_zero, 1                     ; if equal to zero, return a zero value
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
    mov2 hl,[sp]                            ; copy decremented multiply counter into multiply counter variable ..,
    mov2 [sp+4],hl                          ; ... through HL due to ISA limitation
    push2 0                                 ; place 0 value on stack
    call is_equal16                         ; check whether decremented multiply counter is 0
    pop2                                    ; remove 0 from stack
    pop2                                    ; remove decremented multiply counter from stack
    jeq .return_results, 1                  ; check register A to see if results are TRUE (multiply counter == 0)
    jmp .sum_loop                           ; continue with sum loop
.return_results:                            ; done with sum loop. return results.
    pop2 hl                                 ; temprarily pop results into HL
    pop2                                    ; remove local loop counter variable
    mov2 [sp+2], hl                         ; copy results to return value
    ret
.return_zero:
    mov2 [sp+2], 0                          ; results are 0. set 0 return value
    ret

; divide8
;   Divides X by Y
; 
;   Arguments
;       sp+2 : value X dividend (1 bytes)
;       sp+3 : value Y divisor (1 bytes)
;   Return Value:
;       sp+2 : the quotient (replaces X)
;       sp+3 : the remainder (replaces Y)
; 
;   Registers Used:
;       i
;       a
; 
divide8:
    mov a,[sp+3]                            ; move Y into A
    jeq .divide_by_zero, 0                  ; check for divide by zero
    mov a,[sp+2]                            ; move X into A
    jeq .return_zero, 0                     ; return zero if dividend is 0
    mov i,0
.sub_loop:
    sub [sp+3]                              ; subtract divisor Y from dividend X
    jc .no_borrow                           ; determine if no borrow in subvtraction
    jmp .done                               ; there was a borrow, subtraction loop is done
.no_borrow:
    inc i                                   ; increment quotient counter
    jeq .done_no_add, 0                     ; if value in A (X) is now zero, done with subtraction loop.
    jmp .sub_loop                           ; next subtraction loop
.done:
    add [sp+3]                              ; add Y back to now negative X to get remainder
.done_no_add:
    mov [sp+3], a                           ; copy remainder value into sp+3
    mov [sp+2], i                           ; copy quotient count into sp+2
    ret
.divide_by_zero:                            ; for now, just return 0
    mov2 [sp+3],0                           ; set remainder to 0
.return_zero:
    mov2 [sp+2],0                           ; set quotient to 0
    ret

; divide16
;   Divides X by Y
; 
;   Arguments:
;       sp+2 : value X dividend (2 bytes)
;       sp+4 : value Y divisor (2 bytes)
; 
;   Return Value:
;       sp+2 : the quotient (replaces X)
;       sp+4 : the remainder (replaces Y)
; 
;   Registers Used:
;       hl
;       a
divide16:
    push2 [sp+4]                            ; Place Y on stack
    push2 0
    call is_equal16                         ; see if Y is zero
    pop2
    pop2
    jeq .divide_by_zero, 1                  ; handle divide by zero
    push2 [sp+2]                            ; place X on stack
    push2 0
    call is_equal16                         ; see if X is zero
    pop2
    pop2
    jeq .return_zero, 1                     ; X is zero, answer is zero
    mov2 hl,0                               ; initialize quotient counter HL to 0
                                            ; at this point, stack variable locations:
                                            ;   [sp+2] : argument value X (2 bytes)
                                            ;   [sp+4] : argument value Y (2 bytes)
    push2 [sp+4]                            ; push Y onto stack (local Y)
    push2 [sp+(2+2)]                        ; push X onto stack (local X)
.sub_loop:
    call subtract16                         ; subtract Y from X
    jc .no_borrow                           ; determine if no borrow in subtraction
    jmp .done                               ; there was a borrow, subtraction loop is done    
.no_borrow:
    inc hl                                  ; subtraction complete, increment quotient counter
    push2 0                                 ; determine if result value is zero
    call is_equal16
    pop2                                    ; get rid of zero
    jeq .done_no_add, 1                     ; if X value is now zero, we are done with subtraction loop
    jmp .sub_loop                           ; subtract again. note stack has new X and original Y in place
.done:
    call add16                              ; subtraction loop went one too far, add Y back into X to get remainder
.done_no_add:
    mov2 [sp+(2+4)], hl                     ; copy final quotient counter to return position
    pop2 [sp+(4+4)]                         ; pop remainder (local X) into return position
    pop2                                    ; pop local Y. stack is restored.
    ret
.divide_by_zero:                            ; for now, just return 0
    mov2 [sp+4],0                           ; set remainder to 0
.return_zero:
    mov2 [sp+2],0                           ; set quotient to 0
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
; Registers used:
;    a
; 
; Flags Set
;   C if carry occured to 17th bit
; 
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

; subtract16
;   subtracts Y value from X
;
; Arguments
;   sp+2 - value X, two byte value
;   sp+4 - value Y, two byte value
;
; Return Value
;   sp+2 - replace the original two byte value with the sum
;
; Registers used:
;    a
; 
; Flags Set
;   C if no borrow was needed from 17th bit
; 
subtract16:
    mov a,[sp+2]                        ; move low bye of X to A
    sub [sp+4]                          ; subtract low byte of Y from X
    mov [sp+2], a                       ; move results to low byte of return value
    mov a, [sp+3]                       ; move high byte of X to A
    jc .no_borrow                       ; if carry is set, didn't have to borrow
.borrowed:
    ; if  borrowed, do the upper byte subtraction, then subtract 1 for the borrow
    sub [sp+5]
    sub 1
    mov [sp+3],a 
    ret
.no_borrow:
    ; if no borrow, do the upper byte sutraction straight
    sub [sp+5]
    mov [sp+3],a 
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
; Registers used:
;    hl
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
; Registers used:
;    hl
dec16:
    mov2 hl, [sp+2]             ; move value to be decremented in hl
    dec hl                      ; decrement it
    mov2 [sp+2], hl             ; place results back into position on stack
    ret                         ; return
