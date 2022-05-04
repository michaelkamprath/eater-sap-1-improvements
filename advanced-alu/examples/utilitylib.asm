#require "putey-1-beta >= 0.4.dev"

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
    cmp i,0
    je .end
.loop:
    dec i
    jnz .loop
.end:
    ret


; delay16
;   delays while counting down an 16-bit counter.
;
;   arguments:
;       sp+2    - An 16-bit value to count out (2 bytes)
;
;   returns:
;       nothing
;
;   registers used:
;       a
;       hl
delay16:
    mov2 hl, [sp+2]
.loop:
    dec hl
    jnz .loop
.end:
    ret