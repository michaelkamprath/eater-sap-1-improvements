#require "putey-1-beta >= 0.4.dev"

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
    mov a, [hl+i]
    jeq .end, 0
    inc i
    jc .too_long
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
    jeq .end,0
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
    jeq .second_cstr, 0         ; see if char in A is 0
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
    jeq .end, 0
    inc mar
    inc hl
    jmp .loop2
.end:
    ret

; cstr_append
;   appends one string to the other
;
;   Arguments
;       sp+2 : address of destination buffer containing left string (2 bytes)
;       sp+4 : address of string to to appended (2 bytes)
;       sp+6 : size of destination buffer (1 byte)
; 
;   Returns
;       nothing
; 
cstr_append:
    push2 [sp+2]            ; place destination buffer on stack
    call cstr_len8          ; get length of buffer string
    pop2
    mov a,i                 ; copy buffer string size to I regsiter
    mov2 hl,[sp+2]          ; place destination buffer address in HL
    mov2 mar,[sp+4]         ; place string address to append in MAR
.loop:
    mov a,i
    jeq .end, [sp+6]        ; check to see of buffer is full
    mov a,[mar]             ; copy string character
    mov [hl+i],a            ; copy character to position in buffer
    jeq .end,0              ; if we copied null character, we are done
    inc mar                 ; next character in string
    inc i                   ; increment position in buffer
    jnz .loop               ; restart loop if I hasn't rolled over to 0
    mov [hl+255], 0         ; make last character in buffer equal to 0
.end:
    ret

; uint16_to_hex_cstr
;   converts the passed uint8 value to a hex formatted cstr. Does not prepend with 0x or $.
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
    mov2 hl, _hex_table_upper_nibble        ; set HL to address of upper nibble look up table
    mov a, [hl+[sp+2]]                      ; get the value at the index of the passed uint8
    mov2 hl, [sp+3]                         ; place buffer address into HL
    mov [hl+[sp+5]], a                      ; write first character to buffer
    mov2 hl, _hex_table_lower_nibble        ; set HL to address of lower nibble look up table
    mov a, [hl+[sp+2]]                      ; get the value at the index of the passed uint8
    mov2 hl, [sp+3]                         ; place buffer address into HL
    inc hl                                  ; increment HL to get second character position
    mov [hl+[sp+5]], a                      ; write second character to buffer
    inc hl
    mov [hl+[sp+5]], 0                      ; put a null value at the end
    ret

;
; String Lib Data
;

_hex_table_upper_nibble:
    .byte "0000000000000000"
    .byte "1111111111111111"
    .byte "2222222222222222"
    .byte "3333333333333333"
    .byte "4444444444444444"
    .byte "5555555555555555"
    .byte "6666666666666666"
    .byte "7777777777777777"
    .byte "8888888888888888"
    .byte "9999999999999999"
    .byte "AAAAAAAAAAAAAAAA"
    .byte "BBBBBBBBBBBBBBBB"
    .byte "CCCCCCCCCCCCCCCC"
    .byte "DDDDDDDDDDDDDDDD"
    .byte "EEEEEEEEEEEEEEEE"
    .byte "FFFFFFFFFFFFFFFF"

_hex_table_lower_nibble:
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"
    .byte "0123456789ABCDEF"