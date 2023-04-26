#require "putey-1-beta >= 0.5.0"

;
; General System Utilities
;
.memzone system_code

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
;       hl
delay16:
    mov2 hl, [sp+2]
.loop:
    dec hl
    jnz .loop
.end:
    ret

; cmp16
;   Compares two 16-bit values, and sets OF (left > right) or EF (left == right) flags
;
;   Arguments
;       sp+2 : left value (2 bytes)
;       sp+4 : right value (2 bytes)
;
;   Returns
;       Nothing
;
; Registers used:
;    a
cmp16:
    push2 hl
    mov2 hl,[sp+2+2]
    cmp2 hl,[sp+4+2]
.done:
    pop2 hl
    ret


; cmp32
;   Compares two 32-bit values, and sets OF (left > right) or EF (left == right) flags
;
;   Arguments
;       sp+2 : left value (4 bytes)
;       sp+6 : right value (4 bytes)
;
;   Returns
;       Nothing
;
; Registers used:
;    a
cmp32:
    push2 hl
    ; first check high bytes
    mov2 hl,[sp+2+2+2]
    cmp2 hl,[sp+6+2+2]
    jne .done
    mov2 hl,[sp+2+0+2]
    cmp2 hl,[sp+6+0+2]
.done:
    pop2 hl
    ret
