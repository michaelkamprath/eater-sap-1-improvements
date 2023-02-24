#require "putey-1-beta >= 0.5.0"

SPEECH_COMMAND_REG = $7800
SPEECH_STATUS_REG = $7801
SPEECH_STATE_REG = $7802

SPEECH_CMD_SPEAK_EXTERNAL = b01100000
SPEECH_CMD_RESET = b11110000

SPEECH_STATE_BIT_BUSY = 0


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
    ; write a byte to the status register initiate a fetch
    mov [SPEECH_STATUS_REG],1
    ; now wait until TMS5220 is not busy
.wait_loop:
    tstb [SPEECH_STATE_REG],SPEECH_STATE_BIT_BUSY
    jnz .wait_loop
    ; and fetch the status
    mov a,[SPEECH_STATUS_REG]
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
.wait_loop:
    tstb [SPEECH_STATE_REG],SPEECH_STATE_BIT_BUSY
    jnz .wait_loop
    mov [SPEECH_COMMAND_REG],a
    ret

; _send_stop_code
;   sends a stop code. call at end o sending external speech data.
;
_send_stop_code:
.wait_loop:
    push a                          ; preserve A register
    mov a,$F0
    call _speech_send_cmd_data
    pop a
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
speak_external_buffer:
    ; pushr                           ; preserve registers. +5 bytes to stack
    ; first check that TMS5220 FIFO is not talking
.wait_loop:
    call speech_get_status          ; place speech status in A register
    and SPEECH_BITMASK_TALK_STATUS  ; Is it talking?
    jnz .wait_loop
    ; place buffer in HL
    mov2 hl,[sp+2]
    ; first send speak external command
    mov a,SPEECH_CMD_SPEAK_EXTERNAL
    call _speech_send_cmd_data
.send_loop:
    cmp2 hl,[sp+4]
    je .done_send
.continue_send:
    tstb [SPEECH_STATE_REG],SPEECH_STATE_BIT_BUSY
    jnz .continue_send
    mov [SPEECH_COMMAND_REG],[hl]
    inc hl
    jmp .send_loop
.done_send:
    ret


;     ; init I 16 bytes for first dump
;     mov i,16
;     call .send_i_bytes
;     ; check I for being non-zero
;     cmp i,0
;     jne .buffer_done
;     ; now monitor for TMS5220 TS to go high
; .check_talk_status:
;     call speech_get_status          ; place speech status in A register
;     and SPEECH_BITMASK_TALK_STATUS  ; Is it talking?
;     jz .check_talk_status
;     ; now check buffer status, and wait for it to go high
; .check_buffer_status:
;     ; call speech_get_status
;     ; and SPEECH_BITMASK_BUFFER_LOW
;     ; jz .check_buffer_status
;     ; send 8 more bytes and repeat
;     mov i,8
;     call .send_i_bytes
;     ; check I for being non-zero
;     cmp i,0
;     jne .buffer_done
;     jmp .check_buffer_status
; .buffer_done:
;     ; ; done with sending speech data. wait for buffer low before sending stop code
;     ; call speech_get_status
;     ; and SPEECH_BITMASK_BUFFER_LOW
;     ; jz .buffer_done
;     ; call _send_stop_code
;     ; return
;     ; popr            ; restore registers
;     ret
; ; local method to send as many bytes as the I register.
; ; If I register is non-zero upon return, that means buffer
; ; is empty. Buffer read from prior speak_external_buffer
; ; stack positions, so:
; ;       sp+2+5+2 : Buffer Start address (2 bytes)
; ;       sp+4+5+2 : Buffer End address (2 bytes)
; .send_i_bytes:
; .send_buffer_data:
;     ; first check that we are not at buffer end
;     push2 [sp+(4+2)]
;     push2 hl
;     call cmp16
;     pop2
;     pop2
;     je .send_done
;     ; now send a byte
;     mov a,[hl]
;     call _speech_send_cmd_data
;     inc hl
;     dec i
;     jnz .send_buffer_data           ; send another byte if I>0
; .send_done:
;     ret
