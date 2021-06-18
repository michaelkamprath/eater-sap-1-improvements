;
; Fibonacci
;
; This program display the Fibonacci series
;

init:
    seta 0              ; initialize display
    out
    sta f_n_1           ; init F_n-1
    seta 1              
    sta f_n             ; init F_n
    ldi max_n           ; init loop counter

start:
    lda f_n             ; load F_n value into A
    sta temp_val        ; store F_n to temp variable 
    add f_n_1           ; add F_n-1 to F_n to find new F_n
    sta f_n             ; store the new F_n
    out                 ; diplay  fibonacci number
    lda temp_val        ; load the old F_n to write to F_n-1
    sta f_n_1           ; save the old F_n to F_n-1
    deci                ; decrement loop counter
    jz end              ; if at zero, we are done
    jmp start           ; restart loop
end:
    jmp init            ; restart sequence

max_n:
    .byte 12            ; Max fibonacci number for 8-bit (13) minus 1 (since loops tops at 0)

.zerountil $7fff        ; fill the rest of the ROM with zeros

; Variables in RAM
.org $8000
f_n_1:
    .byte 0
f_n:
    .byte 0
temp_val:
    .byte 0

