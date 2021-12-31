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
    mov a,h
    jeq .test_low, 0
    jmp .loop
.test_low:
    mov a,l
    jeq .end, 0
    jmp .loop
.end:
    ret