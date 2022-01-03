; memset8
;   sets each byte in a block of memory to a particular value
;
;   Arguments
;       sp+2 : memory address (2 bytes)
;       sp+4 : value to set (1 byte)
;       sp+5 : size of memory block (1 byte)
;
;   Returns
;       nothing
;
;   Registers Used
;       hl
;       a
;       i

memset8:
    mov2 hl,[sp+2]
    mov a,[sp+5]
    jeq .end,0                  ; check to see if 0 was passed for buffer size
    mov i,a                     ; put buffer size in i
    mov a,[sp+4]                ; put overwrite value in a
.loop:
    mov [hl],a                  ; write a value to memory
    dec i                       ; decrement size counter
    jz .end                     ; if at zero we are done
    inc hl                      ; increment address in hl for next byte
    jmp .loop                   ; loop again
.end:
    ret                         ; return


; memcpy8
;   copies memory from one block to another for a given number of bytes
;
;   Arguments
;       sp+2 : destination memory address (2 bytes)
;       sp+4 : source memory address (2 byte)
;       sp+6 : size of memory block (1 byte)
;
;   Returns
;       nothing
;
;   Registers Used
;       hl
;       a
;       i
memcpy8:
    mov a,[sp+6]                ; initially put block size in a
    jeq .end,0                  ; check to see if 0 was passed for buffer size
    mov i,a                     ; put buffer size in i
    mov2 hl,[sp+2]              ; destination address in hl
    mov2 mar,[sp+4]             ; source in mar
.loop:
    mov [hl],[mar]              ; copy 1 byte form source to destination
    dec i                       ; decrement counter
    jz .end                     ; if counter at 0 we are done
    inc mar                     ; next address in source
    inc hl                      ; next address in destination
    jmp .loop
.end:
    ret

