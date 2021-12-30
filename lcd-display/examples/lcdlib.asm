; LCD Display Library
;    for the PUTEY-1 BETA TTL CPU and a LCD 20x4 display,
;
; Dependencies:
;   general system utilities
;

LCD_DATA_REG = $7811                ; address for the LCD Module data register
LCD_INSTRUCTION_REG = $7810         ; address for the LCD Module instruction register

_COLUMN_WIDTH = 20
_ROW_COUNT = 4

_CMD_CLEAR_DISPLAY = %00000001
_CMD_CURSOR_HOME = %00000010

_CMD_ENTRY_MODE = %00000100
_OPT_CURSOR_RIGHT = %00000010
_OPT_CURSOR_LEFT = %00000001

_CMD_FNCT_SET_INIT = %00110000
_CMD_FNCT_SET_8BIT_2LINE = %00111000

_CMD_DISPLAY_CNTL = %00001000
_OPT_DISPLAY_ON = %00000100
_OPT_CURSOR_ON = %00000010
_OPT_CURSOR_BLINKING = %0000001
_OPT_DISPLAY_CNTL_ALL = %0000111

_CMD_DDRAM_ADDR = %10000000


.org $F200
;
; LCD Module Library RAM variables
;
_lcd_screen_buffer:
    .zero 80

_lcd_row0_ptr:
    .2byte 0
_lcd_row1_ptr:
    .2byte 0
_lcd_row2_ptr:
    .2byte 0
_lcd_row3_ptr:
    .2byte 0


.org $4000
;
; LCD Module Library Code
;

; lcd_init
;   Initializes the LCD device.
;
;   Arguments
;       none
;
;   Returns
;       none
;
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
    ; init the buffers
    call _lcd_init_buffers
    ret

; _lcd_init_buffers
;       Sets up library buffers
_lcd_init_buffers:
    ; initialize  screen buffer
    push 80
    push $20
    push2 _lcd_screen_buffer
    call memset8
    pop2
    pop
    pop
    ; initialize line pointers
    mov2 [_lcd_row0_ptr],_lcd_screen_buffer
    mov2 [_lcd_row1_ptr],(_lcd_screen_buffer+_COLUMN_WIDTH)
    mov2 [_lcd_row2_ptr],(_lcd_screen_buffer+(_COLUMN_WIDTH*2))
    mov2 [_lcd_row3_ptr],(_lcd_screen_buffer+(_COLUMN_WIDTH*3))
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

; lcd_write_row_cstr
;       Writes a string to a particular row on the display, truncating the string if it exceed the row width,
;       and filling the rest fo the row with space characters if the string is shorter than the row width.
;       Assumes string is null-terminated.
;
;   arguments:
;       sp+2    - the address of the cstr to display (2 bytes)
;       sp+4    - row number (0-3)
;   returns:
;       nothing
;
;
lcd_write_row_cstr:
    mov a,[sp+4]                         ; put row number in a
    jeq .row0, 0
    jeq .row1, 1
    jeq .row2, 2
    jeq .row3, 3
    hlt                                  ; ERROR - invalid row
.row0:
    mov2 hl, [_lcd_row0_ptr]
    jmp .copy_to_row
.row1:
    mov2 hl, [_lcd_row1_ptr]
    jmp .copy_to_row
.row2:
    mov2 hl, [_lcd_row2_ptr]
    jmp .copy_to_row
.row3:
    mov2 hl, [_lcd_row3_ptr]
.copy_to_row:
    mov i, _COLUMN_WIDTH
    mov2 mar, [sp+2]                     ; put the string address into mar for later dereferencing
.copy_loop:
    mov a,[mar]
    jeq .copy_fill, 0
    mov [hl], a
    dec i
    jz .lcd_write
    inc mar
    inc hl
    jmp .copy_loop
.copy_fill:
    mov [hl], $20                         ; write space character
    dec i
    jz .lcd_write
    jmp .copy_fill
.lcd_write:
    push [sp+4]
    call lcd_send_buffer_row
    pop
.end:
    ret

; lcd_send_buffer_row
;       Sends specific row in buffer to LCD device
;
;   arguments:
;       sp+2    - row number (0-3)
;

lcd_send_buffer_row:
    mov a,[sp+2]                         ; put row number on stack
    jeq .row0, 0
    jeq .row1, 1
    jeq .row2, 2
    jeq .row3, 3
    hlt                                  ; ERROR invalid row num
.row0:
    mov2 hl, [_lcd_row0_ptr]
    jmp .send_row
.row1:
    mov2 hl, [_lcd_row1_ptr]
    jmp .send_row
.row2:
    mov2 hl, [_lcd_row2_ptr]
    jmp .send_row
.row3:
    mov2 hl, [_lcd_row3_ptr]
.send_row:
    push [sp+2]
    call lcd_set_cursor_at_row_start
    pop
    mov i, _COLUMN_WIDTH
.loop:
    mov [LCD_DATA_REG], [hl]
    dec i
    jz .end
    inc hl
    jmp .loop
.end:
    ret


; lcd_set_cursor_at_row_start
;       Sets the LCD DDRAM address to the start of the passed row
;
;   Arguments
;       sp+2    - desired row, values 0, 1, 2, or 3. Nothing hapens if invalid row passed.
;
;   Returns
;       nothing
;
;
lcd_set_cursor_at_row_start:
    mov a, [sp+2]
    jeq .row0, 0
    jeq .row1, 1
    jeq .row2, 2
    jeq .row3, 3
    hlt
.row0:
    mov [LCD_INSTRUCTION_REG], _CMD_DDRAM_ADDR
    ret
.row1:
    mov [LCD_INSTRUCTION_REG], (_CMD_DDRAM_ADDR|$40)
    ret
.row2:
    mov [LCD_INSTRUCTION_REG], (_CMD_DDRAM_ADDR|$14)
    ret
.row3:
    mov [LCD_INSTRUCTION_REG], (_CMD_DDRAM_ADDR|$54)
    ret


; lcd_set_cursor_at_row_end
;       Sets the LCD DDRAM address to the end (right side) of the passed row
;
;   Arguments
;       sp+2    - desired row, values 0, 1, 2, or 3. Nothing hapens if invalid row passed.
;
;   Returns
;       nothing
;
;
lcd_set_cursor_at_row_end:
    mov a, [sp+2]
    jeq .row0, 0
    jeq .row1, 1
    jeq .row2, 2
    jeq .row3, 3
    hlt
.row0:
    mov [LCD_INSTRUCTION_REG], (_CMD_DDRAM_ADDR|(_COLUMN_WIDTH-1))
    ret
.row1:
    mov [LCD_INSTRUCTION_REG], (_CMD_DDRAM_ADDR|($40+_COLUMN_WIDTH-1))
    ret
.row2:
    mov [LCD_INSTRUCTION_REG], (_CMD_DDRAM_ADDR|($14+_COLUMN_WIDTH-1))
    ret
.row3:
    mov [LCD_INSTRUCTION_REG], (_CMD_DDRAM_ADDR|($54+_COLUMN_WIDTH-1))
    ret


; lcd_scroll_up
;       Scrolls the LCD screen up one row, leaving row 4 blank
;
;   Arguments
;       sp+1 : boolean (1 or 0) indicating whether to erase last row
;
;   Returns
;       nothing
;
;
lcd_scroll_up:
    ; Rotate the row pointers - must use two mov's rather than 1 mov2 because
    ; ISA does not support mov2 between indirect memory addresses
    push2 [_lcd_row0_ptr]
    mov [_lcd_row0_ptr],[_lcd_row1_ptr]
    mov [_lcd_row0_ptr+1],[_lcd_row1_ptr+1]
    mov [_lcd_row1_ptr],[_lcd_row2_ptr]
    mov [_lcd_row1_ptr+1],[_lcd_row2_ptr+1]
    mov [_lcd_row2_ptr],[_lcd_row3_ptr]
    mov [_lcd_row2_ptr+1],[_lcd_row3_ptr+1]
    pop2 [_lcd_row3_ptr]
    ; set the bottom row to all zpaces
    push _COLUMN_WIDTH
    push $20
    push2 [_lcd_row3_ptr]
    call memset8
    pop2
    pop
    pop
    ; clear the screen
    call lcd_clear
    ; now send each row in turn to the LCD module
    push 0
    call lcd_send_buffer_row
    mov [sp],1
    call lcd_send_buffer_row
    mov [sp],2
    call lcd_send_buffer_row
    ; only send bottom row if requested
    mov a,[sp+3]
    jeq .end,0
    mov [sp],3
    call lcd_send_buffer_row
.end:
    pop
    ret


; lcd_print_cstr
;       Scrolls the rows of the LCD display updwards and then prints the cstr to the
;       bottom row, truncating it if it is too wide for the row.
;
;   Arguments
;       sp+2    - Address of cstr to print (2 bytes)
;
;   Returns
;       nothing
;
;
lcd_print_cstr:
    push 0
    call lcd_scroll_up
    pop
    push (_ROW_COUNT-1)
    push2 [sp+3]
    call lcd_write_row_cstr
    pop2
    pop
    ret