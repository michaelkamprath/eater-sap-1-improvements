;
; Factorial
;
; This version of factorial use only the original Eater SAP-1 instructions
;

init:
    seta 0              ; initialize display
    out
start:
    lda n_value         ; Load N value
    sta result          ; Store N value in results variable
i_loop:
    sub one_val         ; Subtract 1 from I. On first pass, N and I are equivalent
    jz display_results  ; If I is 0, end both loops
    sta i_var           ; Save current I value
    sta j_var           ; Initialize J value with current I value
    lda result          ; Load results variable
    sta x_var           ; Store results variable to X variable
j_loop:
    lda j_var           ; Load J loop index
    sub one_val         ; Decrement J
    jz j_loop_end       ; End J loops if J is zero
    sta j_var           ; Save decremented J value
    lda result          ; Load results variable
    add x_var           ; Add X variable to results variable
    sta result          ; Save updated results variable
    jmp j_loop          ; restart J loop
j_loop_end:
    lda i_var           ; Load current I index
    jmp i_loop          ; restart I loop

display_results:
    lda result          ; Load results variable
    out                 ; Display results
    hlt                 ; end program

one_val:
    .byte 1             ; storage location for value of 1

.zerountil $7FFF        ; fill the rest of the ROM with zeros

; Variables in RAM
.org $8000
n_value:
    .byte 0             ; storage location for N value
i_var:
    .byte 0             ; Storage location for I index variable
j_var:
    .byte 0             ; storage location for J index variable
result:
    .byte 0             ; storage location for results variable
x_var:
    .byte 0             ; storage location for X variable

