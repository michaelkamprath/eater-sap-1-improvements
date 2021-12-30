
; cstr_len8
;   Calculates the length of a cstr, up to 255
;
;   Arguments
;       sp+2 : the address to the string to evaluate (2 bytes)
;
;   Returns
;       sp+2 : the length of the cstr (overwrites address) (1 byte)

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
    mov [sp+2], i
    mov [sp+3], 0
    ret

; cstr_copy
;   copies cstr from source to destination. Can by any size, but source must end with null (0)
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
    mov2 hl, hex_table_upper_nibble         ; set HL to address of upper nibble look up table
    mov a, [hl+[sp+2]]                      ; get the value at the index of the passed uint8
    mov2 hl, [sp+3]                         ; place buffer address into HL
    mov [hl+[sp+5]], a                      ; write first character to buffer
    mov2 hl, hex_table_lower_nibble         ; set HL to address of lower nibble look up table
    mov a, [hl+[sp+2]]                      ; get the value at the index of the passed uint8
    mov2 hl, [sp+3]                         ; place buffer address into HL
    inc hl                                  ; increment HL to get second character position
    mov [hl+[sp+5]], a                      ; write second character to buffer
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


;
; String Lib Data
;

hex_table_upper_nibble:
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

hex_table_lower_nibble:
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