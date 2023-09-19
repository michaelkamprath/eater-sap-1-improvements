#require "putey-1-beta >= 0.5.0"

SPEECH_COMMAND_REG = $7800
SPEECH_STATUS_REG = $7801
SPEECH_STATE_REG = $7802

SPEECH_CMD_SPEAK_EXTERNAL = b01100000
SPEECH_CMD_RESET = b11110000

SPEECH_STATE_BIT_BUSY = 0
SPEECH_STATE_BIT_READY = 1
SPEECH_STATE_BIT_INTERUPT = 2

SPEECH_STATUS_BIT_TALK_STATUS   = 7
SPEECH_STATUS_BIT_BUFFER_LOW    = 6
SPEECH_STATUS_BIT_BUFFER_EMPTY  = 5

.memzone system_variables
_speech_buffer_cur_ptr: .2byte 0
_speech_buffer_end_ptr: .2byte 0
_string_buffer: .zero 32
.memzone system_code
; speech_init
;
;   Prepares the TMS5220 for speech
;
;   Arguments
;       None
;
speech_init:
    mov2 [_speech_buffer_cur_ptr],0
    mov2 [_speech_buffer_end_ptr],0
    ; execute the TMS5220 init sequence documented in
    ; P7 of the TMS5220 data sheet
    ;
    ; First, send 9 bytes of all ones
    mov i,9
    push $FF
.loop:
    call _speech_send_cmd_data
    dec i
    jnz .loop
    pop
    ; now send reset command
    push SPEECH_CMD_RESET
    call _speech_send_cmd_data
    pop
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
    ; write a byte to the status register initiate a fetch
    mov [SPEECH_STATUS_REG],1
    ; now wait until TMS5220 is not busy
    call _wait_on_speech_busy
    ; and fetch the status
    mov a,[SPEECH_STATUS_REG]
    ret

; _wait_on_speech_busy
;   wait until the speech subsystem is not busy
;
_wait_on_speech_busy:
    push f
.wait:
    tstb [SPEECH_STATE_REG],SPEECH_STATE_BIT_BUSY
    jnz .wait
    pop f
    ret

; _speech_send_cmd_data
;   sends a single byte to the TMS5220 after waiting for it
;   to become not busy
;
;   Arguments
;       sp+2 - the byte to send to the TMS5220
;
;   Returns
;       none
_speech_send_cmd_data:
    call _wait_on_speech_busy
    mov [SPEECH_COMMAND_REG],[sp+2]
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

speech_start_synchronous:
    push2 [sp+4+0]
    push2 [sp+2+2]
    call speech_start
    pop2 pop2
    push2 hl
.buffer_loop:
    mov2 hl,[_speech_buffer_cur_ptr]
    cmp2 hl,0
    je .done
    call speech_update_buffer
    jmp .buffer_loop
.done:
    pop2 hl
    ret

; speech_start
;   Starts the asynchronous speaking process on the TMS5220 witht he passed buffer. Fills the TMS5220
;   FIFO buffer with 16 bytes, then returns. Caller should call speech_update_buffer
;   every 5-10 ms to check in on speech process and update FIFO buffer if needed.
;   Speech completion status can be checked with speech_is_talking.
;
;   If talking is in progress when this function is called, it will wait for talking to
;   complete.
;
;   Arguments:
;       sp+2 : Buffer Start address (2 bytes)
;       sp+4 : Buffer End address (2 bytes)
;
speech_start:
    push2 hl
    push a
    push f          ; +4 to stack
    ; first check if already talking
    mov2 hl,[_speech_buffer_cur_ptr]
    cmp2 hl,0
    je _setup_talking
.wait_for_talking:
    call speech_get_status
    tstb a,SPEECH_STATUS_BIT_TALK_STATUS
    jnz .wait_for_talking
_setup_talking:
    ; save speech buffer to system variables
    mov2 hl,[sp+2+4]
    mov2 [_speech_buffer_cur_ptr],hl
    mov2 hl,[sp+4+4]
    mov2 [_speech_buffer_end_ptr],hl
    ; send speak external command
    push SPEECH_CMD_SPEAK_EXTERNAL
    call _speech_send_cmd_data
    pop
    ; send 16 bytes
    call _send_8_bytes
    call _send_8_bytes
.done:
    pop f
    pop a
    pop2 hl
    ret




; speech_update_buffer
;   Checks to see if there is an ongoing speech operation and send the TMS5220 more data if
;   it is ready to receive it.
;
;   Arguments
;       None
;
speech_update_buffer:
    push2 hl
    push a
    push f          ; +4 to stack
    ; first, check to see if we have a in-progress buffer, signified by a non-zero pointer
    mov2 hl,[_speech_buffer_cur_ptr]
    cmp2 hl,0
    je .done
.check_buffer_low:
    call speech_get_status
    tstb a,SPEECH_STATUS_BIT_BUFFER_LOW
    jz .done
    call _send_8_bytes
.done:
    pop f
    pop a
    pop2 hl
    ret

; _send_8_bytes
;   Sends the next 8 bytes in the speech buffer. If less than
;   8 bytes left, will send just that.
_send_8_bytes:
    push2 hl
    push i          ; +3 to stack
    mov i,8
.send_loop:
    ; ensure we are not at end of buffer
    mov2 hl,[_speech_buffer_cur_ptr]
    cmp2 hl,[_speech_buffer_end_ptr]
    je .buffer_done
    ; wait until speech is not busy
    call _wait_on_speech_busy
    ; write data to the speech submodule
    mov2 hl,[_speech_buffer_cur_ptr]
    mov [SPEECH_COMMAND_REG],[hl]
    ; increase speech buffer pointer
    inc hl
    mov2 [_speech_buffer_cur_ptr],hl
    ; decrement counter and check if done
    dec i
    jnz .send_loop
    jmp .done
.buffer_done:
    mov2 [_speech_buffer_cur_ptr],0
    mov2 [_speech_buffer_end_ptr],0
.done:
    pop i
    pop2 hl
    ret

