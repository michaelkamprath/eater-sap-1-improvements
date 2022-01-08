; Test 16-bit Subtractions
; 
; 	Subtracts X-Y

#require "putey-1-beta >= 0.3.0"
#include "system.asm"

BUFFER_SIZE = 21

.org $8000
x_value:
	.2byte 0
y_value:
	.2byte 0

.org $8100
x_value_cstr:
	.zero BUFFER_SIZE
y_value_cstr:
	.zero BUFFER_SIZE
buffer:
	.zero BUFFER_SIZE

.org 0
init:
	rsp
	call lcd_init
convert_and_display_x:
	push 0
	push2 x_value_cstr
	push2 [x_value]
	call uint16_to_hex_cstr
	pop2
	pop2
	pop
	push BUFFER_SIZE
	push2 buffer
	push2 x_value_cstr
	push2 number_line_prefix
	call cstr_concat
	pop2
	pop2
	pop2
	pop
	push2 buffer
	call lcd_print_line_cstr
	pop2
convert_and_display_y:	
	push 0
	push2 y_value_cstr
	push2 [y_value]
	call uint16_to_hex_cstr
	pop2
	pop2
	pop
	push BUFFER_SIZE
	push2 buffer
	push2 y_value_cstr
	push2 subtract_line_prefix
	call cstr_concat
	pop2
	pop2
	pop2
	pop
	push2 buffer
	call lcd_print_line_cstr
	pop2
calculate_and_display_result:
	push2 third_line
	call lcd_print_line_cstr
	pop2
	push2 number_line_prefix
	push2 buffer
	call cstr_copy
	call cstr_len8
	pop2
	pop2
	push a 							; save string length

	push2 [y_value]
	push2 [x_value]
	call subtract16
									; at this point the stack is
									; [sp]   : result () (2 bytes)
									; [sp+2] : y value
									; [sp+4] : saved string length (1 byte)
	push [sp+4]
	push2 buffer
	push2 [sp+3]					; result is at +3 now
	call uint16_to_hex_cstr
	pop2							; pop value
	call lcd_print_line_cstr		; print buffer with results
	pop2
	pop								; stack is restored
	hlt

number_line_prefix:
	.cstr "   $"

subtract_line_prefix:
	.cstr " - $"

third_line:
	.cstr "========="
