; PUTEY-1 BETA System Kernel
;   This is a collection of standard libraries to be used when programming the PUTEY-1 BETA computer.
;
;   Hardware requirements: BETA 5
;
;   RAM Memory Reservation
;       In general, RAM in addresses $F000 to $FFFF is reserved for the system. The
;       following reservations ar emade by each system component
;
;           * $F000 - $F1FF : General system needs
;           * $F200 - $F2FF : LCD Display Module
;
#require "putey-1-beta >= 0.5.0"
#create_memzone application_code $0200 $3FFF
#create_memzone system_code $4000 $6FFF
#create_memzone system_variables $F000 $FFFF
#create_memzone application_ram $8000 $EFFF

#include "stringlib.asm"
#include "memlib.asm"
#include "utilitylib.asm"
#include "mathlib.asm"
#include "lcdlib.asm"
#include "speechlib.asm"

.org 0
_system_init:
    rsp                             ; init stack pointer
    call lcd_init                   ; init device

    jmp _application_start









.org 0 "application_code"
_application_start:
    ; nothing here. Just need a symbol for where to jump to
    ; to start application