; PUTEY-1 BETA System
;   This is a collection of standard libraries to be used when programming the PUTEY-1 BETA computer.
;
;   Hardware requirements: BETA 4
;
;   RAM Memory Reservation
;       In general, RAM in addresses $F000 to $FFFF is reserved for the system. The
;       following reservations ar emade by each system component
;
;           * $F000 - $F1FF : General system needs
;           * $F200 - $F2FF : LCD Display Module
;
#require "putey-1-beta >= 0.4.0"
#create_memzone system_code $3000 $6FFF
#create_memzone system_variables $F000 $FFFF

#include "stringlib.asm"
#include "memlib.asm"
#include "utilitylib.asm"
#include "mathlib.asm"
#include "lcdlib.asm"



