; LCD Display Library
;    for the PUTEY-1 BETA TTL CPU and a LCD 20x4 display,
;
; Dependencies:
;   general system utilities
;
#require "putey-1-beta >= 0.4.dev"

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
_CMD_CGRAM_ADDR = %01000000

.org $F200
;
; LCD Module Library RAM variables
;

_LCD_SCREEN_BUFFER_SIZE = 81

_lcd_screen_buffer:
    .zero _LCD_SCREEN_BUFFER_SIZE

_lcd_row0_ptr:
    .2byte 0
_lcd_row1_ptr:
    .2byte 0
_lcd_row2_ptr:
    .2byte 0
_lcd_row3_ptr:
    .2byte 0
_temp_row_buffer:
    .zero _COLUMN_WIDTH+1

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
    ; wait just a little for the LCD to boot
    push _LCD_INIT_WAIT_COUNT
    call delay8
    pop
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
    call lcd_wait_busy
    mov [LCD_INSTRUCTION_REG],_CMD_FNCT_SET_8BIT_2LINE
    ; turn off display with no cursour yet
    call lcd_off
    ; clear display
    call _lcd_init_buffers
    call lcd_clear
    ; set cursor to move right
    call lcd_wait_busy
    mov [LCD_INSTRUCTION_REG],(_CMD_ENTRY_MODE|_OPT_CURSOR_RIGHT)
    ; set cursour at home
    call lcd_cursor_home
    ; turn on display
    call lcd_on
    ret

; _lcd_init_buffers
;       Sets up library buffers
_lcd_init_buffers:
    ; initialize  screen buffer
    push _LCD_SCREEN_BUFFER_SIZE
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

; lcd_wait_busy
;   Check the LCD module busy flag and waits until it is not busy
;
;   Arguments
;       None
;
;   Returns
;       None
lcd_wait_busy:
    mov a, [LCD_INSTRUCTION_REG]        ; read in instruction register value
    add %10000000                       ; Add $80 to the instruction rregister value
    jc lcd_wait_busy                    ; if there is a carry, that means BF was 1, or busy, so try again
    ret                                 ; BF was 0, so not busy. Just return.

; lcd_send_command
;   sends a command to the LCD module
; 
;   Arguments:
;       sp+2 : the command to send
; 
;   Returns:
;       nothing
; 
lcd_send_command:
    call lcd_wait_busy                  ; wai to module is ready
    mov [LCD_INSTRUCTION_REG],[sp+2]    ; send the command on the stack
    ret

; lcd_off
;   Turn off LCD display
;
;   Arguments
;       None
;
;   Returns
;       None
; 
lcd_off:
    call lcd_wait_busy
    mov [LCD_INSTRUCTION_REG],_CMD_DISPLAY_CNTL
    ret

; lcd_on
;   Turn on LCD display with no cursor
;
;   Arguments
;       None
;
;   Returns
;       None
; 
lcd_on:
    call lcd_wait_busy
    mov [LCD_INSTRUCTION_REG],(_CMD_DISPLAY_CNTL|_OPT_DISPLAY_ON)
    ret

; lcd_on
;   Turn on LCD display with a blinking cursor
;
;   Arguments
;       None
;
;   Returns
;       None
; 
lcd_on_cursor_blink:
    call lcd_wait_busy
    mov [LCD_INSTRUCTION_REG],(_CMD_DISPLAY_CNTL|_OPT_DISPLAY_CNTL_ALL)
    ret

; lcd_clear
;   Clears the LCD sceen and screen buffer.
;
;   Arguments
;       None
;
;   Returns
;       None
; 
lcd_clear:
    call lcd_wait_busy
    mov [LCD_INSTRUCTION_REG],_CMD_CLEAR_DISPLAY
    ret

lcd_cursor_home:
    call lcd_wait_busy
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
    push [sp+4]                         ; put row number on stack
    call _lcd_set_hl_to_row_ptr
    pop                                 ; restore stack
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

; lcd_center_cstr_on_row
;       Writes the passed cstr on the indicated row, but centered horizontally. Will not
;       overwrite positions where passed string would not print.
;       NOTE - as currently implemented does not work with strings longer than a row's width.
; 
;   arguments:
;       sp+2    - the address of the cstr to display (2 bytes)
;       sp+4    - row number (0-3)
;   returns:
;       nothing
lcd_center_cstr_on_row:
    push2 [sp+2]
    call cstr_len8
    pop2
    push a                  ; push the cstr length on the stack
    mov a, _COLUMN_WIDTH    ; place column width in A
    sub [sp]                ; subtract the string width
    pop
    push 2                  ; divisor
    push a                  ; dividend
    call divide8
    pop a                   ; place the halved diffenrence in A
    pop                     ; stack is restored
    push [sp+4]             ; place target row on stack
    push a                  ; place target column on stack
    push2 [sp+(2+2)]        ; place cstr address on stack
    call lcd_write_cstr_at  ; draw centered cstr
    pop2
    pop
    pop                     ; stack is restored
    ret

; lcd_send_buffer_row
;       Sends specific row in buffer to LCD device
;
;   arguments:
;       sp+2    - row number (0-3)
;
lcd_send_buffer_row:
    push [sp+2]
    call _lcd_set_hl_to_row_ptr
    pop
.send_row:
    push 0                                  ; column 0
    push [sp+2]                             ; pass row
    call lcd_set_cursor_to_row_column
    pop
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

; _lcd_set_hl_to_row_ptr
;   INTERNAL - set register HL to the buffer pointer for given row
;
;   Arguments
;       sp+2 : row (0-3)
;
;   Returns
;       hl : set to the current row pointer for desired row
;
_lcd_set_hl_to_row_ptr:
    mov a,[sp+2]                         ; put row number on stack
    jeq .row0, 0
    jeq .row1, 1
    jeq .row2, 2
    jeq .row3, 3
    hlt                                  ; ERROR invalid row num
.row0:
    mov2 hl, [_lcd_row0_ptr]
    ret
.row1:
    mov2 hl, [_lcd_row1_ptr]
    ret
.row2:
    mov2 hl, [_lcd_row2_ptr]
    ret
.row3:
    mov2 hl, [_lcd_row3_ptr]
    ret

; lcd_set_cursor_to_row_column
;       Sets the LCD DDRAM address to the columns of the passed row
;
;   Arguments
;       sp+2    - desired row, values 0, 1, 2, or 3. Nothing hapens if invalid row passed.
;       sp+3    - desired column, values 0-19
;
;   Returns
;       nothing
;
;
lcd_set_cursor_to_row_column:
    call lcd_wait_busy
    mov a, [sp+2]
    jeq .row0, 0
    jeq .row1, 1
    jeq .row2, 2
    jeq .row3, 3
    hlt
.row0:
    mov a, _CMD_DDRAM_ADDR
    jmp .set_cursor
.row1:
    mov a, (_CMD_DDRAM_ADDR|$40)
    jmp .set_cursor
.row2:
    mov a, (_CMD_DDRAM_ADDR|$14)
    jmp .set_cursor
.row3:
    mov a, (_CMD_DDRAM_ADDR|$54)
.set_cursor:
    add [sp+3]
    mov [LCD_INSTRUCTION_REG], a
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
    call lcd_wait_busy
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
;       sp+2 : boolean (1 or 0) indicating whether to erase last row
;
;   Returns
;       nothing
;
;
lcd_scroll_up:
    ; Rotate the row pointers - must use HL to move rather than 1 mov2 because
    ; ISA does not support mov2 between indirect memory addresses
    push2 [_lcd_row0_ptr]                               ; save row 0 pointer to stack
    mov2 hl,[_lcd_row1_ptr]                             ; copy row 1 pointer to row 0 through HL
    mov2 [_lcd_row0_ptr],hl
    mov2 hl,[_lcd_row2_ptr]                             ; copy row 2 pointer to row 1 through HL
    mov2 [_lcd_row1_ptr],hl
    mov2 hl,[_lcd_row3_ptr]                             ; copy row 3 pointer to row 2 through HL
    mov2 [_lcd_row2_ptr],hl
    pop2 [_lcd_row3_ptr]                                ; pop saved row 0 pointer into row 3
    ; set the bottom row to all zpaces
    push _COLUMN_WIDTH
    push $20
    push2 [_lcd_row3_ptr]
    call memset8
    pop2
    pop
    pop                                                 ; stack is restored
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
    pop                                                 ; stack is restored
    ret


; lcd_print_line_cstr
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
lcd_print_line_cstr:
    push 0                          ; we do not want to erase the bottom row (FALSE)
    call lcd_scroll_up              ; scroll the screen up
    pop                             ; restore stack
    push (_ROW_COUNT-1)             ; printing to last row
    push2 [sp+3]                    ; push the cstr address (now 1 deeper)
    call lcd_write_row_cstr         ; write cstr to last row
    pop2                            ; restore stack
    pop
    ret


; lcd_write_cstr_at
;   Writes a cstr at the given location, truncating it if it extends past the end of the row.
;   only writes the passed string, and does not fill the remaining row with spaces.
;
;   Arguments
;       sp+2 : the address of the cstr to print
;       sp+4 : the column (x) position the cstr should start at (0-19)
;       sp+5 : the row (y) position the cstr should start at (0-3)
;
;   Returns
;       nothing
;
lcd_write_cstr_at:
    push [sp+5]
    call _lcd_set_hl_to_row_ptr
    pop
    mov a, _COLUMN_WIDTH                ; set a to max column width
    sub [sp+4]                          ; subtract desired x position to get max cstr width
    mov i, a                            ; move to i to be the counter
    mov2 mar, [sp+2]                    ; put the string address into mar for later dereferencing
.copy_loop:
    mov a,[mar]                         ; copy cstr character to A
    jeq .lcd_write, 0                   ; check to see it is 0, if so, end the write loop
    mov [hl+[sp+4]], a                  ; move the the character to the desired location in the row buffer
    dec i                               ; decrement size counter
    jz .lcd_write                       ; if 0, we are done
    inc mar                             ; increment source string to next character
    inc hl                              ; increment destination to next address
    jmp .copy_loop                      ; restart copy loop
.lcd_write:
    push [sp+5]                         ; push row number to stack
    call lcd_send_buffer_row            ; send that row to LCD device
    pop                                 ; restore stack
.end:
    ret

; lcd_redraw_screen
;       Redraws th entire LCD screen based on what's in screen buffer. Does not clear screen first.
; 
;   Arguments
;       None
; 
;   Returns
;       Nothing
; 
lcd_redraw_screen:
    push 0
    call lcd_send_buffer_row
    mov [sp], 1
    call lcd_send_buffer_row
    mov [sp], 2
    call lcd_send_buffer_row
    mov [sp], 3
    call lcd_send_buffer_row
    pop
    ret
    nop                             

; lcd_create_character
;   adds a customer character to the LCD module.
;
;   Arguments
;       sp+2 : character ID. only 0 through 7 are allowed. Note that the null character (0-valued)
;              is used by cstr's to indicate the end of the string, so the 0 character
;              ID is effectively unusable when using cstr's.
;       sp+3 : character data address. Must point to an 8-byte buffer
;
;   Returns
;       nothing
; 
lcd_create_character:
    call lcd_wait_busy              ; wait on busy
    ; first thing is to convert character ID into an CGRAM address
    mov a, [sp+2]                   ; place charcter ID into A
    add a                           ; ISA doesn't have left shift (yet), so add A to itself
    add a                           ; and again
    add a                           ; and again for a <<3
    add _CMD_CGRAM_ADDR             ; add CGGRAM instruction prefix (would prefer OR but not in ISA yet)
    mov [LCD_INSTRUCTION_REG], a    ; send command to set the CGRAM address
    ; now copy the character buffer
    mov i,8                         ; set buffer size in counter
    mov2 hl,[sp+3]                  ; set buffer address in HL
.loop:
    mov [LCD_DATA_REG],[hl]         ; copy buffer data to LCD module
    dec i                           ; decrement counter
    jz .end                         ; exit loop after all bytes transfered
    inc hl                          ; increment HL to next buffer byte
    jmp .loop
.end:
    ret
