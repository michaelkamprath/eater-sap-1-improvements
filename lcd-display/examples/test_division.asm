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

	push2 [y_value] 				; divisor - 2
	push2 [x_value] 				; dividend - 4
	call divide16
									; at this point the stack is
									; [sp]   : quotient (results) (2 bytes)
									; [sp+2] : remainder (results) (2 bytes)
	push 0 							; push buffer index - 5
	push2 buffer 					; push buffer address - 7
	push2 [sp+(0+3)] 					; push qotient value - 9
	call uint16_to_hex_cstr
	pop2							; pop qotient value - 7
	pop2							; pop buffer address - 5
	pop 							; pop buffer index - 4
	push BUFFER_SIZE 				; push buffer size - 5 
	push2 buffer2 					; push buffer2 address (destination) - 7
	push2 buffer 					; push buffer address (right side) - 9
	push2 number_line_prefix  		; push prefix address (left side) - 11
	call cstr_concat
	pop2							; pop prefix - 9
	pop2							; pop buffer - 7
	pop2							; pop buffer2 - 5 
	push2 buffer 					; push buffer (destination) - 7
	push2 remainder_prefix    		; push remainder prefix address (right side_) - 9
	push2 buffer2					; push buffer2 address (left side) - 11
	call cstr_concat
	pop2							; pop buffer2 - 9 
	pop2							; pop prefix address - 7
	pop2							; pop pop buffer 5
	pop 							; pop buffer_size - 4
	push 0 							; push string index - 5
	push2 buffer2                   ; push buffer2 address - 7
	push2 [sp+(2+3)]             	; push remainder value - 9
	call uint16_to_hex_cstr
	pop2							; pop remainder value - 7
	pop2							; pop buffer2 - 5 
	pop 							; pop string index - 4
	pop2 							; pop y_value - 2
	pop2 							; pop x_value - 0 - stack is restored
	push BUFFER_SIZE 				; pop buffer size - 1
	push2 buffer 					; push buffer (destination) - 3
	push2 buffer2 					; push buffer 2 (right side) - 5
	push2 buffer 					; push buffer (left side) - 7
	call cstr_concat
	pop2							; pop buffer - 5
	pop2							; pop buffer2 - 3
	pop2							; pop buffer - 1
	pop 							; pop buffer size - 1 - stack is restored
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


