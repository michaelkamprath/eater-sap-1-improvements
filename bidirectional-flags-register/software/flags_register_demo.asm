#require "putey-1-beta >= 0.5.0"
#include "kernel.asm"

BUFFER_SIZE = 21
DELAY_COUNTER = $FFFF

; the goal of this program is to demonstrate the F (flags) register being able to be
; restored. It will do these steps:
;   1. clear flags register, and print its current content
;   2. do some math that causes a carry, and then print flags register content
;   3. push flags register to stack, then clear flags register contents and print that.
;   4. pop flag register value from after step 2 and print that.
;   5. set flag register so that only the equal flag (EF) is set, and demonstrate branching off that.
;   6. Success!

.org 0 "application_code"
start:
.step1:
    push2 step1_message
    call lcd_print_line_cstr
    pop2
    mov f,0
    call print_flag_bits
    push2 DELAY_COUNTER
    call delay16
    pop2

.step2:
    push2 step2_message
    call lcd_print_line_cstr
    pop2
    mov a,$ee
    add $42
    call print_flag_bits
    push2 DELAY_COUNTER
    call delay16
    pop2

.step3:
    push f
    push2 step1_message
    call lcd_print_line_cstr
    pop2
    mov f,0
    call print_flag_bits
    push2 DELAY_COUNTER
    call delay16
    pop2

.step4:
    push2 step4_message
    call lcd_print_line_cstr
    pop2
    pop f
    call print_flag_bits
    push2 DELAY_COUNTER
    call delay16
    pop2

.step5:
    push2 step5_message
    call lcd_print_line_cstr
    pop2
    mov f,EQUALS_FLAG
    call print_flag_bits
    push2 DELAY_COUNTER
    call delay16
    pop2
    mov f,EQUALS_FLAG
    je .branch_on_equals
    push2 step5_not_equals_message
    jmp .end
.branch_on_equals:
    push2 step5_equals_message
.end:
    call lcd_print_line_cstr
    pop2
    hlt

print_flag_bits:
    ; save a and i
    push2 hl
    push a
    push i
    push f                  ; save flag value to be printed
    push2 str_current_flags_prefix
    push2 str_buffer1
    call cstr_copy
    call cstr_len8          ; place str length into A
    pop2
    pop2
    pop i                   ; pop flag bits into i
    push a                  ; A has where the binary str should start
    push2 str_buffer1
    push i                  ; push flag state in I onto stack
    call uint8_to_binary_cstr
    pop i                   ; restore F state to I
    pop2
    pop
    push i                  ; save F state in I to stack again
    push2 str_buffer1
    call lcd_print_line_cstr
    pop2
.done:
    ; restore states
    pop f
    pop i
    pop a
    pop2 hl
    ret


step1_message:
    .cstr "Clearing flag bits"
step2_message:
    .cstr "Adding $EE+$42.."
step4_message:
    .cstr "Restoring flag bits"
step5_message:
    .cstr "Setting EQUAL flag"
step5_equals_message:
    .cstr "Branched on EQUAL=1"
step5_not_equals_message:
    .cstr "Branched on EQUAL=0"

str_current_flags_prefix:
    .cstr "Flag Bits: "


.memzone application_ram
str_buffer1:
    .zero BUFFER_SIZE
str_buffer2:
    .zero BUFFER_SIZE