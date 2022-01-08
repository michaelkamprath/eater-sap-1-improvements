; Test 16-bit Division
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
buffer2:
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

	push2 [y_value] 				; divisor
	push2 [x_value] 				; dividend
	call divide16
									; at this point the stack is
									; [sp]   : quotient (results) (2 bytes)
									; [sp+2] : remainder (results) (2 bytes)

	push 0
	push2 buffer
	push2 [sp+3]
	call uint16_to_hex_cstr
	pop2
	pop2
	pop
	push BUFFER_SIZE
	push2 buffer2
	push2 buffer
	push2 number_line_prefix
	call cstr_concat
	pop2
	pop2
	pop2
	push2 buffer
	push2 remainder_prefix
	push2 buffer2
	call cstr_concat
	pop2
	pop2
	pop2
	push 0
	push2 buffer2
	push2 [sp+(2+4)]
	call uint16_to_hex_cstr
	pop2
	pop2
	pop
	push2 buffer
	push2 buffer2
	push2 buffer
	call cstr_concat
	pop2
	pop2
	pop2
	pop 							; stack is restored
	push2 buffer
	call lcd_print_line_cstr
	pop2
	hlt

number_line_prefix:
	.cstr "   $"

subtract_line_prefix:
	.cstr " \xFD $"

third_line:
	.cstr "========="

remainder_prefix:
	.cstr ", r $"


