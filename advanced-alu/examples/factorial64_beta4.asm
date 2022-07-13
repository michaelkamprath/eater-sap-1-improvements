; 64 bit factorial demo for PUTEY-1 BETA-4
;
; Calcualtings a 64 bit factorial and displays result on LCD Module using hex
;
; Will cycle through calculaintg factorial from N=1 to N=20 (max
; calculatable factorial for 64 bit math). The DELAY_COUNT is used to pause
; display long enough for a human to see the results. It is tuned for a system
; clock of about 300 KHz. 
#require "putey-1-beta >= 0.4.1"
#include "system.asm"

DELAY_COUNT = $F000       ; Number of steps for delay counter
MAX_N = 20                ; max calculatable N value
BUFFER_SIZE = 32


;
; RAM variables
;
.org $8000
current_n:
    .8byte 0

string_buffer:
    .zero BUFFER_SIZE

decimal_buffer:
    .zero BUFFER_SIZE

cached_values:
	.zero 8*(MAX_N+1)

max_calculated_n:
    .byte 0

;
; Code
;
.org 0
init:
    rsp                                ; init the stack pointer
    call lcd_init                      ; init device
    mov [max_calculated_n],0           ; init cache max value
    push 8*(MAX_N+1)
    push 0
    push2 cached_values
    call memset8
    pop2
    pop
    pop
restart:
    mov8 [current_n],1                  ; init N variable
    ; display title banner
    push2 title_cstr
    call lcd_print_line_cstr
    mov2 [sp], blank_line_cstr
    call lcd_print_line_cstr
    pop2
    push2 DELAY_COUNT/2
    call delay16
    pop2
start:
    push8 [current_n]
    call display_calculating           ; display the current N value to calculate
    call calc_factorial64              ; call the factorial function, results on stack
    ; put N value on stack for results printing. results already on stack
    push8 [current_n]
    call display_results               ; display factorial results and current n value
    call inc64                         ; increment the n value
    ; update current_n with next value
    pop8 [current_n]           
    ; pop factorial result. stack is restored
    pop8
    ; delay some for your viewing pleasure
    push2 DELAY_COUNT
    call delay16
    pop2
    cmp MAX_N+1,[current_n]            ; check the low byte of current_n for value
    jo start
    jmp restart


; display_calculating
;   displays the value currently being calculated
;
;   Arguments
;       sp+2 : N value being calculated (2 byte)
display_calculating:
    push2 calculating_prefix_cstr
    push2 string_buffer
    call cstr_copy                      ; copy prefix to buffer
    pop2
    pop2
    push BUFFER_SIZE                    ; buffer size
    push2 decimal_buffer                ; the decimal string buffer
    push2 [sp+5]                        ; push the N value
    call uint16_to_decimal_cstr         ; cconver N value to decimal string
    pop2
    pop2
    pop
    push BUFFER_SIZE
    push2 string_buffer
    push2 decimal_buffer
    push2 string_buffer
    call cstr_concat
    pop2
    pop2
    pop2
    pop
    push BUFFER_SIZE
    push2 string_buffer
    push2 calculating_suffix_cstr
    call cstr_append
    pop2
    pop2
    pop
    push2 string_buffer                 ; the cstr to print
    call lcd_print_line_cstr            ; print it
    pop2
    ret

; display_results
;   Displays the results value
;
;   Arguments
;       sp+2 : the N value calculated (8 byte)
;       sp+10 : the results value (8 bytes)
display_results:

    push BUFFER_SIZE                    ; buffer size
    push2 decimal_buffer                ; the string buffer
    push8 [sp+(10+3)]                   ; push the results value
    call uint64_to_decimal_cstr         ; cconver results value to decimal string
    pop8
    pop2
    pop


    push2 decimal_buffer
    call lcd_print_line_cstr            ; current top of stack is string buffer. print it.
    pop2                                ; pop string buffer
    push2 blank_line_cstr               ; now print a blank line
    call lcd_print_line_cstr
    pop2                                ; stack is restored.
    ret

; calc_factorial64
;   calculate the factorial of 8 byte value N
;
; arguments passed on stack:
;   sp+2 : the N value to calculate factorial for, 8 byte value
;
; returns:
;   sp+2 : results overwite the N value
;
calc_factorial64:
	; check to see if we are at base case
	cmp [sp+(2+7)],0
	jne .not_basecase
	cmp [sp+(2+6)],0
	jne .not_basecase
	cmp [sp+(2+5)],0
	jne .not_basecase
	cmp [sp+(2+4)],0
	jne .not_basecase
	cmp [sp+(2+3)],0
	jne .not_basecase
	cmp [sp+(2+2)],0
	jne .not_basecase
	cmp [sp+(2+1)],0
	jne .not_basecase
	cmp [sp+(2+0)],1
	je .basecase
.not_basecase:
    ; first check for cached value. Assume uint8 value
    cmp [sp+(2+0)],[max_calculated_n]
    jo .calculate_factorial
    ;calculate array offset
    push [sp+(2+0)]
    push 8
    call multiply8
    push2 cached_values
    call add16
    pop2 hl
    pop
    pop
    ; copy cached factorial value to stack and return
    mov8 [sp+2],[hl+0]
    ret
.calculate_factorial:
	; push N value on stack
    push8 [sp+2]
	; decrement local N value
	mov a,[sp+0]
	sub 1
	mov [sp+0],a
	mov a,[sp+1]
	subb 0
	mov [sp+1],a	
	mov a,[sp+2]
	subb 0
	mov [sp+2],a
	mov a,[sp+3]
	subb 0
	mov [sp+3],a
	mov a,[sp+4]
	subb 0
	mov [sp+4],a
	mov a,[sp+5]
	subb 0
	mov [sp+5],a
	mov a,[sp+6]
	subb 0
	mov [sp+6],a
	mov a,[sp+7]
	subb 0
	mov [sp+7],a

	; calculate factorial
    call calc_factorial64                   ; recurse to calculate factorial(N-1)
    push8 [sp+(2+8)]                            ; push original N value on stack
    mov [max_calculated_n],[sp+(0)]         ; update max calculated n
    call multiply64                         ; calculate factorial(N-1)*N
    ; ensure the high 8 bytes of results are 0 -> only suppoprt 64-bit result
    cmp [sp+15],0
    jne .factorial_overflow
    cmp [sp+14],0
    jne .factorial_overflow
    cmp [sp+13],0
    jne .factorial_overflow
    cmp [sp+12],0
    jne .factorial_overflow
    cmp [sp+11],0
    jne .factorial_overflow
    cmp [sp+10],0
    jne .factorial_overflow
    cmp [sp+9],0
    jne .factorial_overflow
    cmp [sp+8],0
    jne .factorial_overflow
	; pop results into return value
    pop8 [sp+(2+16)]
	; pop high 8 byte into oblivian
	pop8
.finish:
    ; placed calculated value in cache
    ; calculate array offset
    push [max_calculated_n]
    push 8
    call multiply8                          ; result is 16 bit
    push2 cached_values
    call add16
    pop2 hl
    pop
    pop
    mov8 [hl+0],[sp+2]                      ; copy to cache location in HL
.basecase:
    ret
.factorial_overflow:
	push2 .factorial_overflow_cstr
	call lcd_print_line_cstr
	hlt
.factorial_overflow_cstr:
	.cstr "ERROR: n! overflow"

;
; Strings
;

title_cstr:
    .cstr "PUTEY-1 Factorial"
blank_line_cstr:
    .cstr " "
calculating_prefix_cstr:
    .cstr "Calculating: "
calculating_suffix_cstr:
	.cstr "! ="
