#require "putey-1-beta >= 0.4.dev2"

; cmp16
;   Compares two 16-bit values, and sets OF (left > right) or EF (left == right) flags
;
;   Arguments
;       sp+2 : left value (2 bytes)
;       sp+4 : right value (2 bytes)
;
;   Returns
;       Nothing
;
; Registers used:
;    a
cmp16:
    ; first check high bytes
    cmp [sp+3],[sp+5]
    je .check_low_byte
    ; high bytes are not equal, so return with current flags
    ret
.check_low_byte:
    cmp [sp+2],[sp+4]
    ret

; lsl16
;   Logical left shift for a 16 bit value
; 
;   Arguments
;       sp+2 : the value to be shift left (2 bytes)
; 
;   Returns
;       sp+2 : the left shifted value
; 
;   Flags Set
;       CF if carry occured to 17th bit
lsl16:
    mov a,[sp+2]            ; start with least significant byte
    lsl                     ; shift it left, setting CF if needed
    mov [sp+2],a            ; place shifted value back
    mov a,[sp+3]            ; now load most significant byte
    lslc                    ; shift it left with carry
    mov [sp+3],a            ; place shifted value back
    ret


; lsl24
;   Logical left shift for a 24 bit value
; 
;   Arguments
;       sp+2 : the value to be shift left (3 bytes)
; 
;   Returns
;       sp+2 : the left shifted value
; 
;   Flags Set
;       CF if carry occured to 25th bit
; 
lsl24:
    mov a,[sp+2]            ; start with least significant byte
    lsl                     ; shift it left, setting CF if needed
    mov [sp+2],a            ; place shifted value back
    mov a,[sp+3]            ; next byte
    lslc
    mov [sp+3],a
    mov a,[sp+4]            ; next byte
    lslc
    mov [sp+4],a
    ret 


; lsr16
;   Logical right shift for a 16 bit value
; 
;   Arguments
;       sp+2 : the value to be shift right (2 bytes)
; 
;   Returns
;       sp+2 : the right shifted value
; 
;   Flags Set
;       CF if carry occured past 0th bit
; 
lsr16:
    mov a,[sp+3]            ; start with most significant byte
    lsr                     ; shift it right, setting CF if needed
    mov [sp+3],a            ; place shifted value back
    mov a,[sp+2]            ; now load least significant byte
    lsrc                    ; shift it right with carry
    mov [sp+2],a            ; place shifted value back
    ret                     ; done

; lsr32
;   Logical right shift for a 32 bit value
; 
;   Arguments
;       sp+2 : the value to be shift right (4 bytes)
; 
;   Returns
;       sp+2 : the right shifted value
; 
;   Flags Set
;       CF if carry occured past 0th bit
; 
lsr32:
    mov a,[sp+5]            ; start with most significant byte
    lsr                     ; shift it right, setting CF if needed
    mov [sp+5],a            ; place shifted value back
    mov a,[sp+4]            ; repeat on next byte with carry
    lsrc 
    mov [sp+4],a
    mov a,[sp+3]            ; repeat on next byte with carry
    lsrc 
    mov [sp+3],a
    mov a,[sp+2]            ; repeat on next byte with carry
    lsrc 
    mov [sp+2],a
    ret                     ; done

; lsr64
;   Logical right shift for a 64 bit value
; 
;   Arguments
;       sp+2 : the value to be shift right (8 bytes)
; 
;   Returns
;       sp+2 : the right shifted value
; 
;   Flags Set
;       CF if carry occured past 0th bit
; 
lsr64:
    mov a,[sp+9]            ; start with most significant byte
    lsr                     ; shift it right, setting CF if needed
    mov [sp+9],a            ; place shifted value back
    mov a,[sp+8]            ; repeat on next byte with carry
    lsrc 
    mov [sp+8],a
    mov a,[sp+7]            ; repeat on next byte with carry
    lsrc 
    mov [sp+7],a
    mov a,[sp+6]            ; repeat on next byte with carry
    lsrc 
    mov [sp+6],a
    mov a,[sp+5]            ; repeat on next byte with carry
    lsrc 
    mov [sp+5],a
    mov a,[sp+4]            ; repeat on next byte with carry
    lsrc 
    mov [sp+4],a
    mov a,[sp+3]            ; repeat on next byte with carry
    lsrc 
    mov [sp+3],a
    mov a,[sp+2]            ; repeat on next byte with carry
    lsrc 
    mov [sp+2],a
    ret                     ; done

; multiply16
;   multiply two byte values X*Y, producing in a 4 byte results
;
; Arguments
;   sp+2 - value X (multiplier) (2 bytes)
;   sp+4 - value Y (multiplicand) (2 bytes)
;
; Return Value
;   sp+2 - results (4 bytes)
; 
; Registers used
;   i
; 
multiply16:
    ; set counter for 16 bits
    mov i,16
    ; set up 4 byte results memory block
    push2 0                 ; high word inialized to 0
    push2 [sp+(2+2)]        ; multiplier in low word
    ; Stack state:
    ;   sp+0 : 4 byte results memory
    ;   sp+6 : original multiplier
    ;   sp+8 : multiplicand
.loop:
    ; check to see if LSb of working memory multiplier is 1
    tstb [sp+0],0           ; right most (LSB) bit of multiplier 
    jz .continue
    ; add high word of results to multiplicand
    push2 [sp+(0+2)]
    push2 [sp+(8+2)]
    call add16
    pop2 [sp+(0+2+4)]       ; place sum results into high word of results memory
    pop2
.continue:
    ; shift results right one. alread at [sp] so just call
    call lsr32
    ; decrement counter and stop if 0
    dec i
    jz .done
    jmp .loop
.done:
    ; pop results to return stack
    pop2 [sp+6]
    pop2 [sp+6]
    ret


; multiply32
;   multiply 4 byte values X*Y, producing in a 8 byte results
;
; Arguments
;   sp+2 - value X (multiplier) (4 bytes)
;   sp+6 - value Y (multiplicand) (4 bytes)
;
; Return Value
;   sp+2 - results (8 bytes)
; 
; Registers used
;   i
; 
multiply32:
    ; set counter for 32 bits
    mov i,32
    ; set up 8 byte results memory block
    push2 0                 ; high word inialized to 0
    push2 0 
    push2 [sp+(2+2+4)]      ; multiplier in low word
    push2 [sp+(2+0+6)]
    ; Stack state:
    ;   sp+0  : 8 byte results memory (high word at sp+4)
    ;   sp+10 : original multiplier (4 bytes)
    ;   sp+14 : multiplicand (4 bytes)
.loop:
    ; check to see if LSb of working memory is 1
    tstb [sp+0],0
    jz .continue
    ; add high word of results to multiplicand
    push2 [sp+(4+2+0)]
    push2 [sp+(4+0+2)]
    push2 [sp+(10+2+4)]
    push2 [sp+(10+0+6)]
    call add32
    pop2 [sp+(0+4+8)]       ; place sum results into high word of results memory
    pop2 [sp+(2+4+6)]
    pop2
    pop2
.continue:
    ; shift results right one. alread at [sp] so just call
    call lsr64
    ; decrement counter and stop if 0
    dec i
    jz .done
    jmp .loop
.done:
    ; pop results to return stack
    pop2 [sp+(0+10)]
    pop2 [sp+(2+8)]
    pop2 [sp+(4+6)]
    pop2 [sp+(6+4)]
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
    cmp [sp+3], 0                           ; check for divide by zero
    je .divide_by_zero
    cmp [sp+2], 0                           ; return zero if dividend is 0
    je .return_zero
    mov i,0
.sub_loop:
    sub [sp+3]                              ; subtract divisor Y from dividend X
    jc .no_borrow                           ; determine if no borrow in subvtraction
    jmp .done                               ; there was a borrow, subtraction loop is done
.no_borrow:
    inc i                                   ; increment quotient counter
    cmp a, 0
    je .done_no_add                         ; if value in A (X) is now zero, done with subtraction loop.
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
    call cmp16                              ; see if Y is zero
    pop2
    pop2
    je .divide_by_zero                      ; handle divide by zero
    push2 [sp+2]                            ; place X on stack
    push2 0
    call cmp16                              ; see if X is zero
    pop2
    pop2
    je .return_zero                         ; X is zero, answer is zero
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
    call cmp16
    pop2                                    ; get rid of zero
    je .done_no_add                         ; if X value is now zero, we are done with subtraction loop
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
;   CF if carry occured to 17th bit
; 
add16:
    mov a, [sp+2]                       ; move low byte of value X into register A
    add [sp+4]                          ; add low byte of value Y to alue in regsiter A
    mov [sp+2], a                       ; move addition results to low byte of return value
    mov a, [sp+3]                       ; move high byte of value X into register A
    addc [sp+5] 
    mov [sp+3], a                       ; move the high byte results to the stack
    ret

; add32
;   adds values X+Y
;
; Arguments
;   sp+2 - value X, 4 byte value
;   sp+6 - value Y, 4 byte value
;
; Return Value
;   sp+2 - replace the original two byte value with the sum
;
; Registers used:
;    a
; 
; Flags Set
;   CF if carry occured to 33th bit
; 
add32:
    mov a, [sp+2]                       ; move low byte of value X into register A
    add [sp+6]                          ; add low byte of value Y to alue in regsiter A
    mov [sp+2], a                       ; move addition results to low byte of return value
    mov a, [sp+(2+1)]                   ; move next byte of value X into register A
    addc [sp+(6+1)] 
    mov [sp+(2+1)], a                   ; move the next bye results to the stack
    mov a, [sp+(2+2)]                   ; move next byte of value X into register A
    addc [sp+(6+2)] 
    mov [sp+(2+2)], a                   ; move the next bye results to the stack
    mov a, [sp+(2+3)]                   ; move next byte of value X into register A
    addc [sp+(6+3)] 
    mov [sp+(2+3)], a                   ; move the next bye results to the stack
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
;   CF if no borrow was needed from 17th bit
; 
subtract16:
    mov a,[sp+2]                        ; move low bye of X to A
    sub [sp+4]                          ; subtract low byte of Y from X
    mov [sp+2], a                       ; move results to low byte of return value
    mov a, [sp+3]                       ; move high byte of X to A
    subb [sp+5]                         ; subtract with borrow high byte
    mov [sp+3],a                        ; save results
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
