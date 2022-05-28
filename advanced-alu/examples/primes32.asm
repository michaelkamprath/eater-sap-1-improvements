; Prime Cacluation - 64 Bit
; 	for PUTEY-1 Beta (4)
; 
;	Uses algorithm identified here: https://en.wikipedia.org/wiki/Primality_test
; 
#require "putey-1-beta >= 0.4.0"
#include "system.asm"

BUFFER_SIZE = 32

.org $8000
n_value:
	.8byte 0
string_buffer:
	.zero BUFFER_SIZE
decimal_buffer:
	.zero BUFFER_SIZE

.org 0
init:
	rsp
	call lcd_init
start:
	; place inistial N 32-bit value on stack
	push2 0
	push2 1
.n_loop:
	call is_prime32
	push a
	push BUFFER_SIZE
	push2 string_buffer
	push2 [sp+(0+2+4)]
	push2 [sp+(0+0+6)]
	call uint32_to_decimal_cstr
	pop2
	pop2
	pop2
	pop	
	pop a
	cmp a,1
	je .print_is_prime
	; Note: this line causes the printing of "is not prime" to be skipped
	; comment out if list of the "not primes" is desired.
	jmp .n_loop_continue
	push BUFFER_SIZE
	push2 string_buffer
	push2 not_prime_suffix_cstr
	call cstr_append
	pop2
	pop2
	pop	
	jmp .print_status
.print_is_prime:
	push BUFFER_SIZE
	push2 string_buffer
	push2 is_prime_suffix_cstr
	call cstr_append
	pop2
	pop2
	pop	
.print_status:
	push2 string_buffer
	call lcd_print_line_cstr
	pop2
.n_loop_continue:
	; increment N already on stack
	call inc32
	; for continuous operation, we are going to let N rollover
	jmp .n_loop

; is_prime32
; 	determines wither the passed uint32 is a prime
; 
;	Arguments
; 		sp+2 : the value to determine if prime (4 bytes)
; 
;	returns
; 		register A - 0 is not prime, 1 if is prime
; 
is_prime32:
	; first check if N is 2 or 3
	; if high word is not 0, then not 2 or 3
	push2 [sp+(2+2+0)]
	push2 0
	call cmp16
	pop2
	pop2
	jne .modulo_two
	; check 2
	push2 [sp+(2+0+0)]
	push2 2
	call cmp16
	pop2
	pop2
	je .is_prime
	; check 3
	push2 [sp+(2+0+0)]
	push2 3
	call cmp16
	pop2
	pop2
	je .is_prime
	; check <= 1
	push2 [sp+(2+0+0)]
	push2 1
	call cmp16
	pop2
	pop2
	je .is_not_prime
	jo .is_not_prime
.modulo_two:
	; check to see if a power of two
	tstb [sp+2],0
	jz .is_not_prime
	; check to see if multiple of 3
.modulo_three:
	push2 0
	push2 3
	push2 [sp+(2+2+4)]
	push2 [sp+(2+0+6)]
	call divide32
	pop2
	pop2
	push2 0 			; check remainder is 0
	push2 0
	call cmp32
	pop2
	pop2
	pop2
	pop2
	je .is_not_prime
.loop_init:
	; stack is back to initial state
	; set up iterator: 32 bit value starting at 5
	push2 0
	push2 5
.loop:
	; stack has 4 byte I value at sp+0
	; check I*I <= N
	push2 [sp+(0+2+0)]
	push2 [sp+(0+0+2)]
	push2 [sp+(0+2+4)]
	push2 [sp+(0+0+6)]
	call multiply32
	; high 4 bytes of result should be 0 since we are only doing 32 bit N
	cmp [sp+7],0
	jne .iteration_loop_done
	cmp [sp+6],0
	jne .iteration_loop_done
	cmp [sp+5],0
	jne .iteration_loop_done
	cmp [sp+4],0
	jne .iteration_loop_done
	; now compare low 4 bytes opf result to N
	; reuse the verified 0-value high word of multiplication results
	; so the I*I value on left side of conmparison.
	mov2 [sp+(4+2)],[sp+(2+2+12)]
	mov2 [sp+(4+0)],[sp+(2+0+12)]
	call cmp32
	pop2
	pop2
	pop2
	pop2
	jo .loop_done_is_prime
	; now check various modulos. 4 byte iterator I is one stack at sp+0
	; check N % I == 0
	push2 [sp+(0+2+0)]
	push2 [sp+(0+0+2)]
	push2 [sp+(2+2+8)]
	push2 [sp+(2+0+10)]
	call divide32
	pop2					; quotient
	pop2
	push2 0
	push2 0
	call cmp32
	pop2					; 0 value
	pop2
	pop2					; remainder
	pop2
	je .loop_done_is_not_prime

	; check N % (I+2) == 0
	push2 0
	push2 2
	call add32
	; at this point, sp+0 is (I+2)
	push2 [sp+(2+2+8)]
	push2 [sp+(2+0+10)]
	call divide32
	pop2		; quotient
	pop2
	push2 0
	push2 0
	call cmp32
	pop2		; 0 value
	pop2
	pop2		; remainder (originally I+2)
	pop2
	je .loop_done_is_not_prime
	; add I+6 and loop
	; I should still be on stack
	push2 0
	push2 6
	call add32
	pop2 [sp+(0+0+4)]
	pop2 [sp+(0+2+2)]
	jmp .loop
.iteration_loop_done:
	; get rid of I*I stack
	pop2
	pop2
	pop2
	pop2	
.loop_done_is_prime:
	; remove I variable from stack
	pop2
	pop2
.is_prime:
	mov a,1
	ret
.loop_done_is_not_prime:
	; remove I variable from stack
	pop2
	pop2
.is_not_prime:
	mov a,0
	ret

is_prime_suffix_cstr:
	.cstr " is prime"
not_prime_suffix_cstr:
	.cstr " is not prime"