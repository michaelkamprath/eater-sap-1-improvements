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
;
delay8:
    push i
    mov i, [sp+2+1]
    cmp i,0
    je .end
.loop:
    dec i
    jnz .loop
.end:
    pop i
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
delay16:
    push2 hl
    mov2 hl, [sp+2+2]
.loop:
    dec hl
    jnz .loop
.end:
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
