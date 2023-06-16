#require "putey-1-beta >= 0.5.0"

SPEECH_COMMAND_REG = $7800
SPEECH_STATUS_REG = $7801
SPEECH_STATE_REG = $7802

SPEECH_CMD_SPEAK_EXTERNAL = b01100000
SPEECH_CMD_RESET = b11110000

SPEECH_STATE_BIT_BUSY = 0
SPEECH_STATE_BIT_READY = 1
SPEECH_STATE_BIT_INTERUPT = 2

SPEECH_BITMASK_TALK_STATUS  = b10000000
SPEECH_BITMASK_BUFFER_LOW   = b01000000
SPEECH_BITMASK_BUFFER_EMPTY = b00100000

.memzone system_code
; speech_init
;
;   Prepares the TMS5220 for speech
;
;   Arguments
;       None
;
speech_init:
    ; execute the TMS5220 init sequence documented in
    ; P7 of the TMS5220 data sheet
    ;
    ; First, send 9 bytes of all ones
    mov i,9
.loop:
    mov a,$FF
    call _speech_send_cmd_data
    dec i
    jnz .loop
    ; now send reset command
    mov a,SPEECH_CMD_RESET
    call _speech_send_cmd_data
    ret


; speech_get_status
;   fetches the inernal status of the TMS5220
;
;   Arguments
;       None
;
;   Returns
;       Register A - The TMS5220 status byte
;
speech_get_status:
    push f
    ; write a byte to the status register initiate a fetch
    mov [SPEECH_STATUS_REG],1
    ; now wait until TMS5220 is not busy
.wait_loop:
    tstb [SPEECH_STATE_REG],SPEECH_STATE_BIT_BUSY
    jnz .wait_loop
    ; and fetch the status
    mov a,[SPEECH_STATUS_REG]
    pop f
    ret

; _speech_send_cmd_data
;   sends a single byte to the TMS5220 after waiting for it
;   to become not busy
;
;   Arguments
;       Regsiter A - the byte to send to the TMS5220
;
;   Returns
;       none
_speech_send_cmd_data:
    push f
.wait_loop:
    tstb [SPEECH_STATE_REG],SPEECH_STATE_BIT_BUSY
    jnz .wait_loop
    mov [SPEECH_COMMAND_REG],a
    pop f
    ret

; _send_stop_code
;   sends a stop code. call at end of sending external speech data.
;
_send_stop_code:
    mov a,$F0
    call _speech_send_cmd_data
    ret

; speak_external_buffer
;   Uses Speak External command to speak dta in passed buffer
;
;   Arguments
;       sp+2 : Buffer Start address (2 bytes)
;       sp+4 : Buffer End address (2 bytes)
;
;   Retruns:
;       None
;
;   Algorithm
;       Sends 16 bytes eight away, and then waits for
;       TS to go high. Wait for BL to go high, and then
;       add 8 more bytes. Repeat the "TL high then BL high
;       then 8 more bytes" until the input buffer is empty.
;       Every time a byte is added check for the input buffer to be empty.
;       When all bytes are sent, send stop code.
;

_MAX_POST_WRITE_COUNTS = 255        ; Tuned for a 1 MHz clock. "255" effectively means never repeat after long wait.
speak_external_buffer:
    push2 hl
    push a
    push i
    push f                          ; +5 to the stack

    ; first check that TMS5220 FIFO is not talking
.wait_loop:
    call speech_get_status          ; place speech status in A register
    and SPEECH_BITMASK_TALK_STATUS  ; Is it talking?
    jnz .wait_loop

    ; now send speek external command
    mov a,SPEECH_CMD_SPEAK_EXTERNAL
    call _speech_send_cmd_data

    ; start the data block transfer
    mov2 hl,[sp+2+5]
    cmp2 hl,[sp+4+5]
    jo .error_buffer
    call print_current_speech_buffer_addr

    ; init I 16 bytes for first dump
    mov i,16
.send_buffer_data:
    cmp2 hl,[sp+4+5]
    je .buffer_done
.wait_not_busy:
    tstb [SPEECH_STATE_REG],SPEECH_STATE_BIT_BUSY
    jnz .wait_not_busy
    mov [SPEECH_COMMAND_REG],[hl]       ; write the data value to the TMS5200
    inc hl
    ; determine if we need to pause or continue
    dec i
    jnz .send_buffer_data
    ; now we need to pause until /INT goes low to indicate the buffer is low
.wait_for_interupt:
    tstb [SPEECH_STATE_REG],SPEECH_STATE_BIT_INTERUPT
    jnz .wait_for_interupt
    ; to reset the interupt, neeg to "read" the status register
    call speech_get_status          ; place speech status in A register
    ; check if talking has stopped using the speech status
    and SPEECH_BITMASK_TALK_STATUS
    jz .speaking_stopped
    mov i,8                             ; reset I to 7 for 8 bytes (0-based)
    jmp .send_buffer_data
.buffer_done:
    call print_tms5220_status
    call print_current_speech_buffer_addr
    ; done with sending speech data. wait for buffer low before sending stop code
    ; call speech_get_status
    ; and SPEECH_BITMASK_BUFFER_LOW
    ; jz .buffer_done
    mov a,$F0                       ; stop code
    call _speech_send_cmd_data
.done:
    ; restore registers and return
    pop f
    pop i
    pop a
    pop2 hl
    ret
.speaking_stopped:
    ; first compare buffer status
    cmp2 hl,[sp+4+5]
    je .speaking_over               ; its really over
    ; we were not fast enough and have more data to send. restart at where we left off
    mov a,SPEECH_CMD_SPEAK_EXTERNAL
    call _speech_send_cmd_data
    mov i,16
    jmp .send_buffer_data
.speaking_over:
    push2 .speaking_stopped_str
    call lcd_print_line_cstr
    pop2
    jmp .buffer_done
.error_buffer:
    ; handle error
    push2 .error_buffer_str
    call lcd_print_line_cstr
    pop2
    jmp .done
.speaking_stopped_str:
    .cstr "Speech stopped"
.error_buffer_str:
    .cstr "ERROR: speech buffer"

print_tms5220_status:
    ; save a and i
    push2 hl
    push f
    push i
    push a                  ; save A value to be printed
    push2 str_status_prefix
    push2 _str_buffer1
    call cstr_copy
    call cstr_len8          ; place str length into A
    pop2
    pop2
    pop i                   ; pop inbound A value into i
    push a                  ; A has where the binary str should start
    push2 _str_buffer1
    push i                  ; push inbound A value in I onto stack
    call uint8_to_binary_cstr
    pop i                   ; restore A state to I
    pop2
    pop
    push i                  ; save A state in I to stack again
    push2 _str_buffer1
    call lcd_print_line_cstr
    pop2
.done:
    ; restore states
    pop a
    pop i
    pop f
    pop2 hl
    ret

print_current_speech_buffer_addr:
    push i
    push2 hl
    push2 str_buffer_addr_prefix
    push2 _str_buffer1
    call cstr_copy
    call cstr_len8          ; place str length into A
    pop2
    pop2

    pop2 hl                 ; restore HL
    push a
    push2 _str_buffer1
    push2 hl
    call uint16_to_hex_cstr
    pop2 hl
    pop2
    pop
    push2 hl
    push2 _str_buffer1
    call lcd_print_line_cstr
    pop2
    pop2 hl
    pop i
    ret

str_status_prefix:
    .cstr "status: "
str_buffer_low:
    .cstr "buffer low!"
str_buffer_empty:
    .cstr "buffer EMPTY!"
str_buffer_addr_prefix:
    .cstr "buffer: $"

.memzone application_ram
SPEECH_TEST_BUFFER_SIZE = 21
_str_buffer1:
    .zero SPEECH_TEST_BUFFER_SIZE
