; Factorial Sequence Display using Recursion
;
; Calculates and displays the factorial values for N value as set in RAM at $8000.
; Uses a recursive approach enabled by a stack pointer.

OUTPUT = $7800          ; The display register is found at address $7800
MAX_N = 6               ; The first N value factorial cannot be calculated for
WAIT_COUNT = 16

; RAM variables
.org $8000
n_value:
    .byte 0

; code
.org 0
init:
    rsp                             ; init the stack pointer
    mov [OUTPUT], 0                 ; init output
    push [n_value]                  ; push N value on stack
    call calc_factorial             ; call factorial function
    pop                             ; remove N value from stack
    mov [OUTPUT], a                 ; display result
    hlt                             ; stop

; calc_factorial
;
; arguments passed on stack:
;   sp+2 : the N value to calculate factorial for
;
; returns:
;   register A : the factorial results
;
calc_factorial:
    mov a, [sp+2]                   ; move N value in A
    jeq .finish, 1                  ; if N value is 1 jump to end of function (recursion stopping condition)
    sub 1                           ; subtract 1 from N
    push a                          ; push N-1 onto stack
    call calc_factorial             ; recurse into factoral function
    pop                             ; return stack to pre-call state
    push a                          ; push result of factorial N-1 onto stack for multiply
    push [sp+3]                     ; push N value onto stack again for call to multiply (now at sp+3 given prior push)
    call multiply                   ; multiply
    pop                             ; return stack to pre-call state
    pop                             ; return stack to pre-call state
.finish:
    ret                             ; return. result is in A


; multiply
;
;
; arguments passed on stack:
;   sp+2 : multiplicand A
;   sp+3 : multiplicand B, ideally the smaller value
;
; returns:
;   register A : the mulitplication results
;
; registers used: A, I
multiply:
    mov a,[sp+2]                    ; move first multiplicand into A
    jeq .finish, 0                  ; if first multiplicand is 0, just return (A contains 0)
    mov i, a                        ; move first multiplicand in I to be the loop variable
    mov a,[sp+3]                    ; move second multiplicand into A
    jeq .finish, 0                  ; if second multiplicand is 0, just return (A contains 0)
    dec i                           ; decrement the first multiplicand
    jz .finish                      ; if first multiplicand was 1, just return (A contains second ultiplicand)
.loop:
    add [sp+3]                      ; add second multiplicand to running sum in A
    dec i                           ; decrement first multiplicand
    jz .finish                      ; if we reach 0, multiply loop is done
    jmp .loop                       ; next multiply loop iteration
.finish:
    ret                             ; return. result in A
