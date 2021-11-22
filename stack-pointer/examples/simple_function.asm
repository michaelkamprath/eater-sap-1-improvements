; Demostration of Stack Usage
;
; This is a simple demostration of usage of the stack on the PUTEY-1 (BETA-2).

OUTPUT = $7800                      ; The display register is found at address $7800

.org 0
init:
    rsp                             ; reset stack pointer
    mov [OUTPUT], 0                 ; init output
    push 0                          ; variable on stack
loop:
    call test_func                  ; call the test function
    mov [OUTPUT], [sp]              ; display the test function results on the stack.
    jmp loop                        ; continue with teh loop

; test_func
;
; A simple function that simply adds 1 to the value passed to it.
;
; arguments passed on stack:
;   sp+2 : The single byte value that 1 should be added to
;          Note that the stack pointer points to the return address, which is a 2 byte value,
;          hence the fact the argument is at [sp+2].
;
; returns:
;   sp+2 : the argument passed ont the stack is modified in place
;
test_func:
    mov a, [sp+2]
    add 1
    mov [sp+2], a
    ret

