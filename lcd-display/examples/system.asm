


.org $3000
#include "lcdlib.asm"

;
; General System Utilities
;

; delay8
;   delays while counting down an 8-bit counter.
;
;   arguments:
;       sp+2    - An 8-bit value to count out
;
;   returns:
;       nothing
;
;   registers used:
;       a
;       i
;
delay8:
    mov i, [sp+2]
    mov a, i
    jeq .end, 0
.loop:
    dec i
    jz .end
    jmp .loop
.end:
    ret