#require "putey-1-beta >= 0.4.0"
.memzone system_code

; cstr_len8
;   Calculates the length of a cstr not including the null terminator character, up to 255.
;
;   Arguments
;       sp+2 : the address to the string to evaluate (2 bytes)
;
;   Returns
;       register A: the length of the cstr (1 byte)

cstr_len8:
    mov2 hl, [sp+2]
    mov i, 0
.loop:
    cmp [hl+i],0
    je .end
    inc i
    jz .too_long
    jmp .loop
.too_long:
    mov i, 255
.end:
    mov a, i
    ret

; cstr_copy
;   copies cstr from source to destination. Can by any size, but source cstr must end with null (0)
;
;   Arguments
;       sp+2 : destination memory address (2 bytes)
;       sp+4 : source memory address (2 byte)
;
;   Returns
;       nothing
cstr_copy:
    mov2 hl,[sp+2]              ; copy destination address
    mov2 mar,[sp+4]             ; copy source address
.loop:
    mov a,[mar]
    mov [hl],a
    cmp a,0
    je .end                     ; if at null character, end copy
    inc mar
    inc hl
    jmp .loop
.end:
    ret

; cstr_concat
;   Concatenates two cstr strings and places them into buffer
; 
;   Arguments
;       sp+2 : Address to the first (left most) cstr (2 bytes). Can be results buffer.
;       sp+4 : Address to the second (right most) cstr (2 bytes)
;       sp+6 : Address to the buffer to place the results in. (2 bytes)
;       sp+8 : Buffer size (1 byte)
; 
;   Returns
;       Nothing
cstr_concat:
    mov2 hl,[sp+6]              ; place buffer address into HL
    mov i,[sp+8]                ; place buffer size into I
    mov2 mar,[sp+2]             ; place first string address into MAR
.loop1:
    mov a,[mar]
    mov [hl],a
    dec i
    jz .end                     ; we are out of buffer. end it.
    cmp a,0
    je .second_cstr             ; see if char in A is 0
    inc mar
    inc hl
    jmp .loop1
.second_cstr:
    inc i                       ; account for null value to be overwritten
    mov2 mar,[sp+4]             ; place second string address into MAR
.loop2:
    mov a,[mar]
    mov [hl],a
    dec i
    jz .end                     ; we are out of buffer. end it.
    cmp a,0
    je .end
    inc mar
    inc hl
    jmp .loop2
.end:
    ret

; cstr_append
;   appends one string to the other
;
;   Arguments
;       sp+2 : address of string to to appended (2 bytes)
;       sp+4 : address of destination buffer containing left string (2 bytes)
;       sp+6 : size of destination buffer (1 byte)
; 
;   Returns
;       nothing
; 
cstr_append:
    push2 [sp+4]            ; place destination buffer on stack
    call cstr_len8          ; get length of buffer string
    pop2
    mov a,i                 ; copy buffer string size to I regsiter
    mov2 hl,[sp+4]          ; place destination buffer address in HL
    mov2 mar,[sp+2]         ; place string address to append in MAR
.loop:
    cmp i,[sp+6]
    je .end                 ; check to see of buffer is full
    mov a,[mar]             ; copy string character
    mov [hl+i],a            ; copy character to position in buffer
    cmp a,0
    je .end                 ; if we copied null character, we are done
    inc mar                 ; next character in string
    inc i                   ; increment position in buffer
    jnz .loop               ; restart loop if I hasn't rolled over to 0
    mov [hl+255], 0         ; make last character in buffer equal to 0
.end:
    ret


; cstr_reverse
;   Reverses the ordering of all characters in the cstr. 
; 
;   Arguments
;       sp+2 : buffer address to cstr. Should be mutable, and less than 255 characters.
; 
;   Returns
;       sp+2 : The contents of the buffer are reverse.
; 
;   Registers Used
;       i
; 
cstr_reverse:
    mov2 hl,[sp+2]
    mov i,0
.push_loop:
    cmp [hl+i],0                ; if character is 0. we are done with pusshing    
    je .pop_loop
    push [hl+i]
    inc i
    jmp .push_loop
.pop_loop:
    cmp i,0                     ; if I is 0, we are done popping
    je .end
    pop [hl]
    inc hl
    dec i
    jmp .pop_loop
.end:
    ret

; uint32_to_hex_cstr
;   converts the passed uint32 value to a hex formatted cstr. Does not prepend with 0x or $.
;
;   Arguments
;       sp+2 : the uint32 value (4 byte)
;       sp+6 : buffer address (2 bytes)
;       sp+8 : buffer index to write at (must have 8 bytes at this address) (1 byte)
;
;   Returns
;       nothing, but does write to passed buffer
uint32_to_hex_cstr:
    push [sp+8]             ; push buffer index
    push2 [sp+(6+1)]        ; push buffer address (1 deeper)
    push2 [sp+((2+2)+3)]    ; push upper word of value (3 deeper)
    call uint16_to_hex_cstr ; convert upper word to cstr
    pop2                    ; pop value upper word
    pop2 hl                 ; pop buffer address into HL
    inc hl                  ; increase HL by 4
    inc hl
    inc hl
    inc hl
    push2 hl                ; place modified buffer address on stack
    push2 [sp+(2+3)]        ; push lower word of value (3 deeper)
    call uint16_to_hex_cstr ; convert lower word to cstr
    pop2                    ; restore stack
    pop2
    pop
    ret

; uint16_to_hex_cstr
;   converts the passed uint16 value to a hex formatted cstr. Does not prepend with 0x or $.
;
;   Arguments
;       sp+2 : the uint16 value (2 byte)
;       sp+4 : buffer address (2 bytes)
;       sp+6 : buffer index to write at (must have 4 bytes at this address) (1 byte)
;
;   Returns
;       nothing, but does write to passed buffer
uint16_to_hex_cstr:
    push [sp+6]             ; push buffer index
    push2 [sp+(4+1)]        ; push buffer address (1 deeper)
    push [sp+((2+1)+3)]     ; push upper byte of value (3 deeper)
    call uint8_to_hex_cstr  ; convert lower byte to cstr
    pop                     ; pop value upper byte
    pop2 hl                 ; pop buffer address into HL
    inc hl                  ; increase HL by 2
    inc hl
    push2 hl                ; place modified buffer address on stack
    push [sp+(2+3)]         ; push lower byte of value (3 deeper)
    call uint8_to_hex_cstr  ; convert lower byte to cstr
    pop                     ; restore stack
    pop2
    pop
    ret

; uint8_to_hex_cstr
;   converts the passed uint8 value to a hex formatted cstr. Does not prepend with 0x or $.
;
;   Arguments
;       sp+2 : the uint8 value (1 byte)
;       sp+3 : buffer address (2 bytes)
;       sp+5 : buffer index to write at (must have 2 bytes at this address) (1 byte)
;
;   Returns
;       nothing, but does write to passed buffer
uint8_to_hex_cstr:
    mov2 hl, _numrical_digits_table         ; set HL to address of look up table
    mov a, [sp+2]                           ; place uint8 value in A
    lsr4                                    ; move upper nibble to lower nibble
    mov a, [hl+a]                           ; copy character value into A
    mov2 hl, [sp+3]                         ; place buffer address into HL
    mov [hl+[sp+5]], a                      ; write first character to buffer
    mov2 hl, _numrical_digits_table         ; set HL to address of look up table
    mov a, [sp+2]                           ; place uint8 value in A
    and %00001111                           ; mask out lower nibble
    mov a, [hl+a]                           ; copy second character value into A
    mov2 hl, [sp+3]                         ; place buffer address into HL
    inc hl                                  ; increment HL to get second character position
    mov [hl+[sp+5]], a                      ; write second character to buffer
    inc hl
    mov [hl+[sp+5]], 0                      ; put a null value at the end
    ret


; uint16_to_binary_cstr
;   converts the passed uint16 value to a binary formatted cstr. Does not prepend with b.
;
;   Arguments
;       sp+2 : the uint16 value (2 byte)
;       sp+4 : buffer address (2 bytes)
;       sp+6 : buffer index to write at (must have 8 bytes at this address) (1 byte)
;
;   Returns
;       nothing, but does write to passed buffer
uint16_to_binary_cstr:
    push [sp+(6+0)]             ; buffer index
    push2 [sp+(4+1)]            ; push buffer on stack
    push [sp+(2+1+3)]           ; place value high byte on stack
    call uint8_to_binary_cstr
    mov [sp],[sp+(2+0+4)]       ; copy value low byte to stack
    call uint8_to_binary_cstr   ; buffer address updated in prior call
    pop
    pop2
    pop
    ret

; uint8_to_binary_cstr
;   converts the passed uint8 value to a binary formatted cstr. Does not prepend with b.
;
;   Arguments
;       sp+2 : the uint8 value (1 byte)
;       sp+3 : buffer address (2 bytes)
;       sp+5 : buffer index to write at (must have 8 bytes at this address) (1 byte)
;
;   Returns
;       writes binary string to buffer
;       resets sp+3 to the buffer address (not including offset) that the null char was written to
; 
uint8_to_binary_cstr:
    mov2 hl,[sp+3]
    tstb [sp+2],7
    call _fetch_bit_char
    mov [hl+[sp+5]],a
    inc hl
    tstb [sp+2],6
    call _fetch_bit_char
    mov [hl+[sp+5]],a
    inc hl
    tstb [sp+2],5
    call _fetch_bit_char
    mov [hl+[sp+5]],a
    inc hl
    tstb [sp+2],4
    call _fetch_bit_char
    mov [hl+[sp+5]],a
    inc hl
    tstb [sp+2],3
    call _fetch_bit_char
    mov [hl+[sp+5]],a
    inc hl
    tstb [sp+2],2
    call _fetch_bit_char
    mov [hl+[sp+5]],a
    inc hl
    tstb [sp+2],1
    call _fetch_bit_char
    mov [hl+[sp+5]],a
    inc hl
    tstb [sp+2],0
    call _fetch_bit_char
    mov [hl+[sp+5]],a
    inc hl
    mov [hl+[sp+5]],0
    mov2 [sp+3],hl
    ret
; Set A to character 1 or 0 based on ZF flag
_fetch_bit_char:
    jz .zerochar
    mov a,0x31
    ret
.zerochar:
    mov a,0x30
    ret


; uint16_to_decimal_cstr
; 
;   converts the passed uint16 value to a decimal formatted cstr.
;
;   Arguments
;       sp+2 : the uint16 value (2 byte)
;       sp+4 : buffer address (2 bytes)
;       sp+6 : buffer size (1 byte)
;
;   Returns
;       writes binary string to buffer. Will reset all other values in buffer to null (0)
;       updates sp+6 top the character length of the decimal string
;       resets sp+4 to the buffer address that the null char was written to
; 
uint16_to_decimal_cstr:
    ; set buffer to to all 0s
    push [sp+6]
    push 0
    push2 [sp+(4+2)]
    call memset8
    pop2
    pop
    pop
    ; set up working stack
    push 0                  ; init bit carry flag
    push 0                  ; init high byte
    push2 [sp+(2+2)]        ; init low word
    ; working stack is:
    ;    sp+0 : low word (2 bytes)
    ;    sp+2 : high byte (1 bytes)
    ;    sp+3 : carry bit flag for rotations, inited to 0 (1 byte)
    mov j,0                 ; J is digit counter
.outer_loop:
    ; first check to see if we are done
    push2 [sp+0]            ; right side
    push2 10                ; left side
    call cmp16              ; see if low byte is < 10
    pop2
    pop2
    jo .last_digit          ; it is. jump to last digit

    mov i,16                ; I is divide loop counter
.div_loop:
    call lsl24              ; shift working stack left 1 bit
    mov a,[sp+3]            ; move carry bit flag into A
    or [sp+0]               ; OR the carry bit flag with the low working byte
    mov [sp+0],a            ; place OR'ed low byte back
    mov [sp+3],0            ; reset carry bit

    cmp 10,[sp+2]           ; check to see if upper word by is >= 10. Assume high word won't be >255.
    jo .div_loop_continue   ; if 10 is subtractable from high byte, proceed with subtraction, otherwise continue loop
.div_loop_subtraction:
    mov a,[sp+2]
    sub 10
    mov [sp+2],a
    mov [sp+3],1            ; set carry bit flag
.div_loop_continue:
    dec i                   ; check to see if we are done with this digit
    jnz .div_loop
.div_loop_remainder:
    ; we are done with this digit. High byte is the /10 remainder, or the current digit
    cmp [sp+2],9
    jo .error_remainder_too_large
    mov2 hl,_numrical_digits_table
    mov a,[hl+[sp+2]]       ; get character of remainder
    mov2 hl,[sp+(4+4)]      ; set HL to character buffer
    mov [hl+j],a            ; set next buffer position to character
    ; do one more rotation before next loop
    call lsl24
    mov a,[sp+3]            ; move carry bit flag into A
    or [sp+0]               ; OR the carry bit flag with the low working byte
    mov [sp+0],a            ; place OR'ed low byte back
    mov [sp+2],0            ; clear remainder
    mov [sp+3],0            ; reset carry flag

    inc j
    cmp j,[sp+(6+4)]        ; check to see if we have run out of buffer
    je .err_buffer_size
    jmp .outer_loop         ; do next character
.last_digit:
    mov2 hl,_numrical_digits_table
    mov a,[hl+[sp+0]]       ; get character of remainder
    mov2 hl,[sp+(4+4)]      ; set HL to character buffer
    mov [hl+j],a            ; set next buffer position to character

    ; clear working stack
    pop2
    pop
    pop

    ; set the null terminating character
    inc j
    jz .err_buffer_size
    mov [hl+j],0

    ; finally need to reverse digits
    push2 hl
    call cstr_reverse
    pop2 hl

.end:
    mov [sp+6],j            ; move character count to return size
    mov2 [sp+4],hl          ; set return buffer address to wher ethe null is
    ret
.err_buffer_size:
    ; print error message to LCD
    push2 _error_buffer_small
    call lcd_print_line_cstr
    hlt
.error_remainder_too_large:
    push2 _error_remainder_too_large_str
    call lcd_print_line_cstr
    hlt



; uint32_to_decimal_cstr
; 
;   converts the passed uint64 value to a decimal formatted cstr.
;
;   Arguments
;       sp+2 : the uint64 value (4 byte)
;       sp+6 : buffer address (2 bytes)
;       sp+8 : buffer size (1 byte)
;
;   Returns
;       writes binary string to buffer. Will reset all other values in buffer to null (0)
;       updates sp+8 top the character length of the decimal string
;       resets sp+6 to the buffer address that the null char was written to
; 
_uin632_to_decimal_cmp_10_to_ws:
    cmp 0,[sp+5]
    jne .end
    cmp 0,[sp+4]
    jne .end
    cmp 0,[sp+3]
    jne .end
    cmp 10,[sp+2]
.end:
    ret

uint32_to_decimal_cstr:
    cmp 0,[sp+5]
    jne .start
    cmp 0,[sp+4]
    jne .start
    ; if we are here, this value would more quickly be
    ; converted with uint16_to_decimal_cstr
    push [sp+(8+0)]
    push2 [sp+(6+1)]
    push2 [sp+(2+3)]
    call uint16_to_decimal_cstr
    pop2
    pop2 [sp+(6+3)]
    pop [sp+(8+1)]
    ret
.start:
    ; set buffer to to all 0s
    push [sp+8]
    push 0
    push2 [sp+(6+2)]
    call memset8
    pop2
    pop
    pop
    ; set up working stack
    push 0                  ; init bit carry flag
    push 0                  ; init high byte
    push2 [sp+(2+2+2)]        ; valbytes 2 & 3
    push2 [sp+(2+0+4)]        ; valbytes 0 & 1
    ; working stack is:
    ;    sp+0 : value (4 bytes)
    ;    sp+4 : high byte (1 bytes)
    ;    sp+5 : carry bit flag for rotations, inited to 0 (1 byte)
    mov j,0                 ; J is digit counter
.outer_loop:
    ; first check to see if we are done
    call _uin632_to_decimal_cmp_10_to_ws
    jo .last_digit          ; it is. jump to last digit
.outer_loop_continue:
    mov i,32                ; I is divide loop counter
.div_loop:
    call lsl40              ; shift working stack left 1 bit
    mov a,[sp+5]            ; move carry bit flag into A
    or [sp+0]               ; OR the carry bit flag with the low working byte
    mov [sp+0],a            ; place OR'ed low byte back
    mov [sp+5],0            ; reset carry bit

    cmp 10,[sp+4]           ; check to see if upper word by is >= 10. Assume high word won't be >255.
    jo .div_loop_continue   ; if 10 is subtractable from high byte, proceed with subtraction, otherwise continue loop
.div_loop_subtraction:
    mov a,[sp+4]
    sub 10
    mov [sp+4],a
    mov [sp+5],1            ; set carry bit flag
.div_loop_continue:
    dec i                   ; check to see if we are done with this digit
    jnz .div_loop
.div_loop_remainder:
    ; we are done with this digit. High byte is the /10 remainder, or the current digit
    cmp [sp+4],9
    jo .error_remainder_too_large
    mov2 hl,_numrical_digits_table
    mov a,[hl+[sp+4]]       ; get character of remainder
    mov2 hl,[sp+(6+6)]      ; set HL to character buffer
    mov [hl+j],a            ; set next buffer position to character
    ; do one more rotation before next loop
    call lsl40
    mov a,[sp+5]            ; move carry bit flag into A
    or [sp+0]               ; OR the carry bit flag with the low working byte
    mov [sp+0],a            ; place OR'ed low byte back
    mov [sp+4],0            ; clear remainder
    mov [sp+5],0            ; reset carry flag

    inc j
    cmp j,[sp+(8+6)]        ; check to see if we have run out of buffer
    je .err_buffer_size
    jmp .outer_loop         ; do next character
.last_digit:
    mov2 hl,_numrical_digits_table
    mov a,[hl+[sp+0]]       ; get character of remainder
    mov2 hl,[sp+(6+6)]      ; set HL to character buffer
    mov [hl+j],a            ; set next buffer position to character

    ; clear working stack
    pop2
    pop2
    pop
    pop

    ; set the null terminating character
    inc j
    jz .err_buffer_size
    mov [hl+j],0

    ; finally need to reverse digits
    push2 hl
    call cstr_reverse
    pop2 hl

.end:
    mov [sp+8],j            ; move character count to return size
    mov2 [sp+6],hl          ; set return buffer address to wher ethe null is
    ret
.err_buffer_size:
    ; print error message to LCD
    push2 _error_buffer_small
    call lcd_print_line_cstr
    hlt
.error_remainder_too_large:
    push2 _error_remainder_too_large_str
    call lcd_print_line_cstr
    hlt


; uint64_to_decimal_cstr
; 
;   converts the passed uint64 value to a decimal formatted cstr.
;
;   Arguments
;       sp+2  : the uint64 value (8 byte)
;       sp+10 : buffer address (2 bytes)
;       sp+12 : buffer size (1 byte)
;
;   Returns
;       writes binary string to buffer. Will reset all other values in buffer to null (0)
;       updates sp+12 top the character length of the decimal string
;       resets sp+10 to the buffer address that the null char was written to
; 
_uin64_to_decimal_cmp_10_to_ws:
    cmp 0,[sp+9]
    jne .end
    cmp 0,[sp+8]
    jne .end
    cmp 0,[sp+7]
    jne .end
    cmp 0,[sp+6]
    jne .end
    cmp 0,[sp+5]
    jne .end
    cmp 0,[sp+4]
    jne .end
    cmp 0,[sp+3]
    jne .end
    cmp 10,[sp+2]
.end:
    ret

uint64_to_decimal_cstr:
    cmp 0,[sp+9]
    jne .start
    cmp 0,[sp+8]
    jne .start
    cmp 0,[sp+7]
    jne .start
    cmp 0,[sp+6]
    jne .start
    ; if we are here, this value would more quickly be
    ; converted with uint32_to_decimal_cstr
    push [sp+(12+0)]
    push2 [sp+(10+1)]
    push2 [sp+(2+2+3)]
    push2 [sp+(2+0+5)]
    call uint32_to_decimal_cstr
    pop2
    pop2
    pop2 [sp+(10+3)]
    pop [sp+(12+1)]
    ret
.start:
    ; set buffer to to all 0s
    push [sp+12]
    push 0
    push2 [sp+(10+2)]
    call memset8
    pop2
    pop
    pop
    ; set up working stack
    push 0                  ; init bit carry flag
    push 0                  ; init high byte
    push2 [sp+(2+6+2)]        ; valbytes 6 & 7
    push2 [sp+(2+4+4)]        ; valbytes 4 & 5
    push2 [sp+(2+2+6)]        ; valbytes 2 & 3
    push2 [sp+(2+0+8)]        ; valbytes 0 & 1
    ; working stack is:
    ;    sp+0 : value (8 bytes)
    ;    sp+8 : high byte (1 bytes)
    ;    sp+9 : carry bit flag for rotations, inited to 0 (1 byte)
    mov j,0                 ; J is digit counter
.outer_loop:
    ; first check to see if we are done
    call _uin64_to_decimal_cmp_10_to_ws
    jo .last_digit          ; it is. jump to last digit
.outer_loop_continue:
    mov i,64                ; I is divide loop counter
.div_loop:
    call lsl72              ; shift working stack left 1 bit
    mov a,[sp+9]            ; move carry bit flag into A
    or [sp+0]               ; OR the carry bit flag with the low working byte
    mov [sp+0],a            ; place OR'ed low byte back
    mov [sp+9],0            ; reset carry bit

    cmp 10,[sp+8]           ; check to see if upper word by is >= 10. Assume high word won't be >255.
    jo .div_loop_continue   ; if 10 is subtractable from high byte, proceed with subtraction, otherwise continue loop
.div_loop_subtraction:
    mov a,[sp+8]
    sub 10
    mov [sp+8],a
    mov [sp+9],1            ; set carry bit flag
.div_loop_continue:
    dec i                   ; check to see if we are done with this digit
    jnz .div_loop
.div_loop_remainder:
    ; we are done with this digit. High byte is the /10 remainder, or the current digit
    cmp [sp+8],9
    jo .error_remainder_too_large
    mov2 hl,_numrical_digits_table
    mov a,[hl+[sp+8]]       ; get character of remainder
    mov2 hl,[sp+(10+10)]    ; set HL to character buffer
    mov [hl+j],a            ; set next buffer position to character
    ; do one more rotation before next loop
    call lsl72
    mov a,[sp+9]            ; move carry bit flag into A
    or [sp+0]               ; OR the carry bit flag with the low working byte
    mov [sp+0],a            ; place OR'ed low byte back
    mov [sp+8],0            ; clear remainder
    mov [sp+9],0            ; reset carry flag

    inc j
    cmp j,[sp+(12+10)]      ; check to see if we have run out of buffer
    je .err_buffer_size
    jmp .outer_loop         ; do next character
.last_digit:
    mov2 hl,_numrical_digits_table
    mov a,[hl+[sp+0]]       ; get character of remainder
    mov2 hl,[sp+(10+10)]    ; set HL to character buffer
    mov [hl+j],a            ; set next buffer position to character

    ; clear working stack
    pop2
    pop2
    pop2
    pop2
    pop
    pop

    ; set the null terminating character
    inc j
    jz .err_buffer_size
    mov [hl+j],0

    ; finally need to reverse digits
    push2 hl
    call cstr_reverse
    pop2 hl

.end:
    mov [sp+12],j           ; move character count to return size
    mov2 [sp+10],hl          ; set return buffer address to wher ethe null is
    ret
.err_buffer_size:
    ; print error message to LCD
    push2 _error_buffer_small
    call lcd_print_line_cstr
    hlt
.error_remainder_too_large:
    push2 _error_remainder_too_large_str
    call lcd_print_line_cstr
    hlt

;
; String Lib Data
;
_numrical_digits_table:
    .byte "0123456789ABCDEF"

_error_buffer_small:
    .cstr "ERROR: buffer small"

_error_remainder_too_large_str:
    .cstr "ERROR: remainder > A"