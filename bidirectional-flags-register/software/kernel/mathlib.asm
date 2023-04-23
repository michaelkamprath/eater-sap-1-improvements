#require "putey-1-beta >= 0.5.0"


; RAM variables
.memzone system_variables
_random_seed_x:     .byte 0
_random_seed_a:     .byte 0
_random_seed_b:     .byte 0
_random_seed_c:     .byte 0

.memzone system_code
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


lsl32:
    mov a,[sp+2]            ; start with least significant byte
    lsl                     ; shift it left, setting CF if needed
    mov [sp+2],a            ; place shifted value back
    mov a,[sp+3]            ; next byte
    lslc
    mov [sp+3],a
    mov a,[sp+4]            ; next byte
    lslc
    mov [sp+4],a
    mov a,[sp+5]            ; next byte
    lslc
    mov [sp+5],a
    ret

; lsl40
;   Logical left shift for a 40 bit value
;
;   Arguments
;       sp+2 : the value to be shift left (5 bytes)
;
;   Returns
;       sp+2 : the left shifted value
;
;   Flags Set
;       CF if carry occured to 41st bit
;
lsl40:
    mov a,[sp+2]            ; start with least significant byte
    lsl                     ; shift it left, setting CF if needed
    mov [sp+2],a            ; place shifted value back
    mov a,[sp+3]            ; next byte
    lslc
    mov [sp+3],a
    mov a,[sp+4]            ; next byte
    lslc
    mov [sp+4],a
    mov a,[sp+5]            ; next byte
    lslc
    mov [sp+5],a
    mov a,[sp+6]            ; next byte
    lslc
    mov [sp+6],a
    ret

; lsl64
;   Logical left shift for a 64 bit value
;
;   Arguments
;       sp+2 : the value to be shift left (8) bytes)
;
;   Returns
;       sp+2 : the left shifted value
;
;   Flags Set
;       CF if carry occured to 65th bit
;
lsl64:
    mov a,[sp+2]            ; start with least significant byte
    lsl                     ; shift it left, setting CF if needed
    mov [sp+2],a            ; place shifted value back
    mov a,[sp+3]            ; next byte
    lslc
    mov [sp+3],a
    mov a,[sp+4]            ; next byte
    lslc
    mov [sp+4],a
    mov a,[sp+5]            ; next byte
    lslc
    mov [sp+5],a
    mov a,[sp+6]            ; next byte
    lslc
    mov [sp+6],a
    mov a,[sp+7]            ; next byte
    lslc
    mov [sp+7],a
    mov a,[sp+8]            ; next byte
    lslc
    mov [sp+8],a
    mov a,[sp+9]            ; next byte
    lslc
    mov [sp+9],a
    ret

; lsl72
;   Logical left shift for a 72 bit value
;
;   Arguments
;       sp+2 : the value to be shift left (9 bytes)
;
;   Returns
;       sp+2 : the left shifted value
;
;   Flags Set
;       CF if carry occured to 73th bit
;
lsl72:
    mov a,[sp+2]            ; start with least significant byte
    lsl                     ; shift it left, setting CF if needed
    mov [sp+2],a            ; place shifted value back
    mov a,[sp+3]            ; next byte
    lslc
    mov [sp+3],a
    mov a,[sp+4]            ; next byte
    lslc
    mov [sp+4],a
    mov a,[sp+5]            ; next byte
    lslc
    mov [sp+5],a
    mov a,[sp+6]            ; next byte
    lslc
    mov [sp+6],a
    mov a,[sp+7]            ; next byte
    lslc
    mov [sp+7],a
    mov a,[sp+8]            ; next byte
    lslc
    mov [sp+8],a
    mov a,[sp+9]            ; next byte
    lslc
    mov [sp+9],a
    mov a,[sp+10]            ; next byte
    lslc
    mov [sp+10],a
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

; lsr128
;   Logical right shift for a 128 bit value
; 
;   Arguments
;       sp+2 : the value to be shift right (16 bytes)
; 
;   Returns
;       sp+2 : the right shifted value
; 
;   Flags Set
;       CF if carry occured past 0th bit
; 
lsr128:
    mov a,[sp+17]            ; start with most significant byte
    lsr                     ; shift it right, setting CF if needed
    mov [sp+17],a            ; place shifted value back
    mov a,[sp+16]            ; repeat on next byte with carry
    lsrc
    mov [sp+16],a
    mov a,[sp+15]            ; repeat on next byte with carry
    lsrc
    mov [sp+15],a
    mov a,[sp+14]            ; repeat on next byte with carry
    lsrc
    mov [sp+14],a
    mov a,[sp+13]            ; repeat on next byte with carry
    lsrc
    mov [sp+13],a
    mov a,[sp+12]            ; repeat on next byte with carry
    lsrc
    mov [sp+12],a
    mov a,[sp+11]            ; repeat on next byte with carry
    lsrc
    mov [sp+11],a
    mov a,[sp+10]            ; repeat on next byte with carry
    lsrc
    mov [sp+10],a
    mov a,[sp+9]             ; repeat on next byte with carry
    lsrc
    mov [sp+9],a
    mov a,[sp+8]             ; repeat on next byte with carry
    lsrc
    mov [sp+8],a
    mov a,[sp+7]             ; repeat on next byte with carry
    lsrc
    mov [sp+7],a
    mov a,[sp+6]             ; repeat on next byte with carry
    lsrc
    mov [sp+6],a
    mov a,[sp+5]             ; repeat on next byte with carry
    lsrc
    mov [sp+5],a
    mov a,[sp+4]             ; repeat on next byte with carry
    lsrc
    mov [sp+4],a
    mov a,[sp+3]             ; repeat on next byte with carry
    lsrc
    mov [sp+3],a
    mov a,[sp+2]             ; repeat on next byte with carry
    lsrc
    mov [sp+2],a
    ret                     ; done


; multiply8
;   multiply one byte values X*Y, producing in a 2 byte results
;
; Arguments
;   sp+2 - value X (multiplier) (1 bytes)
;   sp+3 - value Y (multiplicand) (1 bytes)
;
; Return Value
;   sp+2 - results (2 bytes)
; 
; Registers used
;   i, a
; 
multiply8:
    ; set counter for 16 bits
    mov i,8
    ; set up 4 byte results memory block
    push 0                 ; high word inialized to 0
    push [sp+(2+1)]        ; multiplier in low word
    ; Stack state:
    ;   sp+0 : 2 byte results memory
    ;   sp+4 : original multiplier
    ;   sp+5 : multiplicand
.loop:
    ; check to see if LSb of working memory multiplier is 1
    tstb [sp+0],0           ; right most (LSB) bit of multiplier 
    jz .continue
    ; add high word of results to multiplicand
    mov a, [sp+(0+1)]
    add [sp+5]
    mov [sp+(0+1)], a
.continue:
    ; shift results right one. alread at [sp] so just call
    call lsr16
    ; decrement counter and stop if 0
    dec i
    jz .done
    jmp .loop
.done:
    ; pop results to return stack
    pop2 [sp+4]
    ret

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
    push4 0                 ; high word inialized to 0
    push4 [sp+(2+4)]        ; multiplier in low word
    ; Stack state:
    ;   sp+0  : 8 byte results memory (high word at sp+4)
    ;   sp+10 : original multiplier (4 bytes)
    ;   sp+14 : multiplicand (4 bytes)
.loop:
    ; check to see if LSb of working memory is 1
    tstb [sp+0],0
    jz .continue
    ; add high word of results to multiplicand
    push4 [sp+(4+0)]
    push4 [sp+(10+4)]
    call add32
    pop4 [sp+(4+8)]         ; place sum results into high word of results memory
    pop4
.continue:
    ; shift results right one. alread at [sp] so just call
    call lsr64
    ; decrement counter and stop if 0
    dec i
    jz .done
    jmp .loop
.done:
    ; pop results to return stack
    pop4 [sp+(2+8)]
    pop4 [sp+(6+4)]
    ret

; multiply64
;   multiply 8 byte values X*Y, producing in a 16 byte results
;
; Arguments
;   sp+2 - value X (multiplier) (8 bytes)
;   sp+10 - value Y (multiplicand) (8 bytes)
;
; Return Value
;   sp+2 - results (16 bytes)
; 
; Registers used
;   i
; 
multiply64:
    ; set counter for 64 bits
    mov i,64
    ; set up 18 byte results memory block
    push8 0                 ; high word inialized to 0
    push8 [sp+(2+8)]        ; multiplier in low word

    ; Stack state:
    ;   sp+0  : 16 byte results memory (high word at sp+8)
    ;   sp+18 : original multiplier (8 bytes)
    ;   sp+26 : multiplicand (8 bytes)
.loop:
    ; check to see if LSb of working memory is 1
    tstb [sp+0],0
    jz .continue
    ; add high word of results to multiplicand
    mov a,[sp+(8+0)]
    add [sp+(26+0)]
    mov [sp+(8+0)],a
    mov a,[sp+(8+1)]
    addc [sp+(26+1)]
    mov [sp+(8+1)],a
    mov a,[sp+(8+2)]
    addc [sp+(26+2)]
    mov [sp+(8+2)],a
    mov a,[sp+(8+3)]
    addc [sp+(26+3)]
    mov [sp+(8+3)],a
    mov a,[sp+(8+4)]
    addc [sp+(26+4)]
    mov [sp+(8+4)],a
    mov a,[sp+(8+5)]
    addc [sp+(26+5)]
    mov [sp+(8+5)],a
    mov a,[sp+(8+6)]
    addc [sp+(26+6)]
    mov [sp+(8+6)],a
    mov a,[sp+(8+7)]
    addc [sp+(26+7)]
    mov [sp+(8+7)],a
.continue:
    ; shift results right one. alread at [sp] so just call
    call lsr128
    ; decrement counter and stop if 0
    dec i
    jz .done
    jmp .loop
.done:
    ; pop results to return stack
    pop8 [sp+(2+16)]
    pop8 [sp+(10+8)]
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
; 
divide16:
    mov2 hl,0
    cmp2 hl,[sp+4]                  ; see if Y is zero
    je .divide_by_zero              ; handle divide by zero
    cmp2 hl,[sp+2]                  ; see if X is zero
    je .return_zero                 ; X is zero, answer is zero
    mov2 hl,[sp+4]                  ; divsor
    cmp2 hl,[sp+2]                  ; compare to dividend
    jo .divisor_too_large           ; divisor larger than dividend
    ; set up working stack
    push 0                          ; init carry bit
    push2 0                         ; init high value
    push2 [sp+(2+3)]                ; p[ush the value to be divided
    ; working stack:
    ;   sp+0 : low word  (2 bytes) -> becomes quotient
    ;   sp+2 : high word (2 bytes) -> becomes remainder
    ;   sp+4 : carry bit (1 byte)
    mov i,16
.div_loop:
    call lsl32                      ; shift working sack left 1 bit
    mov a,[sp+0]                    ; place carry bit in a
    or [sp+4]                       ; or the carry bit with the low working byte
    mov [sp+0],a                    ; replace the updated low working byte
    mov [sp+4],0                    ; reset carry bit 
     ; attempt substraction
    push2 [sp+(4+5)]                ; right side - divisor
    push2 [sp+(2+2)]                ; left side - current working high word
    call subtract16
    jc .div_loop_subtraction        ; if carry is set, that means divsor was smaller, no borrow needed
    ; a borrow was needed, so divisor was larger. don't save and do continue
    pop2
    pop2
    jmp .div_loop_continue
.div_loop_subtraction:
    ; save subtraction results to high word and set carry bit
    pop2 [sp+(0+2+4)]
    pop2
    mov [sp+4],1
.div_loop_continue:
    dec i
    jnz .div_loop
.division_done:
    ; at this point we have the remainder in the low word
    ; and then we let shift one more time to get the quotient
    mov2 [sp+(4+5)],[sp+2]
    call lsl32
    mov a,[sp+0]                    ; place carry bit in a
    or [sp+4]                       ; or the carry bit with the low working byte
    mov [sp+0],a                    ; replace the updated low working byte
    pop2 [sp+(2+5)]
    pop2
    pop
    ret
.divisor_too_large:
    ; quotient = 0, remander = dividend
    mov2 [sp+4],[sp+2]
    mov2 [sp+2],0
    ret
.divide_by_zero:                            ; for now, just return 0
    pop2
    mov2 [sp+4],0                           ; set remainder to 0
.return_zero:
    mov2 [sp+2],0                           ; set quotient to 0
    ret


; divide32
;   Divides X by Y
; 
;   Arguments:
;       sp+2 : value X dividend (4 bytes)
;       sp+6 : value Y divisor (4 bytes)
; 
;   Return Value:
;       sp+2 : the quotient (replaces X)
;       sp+6 : the remainder (replaces Y)
; 
;   Registers Used:
;       hl
;       a
; 
divide32:
    push4 0
    push4 [sp+(6+4)]                        ; Place Y on stack
    call cmp32                              ; see if Y is zero
    pop4
    je .divide_by_zero                      ; handle divide by zero
    push4 [sp+(2+4)]                        ; place X on stack
    call cmp32                              ; see if X is zero
    pop4
    pop4
    je .return_zero                  ; X is zero, answer is zero
    push4 [sp+(2+0)]                 ; right side - dividend
    push4 [sp+(6+4)]                 ; left side - divisor
    call cmp32
    pop4
    pop4
    jo .divisor_too_large           ; divisor larger than dividend
    ; set up working stack
    push 0                          ; init carry bit
    push4 0                         ; init high value
    push4 [sp+(2+5)]              ; push the value to be divided
    ; working stack:
    ;   sp+0 : low word  (4 bytes) -> becomes quotient
    ;   sp+4 : high word (4 bytes) -> becomes remainder
    ;   sp+8 : carry bit (1 byte)
    mov i,32
.div_loop:
    call lsl64                      ; shift working stack left 1 bit
    mov a,[sp+0]                    ; place carry bit in a
    or [sp+8]                       ; or the carry bit with the low working byte
    mov [sp+0],a                    ; replace the updated low working byte
    mov [sp+8],0                    ; reset carry bit
     ; attempt substraction
    push2 [sp+(6+2+9)]              ; right side - divisor
    push2 [sp+(6+0+11)]
    push2 [sp+(4+2+4)]              ; left side - current working high word
    push2 [sp+(4+0+6)]
    call subtract32
    jc .div_loop_subtraction        ; if carry is set, that means divsor was smaller, no borrow needed
    ; a borrow was needed, so divisor was larger. don't save and do continue
    pop2
    pop2
    pop2
    pop2
    jmp .div_loop_continue
.div_loop_subtraction:
    ; save subtraction results to high word and set carry bit
    pop2 [sp+(4+0+8)]
    pop2 [sp+(4+2+6)]
    pop2
    pop2
    mov [sp+8],1
.div_loop_continue:
    dec i
    jnz .div_loop
.division_done:
    ; at this point we have the remainder in the low word
    ; and then we let shift one more time to get the quotient
    mov2 [sp+(6+0+9)],[sp+(4+0)]
    mov2 [sp+(6+2+9)],[sp+(4+2)]
    call lsl64
    mov a,[sp+0]                    ; place carry bit in a
    or [sp+8]                       ; or the carry bit with the low working byte
    mov [sp+0],a                    ; replace the updated low working byte
    pop2 [sp+(2+0+9)]
    pop2 [sp+(2+2+7)]
    pop2
    pop2
    pop
    ret
.divisor_too_large:
    ; quotient = 0, remander = dividend
    mov2 [sp+(6+0)],[sp+(2+0)]
    mov2 [sp+(6+2)],[sp+(2+2)]
    mov2 [sp+(2+0)],0
    mov2 [sp+(2+2)],0
    ret
.divide_by_zero:                            ; for now, just return 0
    pop2
    pop2
    mov2 [sp+(6+0)],0                       ; set remainder to 0
    mov2 [sp+(6+2)],0
.return_zero:
    mov2 [sp+(2+0)],0                       ; set quotient to 0
    mov2 [sp+(2+2)],0
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
    mov [sp+3], a                       ; move the the high bye results to the stack
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


; add64
;   adds values X+Y
;
; Arguments
;   sp+2 - value X, 8 byte value
;   sp+10 - value Y, 8 byte value
;
; Return Value
;   sp+2 - replace the original 8 byte value with the sum
;
; Registers used:
;    a
; 
; Flags Set
;   CF if carry occured to 65th bit
; 
add64:
    mov a, [sp+2]                       ; move low byte of value X into register A
    add [sp+10]                          ; add low byte of value Y to alue in regsiter A
    mov [sp+2], a                       ; move addition results to low byte of return value
    mov a, [sp+(2+1)]                   ; move next byte of value X into register A
    addc [sp+(10+1)]
    mov [sp+(2+1)], a                   ; move the next bye results to the stack
    mov a, [sp+(2+2)]                   ; move next byte of value X into register A
    addc [sp+(10+2)]
    mov [sp+(2+2)], a                   ; move the next bye results to the stack
    mov a, [sp+(2+3)]                   ; move next byte of value X into register A
    addc [sp+(10+3)]
    mov [sp+(2+3)], a                   ; move the next bye results to the stack
    mov a, [sp+(2+4)]                   ; move next byte of value X into register A
    addc [sp+(10+4)]
    mov [sp+(2+4)], a                   ; move the next bye results to the stack
    mov a, [sp+(2+5)]                   ; move next byte of value X into register A
    addc [sp+(10+5)]
    mov [sp+(2+5)], a                   ; move the next bye results to the stack
    mov a, [sp+(2+6)]                   ; move next byte of value X into register A
    addc [sp+(10+6)]
    mov [sp+(2+6)], a                   ; move the next bye results to the stack
    mov a, [sp+(2+7)]                   ; move next byte of value X into register A
    addc [sp+(10+7)]
    mov [sp+(2+7)], a                   ; move the next bye results to the stack
    ret



; subtract16
;   subtracts Y value from X (X-Y)
;
; Arguments
;   sp+2 - value X, two byte value
;   sp+4 - value Y, two byte value
;
; Return Value
;   sp+2 - replace the original two byte value with the difference
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


; subtract32
;   subtracts Y value from X (X-Y)
;
; Arguments
;   sp+2 - value X, 4 byte value
;   sp+6 - value Y, 4 byte value
;
; Return Value
;   sp+2 - replace the original 4 byte value with the difference
;
; Registers used:
;    a
; 
; Flags Set
;   CF if no borrow was needed from 33rd bit
; 
subtract32:
    mov a,[sp+2]                        ; move low bye of X to A
    sub [sp+6]                          ; subtract low byte of Y from X
    mov [sp+2], a                       ; move results to low byte of return value
    mov a, [sp+3]                       ; next byte
    subb [sp+7]
    mov [sp+3],a
    mov a, [sp+4]                       ; next byte
    subb [sp+8]
    mov [sp+4],a
    mov a, [sp+5]                       ; next byte
    subb [sp+9]
    mov [sp+5],a
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

; inc32
;   Increments a 32-bit interger by 1.
;
; Arguments
;   sp+2 - the value to increment
;
; Returns
;   sp+2 - replaces argument with incremented value
;
inc32:
    mov a,[sp+(2+0)]
    add 1
    mov [sp+(2+0)],a
    mov a,[sp+(2+1)]
    addc 0
    mov [sp+(2+1)],a
    mov a,[sp+(2+2)]
    addc 0
    mov [sp+(2+2)],a
    mov a,[sp+(2+3)]
    addc 0
    mov [sp+(2+3)],a
    ret

; inc64
;   Increments a 64-bit interger by 1.
;
; Arguments
;   sp+2 - the value to increment
;
; Returns
;   sp+2 - replaces argument with incremented value
;
inc64:
    mov a,[sp+(2+0)]
    add 1
    mov [sp+(2+0)],a
    mov a,[sp+(2+1)]
    addc 0
    mov [sp+(2+1)],a
    mov a,[sp+(2+2)]
    addc 0
    mov [sp+(2+2)],a
    mov a,[sp+(2+3)]
    addc 0
    mov [sp+(2+3)],a
    mov a,[sp+(2+4)]
    addc 0
    mov [sp+(2+4)],a
    mov a,[sp+(2+5)]
    addc 0
    mov [sp+(2+5)],a
    mov a,[sp+(2+6)]
    addc 0
    mov [sp+(2+6)],a
    mov a,[sp+(2+7)]
    addc 0
    mov [sp+(2+7)],a
.end:
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
; Registers used:
;    hl
dec16:
    mov2 hl, [sp+2]             ; move value to be decremented in hl
    dec hl                      ; decrement it
    mov2 [sp+2], hl             ; place results back into position on stack
    ret                         ; return

;
; 8-bit Random Number Generator
; 
;   Based on algorithm listed here:
;       https://www.electro-tech-online.com/threads/ultra-fast-pseudorandom-number-generator-for-8-bit.124249/
; 

; init_random8:
; 
;   Arguments
;       sp+2 : A value (1 byte)
;       sp+3 : B value (1 byte)
;       sp+4 : C value (1 byte)
; 
;   Returns
;       nothing
; 
;   Registers Used
;       A
; 

init_random8:
    mov a,[_random_seed_a]
    xor [sp+2]
    mov [_random_seed_a],a
    mov a,[_random_seed_b]
    xor [sp+3]
    mov [_random_seed_b],a
    mov a,[_random_seed_c]
    xor [sp+4]
    mov [_random_seed_c],a
    call random8
    ret


; random8
; 
;   Arguments
;       none
; 
;   Returns
;       register A - 8 bit randome value
; 
random8:
    ; x++
    mov a,[_random_seed_x]
    add 1
    mov [_random_seed_x],a
    ; a = (a^c^x)
    mov a,[_random_seed_a]
    xor [_random_seed_c]
    xor [_random_seed_x]
    mov [_random_seed_a],a
    ; b = (b+a)
    mov a,[_random_seed_b]
    add [_random_seed_a]
    mov [_random_seed_b],a
    ; c = (c+(b>>1)^a)
    mov a,[_random_seed_b]
    lsr
    xor [_random_seed_a]
    add [_random_seed_c]
    mov [_random_seed_c],a
    ret

