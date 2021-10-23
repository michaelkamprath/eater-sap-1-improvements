; Factorial Sequence Display using Recursion
;
; Calculates and displays the factorial values for N from 1 to 5,
; which is the maximum factorial that can be calculated in 8-bit math.
; Uses a recursive approach enabled by a stack pointer.

OUTPUT = $7800          ; The display register is found at address $7800
MAX_N = 5               ; The maximum N value factorial will be calculated for


; code
.org 0
init:
    rsp                             ; init the stack pointer
    mov j, 0                        ; init N value counter
    mov [OUTPUT], 0                 ; init output
calc_loop:
    inc j
    mov a, j
    jeq init, MAX_N
    push a
    call calc_factorial
    pop
    mov [OUTPUT], a
    jmp calc_loop

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
    jeq _factorial_finish, 1        ; if N value is 1 jump to end of function (recursion stopping condition)
    sub 1                           ; subtract 1 from N
    push a                          ; push N-1 onto stack
    call calc_factorial             ; recurse into factoral function
    pop                             ; return stack to pre-call state
    push [sp+2]                     ; push N value onto stack again for call to multiply
    push a                          ; push result of factorial N-1 onto stack for multiply
    call multiply                   ; multiply
    pop                             ; return stack to pre-call state
    pop                             ; return stack to pre-call state
_factorial_finish:
    ret                             ; return. result is in A


; multiply
;
;
; arguments passed on stack:
;   sp+2 : multiplicand A
;   sp+3 : multiplicand B
;
; returns:
;   register A : the mulitplication results
;
; registers used: A, I
multiply:
    mov a,[sp+2]                    ; move first multiplicand into A
    jeq _multiply_finish, 0         ; if first multiplicand is 0, just return (A contains 0)
    mov i, a                        ; move first multiplicand in I to be the loop variable
    mov a,[sp+3]                    ; move second multiplicand into A
    jeq _multiply_finish, 0         ; if second multiplicand is 0, just return (A contains 0)
    dec i                           ; decrement the first multiplicand
    jz _multiply_finish             ; if first multiplicand was 1, just return (A contains second ultiplicand)
_multiply_loop:
    add [sp+3]                      ; add second multiplicand to running sum in A
    dec i                           ; decrement first multiplicand
    jz _multiply_finish             ; if we reach 0, multiply loop is done
    jmp _multiply_loop              ; next multiply loop iteration
_multiply_finish:
    ret                             ; return. result in A
