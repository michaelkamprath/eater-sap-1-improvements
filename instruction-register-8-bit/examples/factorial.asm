; Factorial Sequence Display
;
; Calculates and displays the factorial values for N from 1 to 5,
; which is the maximum factorial that can be calculated in 8-bit math.

OUTPUT = $7800          ; The display register is found at address $7800
MAX_N = 5               ; The maximum N value factorial will be calculated for
DELAY_COUNT = 16        ; Delay this amount after displaying factorial value

;
; Variables in RAM
;
.org $8100              ; start variable locations at address $8100
x_var:                  ; variable used for muyltiplication
    .byte 0

;
; Code
;
.org 0                  ; code starts at address 0
start:
    mov [OUTPUT],1      ; init display to 1
    mov i,1             ; init I to 1, represents N value
    mov a,1             ; init A to 1, contains factorial value

factorial_loop:
    swap a,i            ; first check if N is at MAX_N. Place I into A to check, preserving A
    jeq start,MAX_N     ; if I is at MAX_N, restart things
    swap a,i            ; place fatorial value back in A and N value back into I
    inc i               ; incrmeent N value to calculated next factorial
    mov [x_var],a       ; Place last factorial value into x_var
    mov j,i             ; Copy N value to J fo the multiplication loop
    dec j               ; decrement J since A already contain on instace of x_var
multiply_loop:
    add [x_var]         ; add x_var to A
    dec j               ; decrement J
    jz factorial_out    ; if J is at 0 then we are done with multiplication loop
    jmp multiply_loop   ; continue with multiplication loop
factorial_out:
    mov [OUTPUT],a      ; display the calculated factorial value
    mov j,DELAY_COUNT   ; init J for a delay loop
delay_loop:
    dec j               ; decrement J in delay loop
    jz factorial_loop   ; if at end of delay loop, continue to next factorial calculation
    jmp delay_loop      ; continue with delay loop


