#require "putey-1-beta >= 0.5.0"

SPEECH_COMMAND_REG = $7820
SPEECH_STATUS_REG = $7821
SPEECH_STATE_REG = $7823

SPEECH_CMD_SPEAK_EXTERNAL = b01100000
SPEECH_CMD_RESET = b01110000

SPEECH_STATE_BIT_BUSY = 0


SPEECH_BITMASK_TALK_STATUS = b10000000
SPEECH_BITMASK_BUFFER_LOW = b01000000

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
speak_external_buffer:
    ; first check that TMS5220 FIFO is not talking
.wait_loop:
    call speech_get_status
    and SPEECH_BITMASK_TALK_STATUS
    jnz .wait_loop
    ; first send speak external command
    mov a,SPEECH_CMD_SPEAK_EXTERNAL
    call _speech_send_cmd_data
    ; place buffer in HL
    mov2 hl,[sp+2]
.send_buffer_data:
    ; first check that we are not at end
    push2 [sp+4]
    push2 hl
    call cmp16
    pop2
    pop2
    je .buffer_done
    ; now check to see if TMS5220 buffer is move than half full
.check_buffer_status:
    call speech_get_status
    and SPEECH_BITMASK_BUFFER_LOW
    jz .check_buffer_status
    ; now send one byte from buffer
    mov a,[hl]
    call _speech_send_cmd_data
    inc hl
    jmp .send_buffer_data
.buffer_done:
    ; done with sending speech data. Really nothing to do except
    ; return
    ret

