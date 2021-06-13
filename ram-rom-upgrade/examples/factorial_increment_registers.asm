;
; Factorial
;
; This version of factorial uses the I and J increment regsiters
;

init:
    seta 0              ; initialize display
    out
start:
    ldi n_value         ; Load value N in register I
    lda n_value         ; Load register A with N value
i_loop:
    deci                ; decrement I. start of outer I loop
    jz display_results  ; jump to end of loop of I is zero
    sta x_var           ; Store current A register to results variable, "X variable"
    mvij                ; Copy current I value to J for multiplication loop
    decj                ; decrement J before start of multiplication loop
    jz i_loop           ; don't start multiplication loop if J started at 1
 j_loop:
    add x_var           ; Add "x variable" to A
    decj                ; decrement multiplication loop
    jz i_loop           ; exit multiplication loop if at zero
    jmp j_loop          ; multiplication loop
display_results:
    out                 ; register A still contains accumulated results
    hlt                 ; end of program

.zerountil $7fff        ; fill the rest of the ROM with zeros

; Variables in RAM
.org $8000
n_value:
    .byte 0            ; storage location for input N
x_var:
    .byte 0             ; storage location for X variable
