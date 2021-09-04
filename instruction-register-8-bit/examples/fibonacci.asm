; Fibonacci Sequence Display
;
; Display the Fibonacci sequence for the range that is caculatable with 8-bit math

OUTPUT = $7800          ; The display register is found at address $7800


;
; Code
;
.org 0                  ; code starts at address 0
start:
    mov [OUTPUT],1      ; init display to 1
    mov i,1             ; init I to 1, represents second fibonacci number
    mov j,1             ; init J to 1, represents first fibonacci number
    mov a,i             ; init A with current fibonacci in register I
loop:
    add j               ; add J to A to yield next fibonacci number
    jc start            ; if there was a carry, then we can't calculate any more fibonacci. restart.
    mov [OUTPUT],a      ; display next fibonnaci number
    mov j,i             ; move last fibonacci to previous to last fibonacci
    mov i,a             ; move current fibonacci to last fibonacci
    jmp loop            ; loop