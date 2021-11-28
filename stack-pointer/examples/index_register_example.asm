; Demostration of HL Register Usage
;
; This is a simple demostration of usage of the indiex register on the PUTEY-1 (BETA-2).
; It will increment the HL register and then copy the value to the MAR peridocically.
; Ideally the LEDs on HL and MAR will allow you to see what is happening.

OUTPUT = $7800          ; The display register is found at address $7800

.org 0
init:
    rsp
.restart:
    mov2 hl,0
    mov i,0
.iloop:
    mov2 mar, hl
    inc i
    jc .restart
    mov j, i
.hlloop:
    mov [OUTPUT], j
    inc hl
    dec j
    jz .iloop
    jmp .hlloop
