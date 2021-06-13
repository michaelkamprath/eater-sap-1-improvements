; Count by Loop
;
; For the kamprath 16-bit addressing breadboard CPU.
;

init:
  seta 1
  sta increment

start:
  seta 0              ; load value of 0 into A
  out                 ; display

add_loop:
  add increment       ; add current value at 0xF to A
  jc increment_step   ; increment the step if overflow
  out                 ; display
  jmp add_loop        ; loop

increment_step:
  lda increment       ; load current increment value
  add one_value       ; add 1 to increment value
  jc restart_loops    ; if it overflows, just reset everything
  sta increment       ; save updated increment value
  jmp start           ; restart counting

restart_loops:
  seta 1              ; load the value of 1 into register A
  sta increment       ; reset the increment value to 1
  jmp start           ; restart counting

one_value:
  .byte 1             ; 1 value needed for incrementing the increment value

.zerountil $7fff      ; fill out the balance of 32K with zeros
.org $8000            ; The following variables should be in RAM
increment:
  .byte 1             ; storage for the current increment value

