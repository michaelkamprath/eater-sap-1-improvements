; Up/Down Counting Loop
;
; Counts from 0 to 255 using a varying increment amount. First counts to
; 255 by 1, then by 2, then by 3, and so on. when the increment reach 255,
; the counting loop continues but the increment is decreased by 1 for each
; loop until the increment returns to 1 and the whole cycle restarts.
;
; Design for the PUTEY Beta 2 computer to use function calls

OUTPUT = $7800          ; The display register is found at address $7800

;
; Code
;

.org 0
init:
    rsp                     ; initialize the stack pointer
    push 1                  ; push the first increment value on the stack
start:
    call sum_loop
    pop a
    add 1
    jc init
    push a
    jmp start



; sum_loop
;   counts from 0 to 255 or overflow by the passed increment value
;
; Arguments:
;   sp+2 - the value to increment by
;
; Returns:
;   nothing
;
; Uses:
;   register A

sum_loop:
    mov a, 0                ; reset A to 0
    mov [OUTPUT], a        ; display value of a
.loop:
    add [sp+2]
    jc .end
    mov [OUTPUT], a        ; display value of a
    jmp .loop
.end:
    ret