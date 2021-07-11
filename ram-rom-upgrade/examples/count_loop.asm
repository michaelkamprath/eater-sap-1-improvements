; Simple Count Loop
;
; meant to be programmed into RAM
;

.org $8000

    seta 0
    out
loop:
    add one_val
    out
    jmp loop

one_val:
    .byte 1
    