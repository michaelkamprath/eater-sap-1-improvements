; Up/Down Counting Loop
;
; Counts from 0 to 255 using a varying increment amount. First counts to
; 255 by 1, then by 2, then by 3, and so on. when the increment reach 255,
; the counting loop continues but the increment is decreased by 1 for each
; loop until the increment returns to 1 and the whole cycle restarts.
;
; Design for the PUTEY Beta 1 computer
;

OUTPUT = $7800          ; The display register is found at address $7800

;
; Variables in RAM
;
.org $8100              ; start variable locations at address $8100
updownflag:             ; variable used to keep track of status
    .byte 0

;
; Code
;
.org 0                  ; code starts at address 0
    mov [updownflag],1  ; init up/down flag to 1 for "up"
init:
    mov i, 1            ; init I to starting step value 1


start_loop:
    mov a, 0            ; load value of 0 into A
    mov [OUTPUT], a     ; display

add_loop:
    add i               ; add current value in I to A
    jc update_step      ; update the step if carry
    mov [OUTPUT], a     ; display
    jmp add_loop        ; loop

update_step:
    mov a,[updownflag]  ; setup up/down to be tested
    jeq inc_step,1      ; jump to increment if up/down is true
    dec i               ; decrement i
    jz bounce_zero      ; if increment is zero, change iup/down
    jmp start_loop
bounce_zero:
    mov i,1
    mov [updownflag],1
    jmp start_loop

inc_step:
    inc i               ; increment I
    jc bounce_max
    jmp start_loop
bounce_max:
    mov i,$ff
    mov [updownflag],0
    jmp start_loop      ; restart counting
