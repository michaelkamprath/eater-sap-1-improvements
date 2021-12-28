; LCD Display Library
;    for the PUTEY-1 BETA TTL CPU and a LCD 20x4 display,
;
; Dependencies:
;   general system utilities
;

LCD_DATA_REG = $7811                ; address for the LCD Module data register
LCD_INSTRUCTION_REG = $7810         ; address for the LCD Module instruction register

_CMD_CLEAR_DISPLAY = %00000001
_CMD_CURSOR_HOME = %00000010

_CMD_ENTRY_MODE = %00000100
_OPT_CURSOR_RIGHT = %00000010

_CMD_FNCT_SET_INIT = %00110000
_CMD_FNCT_SET_8BIT_2LINE = %00111000

_CMD_DISPLAY_CNTL = %00001000
_OPT_DISPLAY_ON = %00000100
_OPT_CURSOR_ON = %00000010
_OPT_CURSOR_BLINKING = %0000001
_OPT_DISPLAY_CNTL_ALL = %0000111

_CMD_DDRAM_ADDR = %10000000

; lcd_init
;   Initializes the LCD device.
;
;   Arguments
;       none
;
;   Returns
;       none
;
;   Registers used
;       a
;       i
;
_LCD_INIT_WAIT_COUNT = 4

lcd_init:
    mov i, _LCD_INIT_WAIT_COUNT
.wait_loop:
    dec i
    jz .start_lcd
    jmp .wait_loop
.start_lcd:
    ; first try
    mov [LCD_INSTRUCTION_REG],_CMD_FNCT_SET_8BIT_2LINE
    push 1
    call delay8
    pop
    ; second try
    mov [LCD_INSTRUCTION_REG],_CMD_FNCT_SET_8BIT_2LINE
    push 1
    call delay8
    pop
    ; third try
    mov [LCD_INSTRUCTION_REG],_CMD_FNCT_SET_8BIT_2LINE
    ; configure for 8 bit and 2 lines
    mov [LCD_INSTRUCTION_REG],_CMD_FNCT_SET_8BIT_2LINE
    ; turn off display with no cursour yet
    call lcd_off
    ; clear display
    call lcd_clear
    ; set cursor to move right
    mov [LCD_INSTRUCTION_REG],(_CMD_ENTRY_MODE|_OPT_CURSOR_RIGHT)
    ; set cursour at home
    call lcd_cursor_home
    ; turn on display
    call lcd_on
    ret

lcd_off:
    mov [LCD_INSTRUCTION_REG],_CMD_DISPLAY_CNTL
    ret

lcd_on:
    mov [LCD_INSTRUCTION_REG],(_CMD_DISPLAY_CNTL|_OPT_DISPLAY_ON)
    ret

lcd_on_cursor_blink:
    mov [LCD_INSTRUCTION_REG],(_CMD_DISPLAY_CNTL|_OPT_DISPLAY_CNTL_ALL)
    ret

lcd_clear:
    mov [LCD_INSTRUCTION_REG],_CMD_CLEAR_DISPLAY
    ret

lcd_cursor_home:
    mov [LCD_INSTRUCTION_REG],_CMD_CURSOR_HOME
    ret

; lcd_print_cstr
;       prints a string from the current cursor position. Assumes string is null-terminated.
;
;   arguments:
;       sp+2    - the address of the cstr to display (2 bytes)
;       sp+4    - row number (1-4)
;   returns:
;       nothing
;
;   registers used:
;       a
;       hl
;
lcd_print_cstr:
    mov2 hl, [sp+2]                     ; put the string address into HL for later dereferencing
    mov a, [sp+4]
    jeq .row1, 1
    jeq .row2, 2
    jeq .row3, 3
    jeq .row4, 4
    ret
.row1:
    mov [LCD_INSTRUCTION_REG], _CMD_DDRAM_ADDR
    jmp .loop
.row2:
    mov [LCD_INSTRUCTION_REG], (_CMD_DDRAM_ADDR|$40)
    jmp .loop
.row3:
    mov [LCD_INSTRUCTION_REG], (_CMD_DDRAM_ADDR|$14)
    jmp .loop
.row4:
    mov [LCD_INSTRUCTION_REG], (_CMD_DDRAM_ADDR|$54)        ; don't need a jmp to .loop here. Just fall through.
.loop:
    mov a,[hl]
    jeq .end, 0
    mov [LCD_DATA_REG], a
    inc hl
    jmp .loop
.end:
    ret