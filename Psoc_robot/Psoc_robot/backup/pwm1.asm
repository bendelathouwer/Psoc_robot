;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: PWM1.asm
;;   Version: 2.5, Updated on 2015/3/4 at 22:26:51
;;  Generated by PSoC Designer 5.4.3191
;;
;;  DESCRIPTION: PWM16 User Module software implementation file
;;
;;  NOTE: User Module APIs conform to the fastcall16 convention for marshalling
;;        arguments and observe the associated "Registers are volatile" policy.
;;        This means it is the caller's responsibility to preserve any values
;;        in the X and A registers that are still needed after the API functions
;;        returns. For Large Memory Model devices it is also the caller's 
;;        responsibility to perserve any value in the CUR_PP, IDX_PP, MVR_PP and 
;;        MVW_PP registers. Even though some of these registers may not be modified
;;        now, there is no guarantee that will remain the case in future releases.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2015. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "PWM1.inc"
include "memory.inc"

;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------
export  PWM1_EnableInt
export _PWM1_EnableInt
export  PWM1_DisableInt
export _PWM1_DisableInt
export  PWM1_Start
export _PWM1_Start
export  PWM1_Stop
export _PWM1_Stop
export  PWM1_WritePeriod
export _PWM1_WritePeriod
export  PWM1_WritePulseWidth
export _PWM1_WritePulseWidth
export  PWM1_wReadPulseWidth
export _PWM1_wReadPulseWidth
export  PWM1_wReadCounter
export _PWM1_wReadCounter

; The following functions are deprecated and subject to omission in future releases
;
export  wPWM1_ReadPulseWidth    ; deprecated
export _wPWM1_ReadPulseWidth    ; deprecated
export  wPWM1_ReadCounter       ; deprecated
export _wPWM1_ReadCounter       ; deprecated


AREA psoc_robot_RAM (RAM,REL)

;-----------------------------------------------
;  Constant Definitions
;-----------------------------------------------

INPUT_REG_NULL:                equ 0x00    ; Clear the input register


;-----------------------------------------------
; Variable Allocation
;-----------------------------------------------


AREA UserModules (ROM, REL)

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: PWM1_EnableInt
;
;  DESCRIPTION:
;     Enables this PWM's interrupt by setting the interrupt enable mask bit
;     associated with this User Module. This function has no effect until and
;     unless the global interrupts are enabled (for example by using the
;     macro M8C_EnableGInt).
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None.
;  RETURNS:      Nothing.
;  SIDE EFFECTS: 
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 PWM1_EnableInt:
_PWM1_EnableInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   PWM1_EnableInt_M
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret


.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: PWM1_DisableInt
;
;  DESCRIPTION:
;     Disables this PWM's interrupt by clearing the interrupt enable
;     mask bit associated with this User Module.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None
;  RETURNS:      Nothing
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 PWM1_DisableInt:
_PWM1_DisableInt:
   RAM_PROLOGUE RAM_USE_CLASS_1
   PWM1_DisableInt_M
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret


.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: PWM1_Start
;
;  DESCRIPTION:
;     Sets the start bit in the Control register of this user module.  The
;     PWM will begin counting on the next input clock as soon as the
;     enable input is asserted high.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None
;  RETURNS:      Nothing
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 PWM1_Start:
_PWM1_Start:
   RAM_PROLOGUE RAM_USE_CLASS_1
   PWM1_Start_M
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret


.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: PWM1_Stop
;
;  DESCRIPTION:
;     Disables PWM operation by clearing the start bit in the Control
;     register of the LSB block.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None
;  RETURNS:      Nothing
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 PWM1_Stop:
_PWM1_Stop:
   RAM_PROLOGUE RAM_USE_CLASS_1
   PWM1_Stop_M
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret


.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: PWM1_WritePeriod
;
;  DESCRIPTION:
;     Write the 16-bit period value into the Period register (DR1).
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: fastcall16 WORD wPeriodValue (LSB in A, MSB in X)
;  RETURNS:   Nothing
;  SIDE EFFECTS:
;    If the PWM user module is stopped, then this value will also be
;    latched into the Count registers (DR0).
;    
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 PWM1_WritePeriod:
_PWM1_WritePeriod:
   RAM_PROLOGUE RAM_USE_CLASS_1
   mov   reg[PWM1_PERIOD_LSB_REG], A
   mov   A, X
   mov   reg[PWM1_PERIOD_MSB_REG], A
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret


.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: PWM1_WritePulseWidth
;
;  DESCRIPTION:
;     Writes the pulse width value into the Compare register (DR2).
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    fastcall16 WORD wCompareValue (LSB in A, MSB in X)
;  RETURNS:      Nothing
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 PWM1_WritePulseWidth:
_PWM1_WritePulseWidth:
   RAM_PROLOGUE RAM_USE_CLASS_1
   mov   reg[PWM1_COMPARE_LSB_REG], A
   mov   A, X
   mov   reg[PWM1_COMPARE_MSB_REG], A
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret


.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: PWM1_wReadPulseWidth
;
;  DESCRIPTION:
;     Reads the Compare register.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:    None
;  RETURNS:      fastcall16 WORD wCompareValue (value of DR2 in the X & A registers)
;  SIDE EFFECTS:
;    The A and X registers may be modified by this or future implementations
;    of this function.  The same is true for all RAM page pointer registers in
;    the Large Memory Model.  When necessary, it is the calling function's
;    responsibility to perserve their values across calls to fastcall16 
;    functions.
;
 PWM1_wReadPulseWidth:
_PWM1_wReadPulseWidth:
 wPWM1_ReadPulseWidth:                           ; this name deprecated
_wPWM1_ReadPulseWidth:                           ; this name deprecated
   RAM_PROLOGUE RAM_USE_CLASS_1
   mov   A, reg[PWM1_COMPARE_MSB_REG]
   mov   X, A
   mov   A, reg[PWM1_COMPARE_LSB_REG]
   RAM_EPILOGUE RAM_USE_CLASS_1
   ret


.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: PWM1_wReadCounter
;
;  DESCRIPTION:
;     Returns the value in the Count register (DR0), preserving the value in
;     the compare register (DR2). Interrupts are prevented during the transfer
;     from the Count to the Compare register by holding the clock low in
;     the MSB PSoC block.
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: None
;  RETURNS:   fastcall16 WORD wCount (value of DR0 in the X & A registers)
;  SIDE EFFECTS:
;     1) The user module is stopped momentarily and one or more counts may be missed.
;     2) The A and X registers may be modified by this or future implementations
;        of this function.  The same is true for all RAM page pointer registers in
;        the Large Memory Model.  When necessary, it is the calling function's
;        responsibility to perserve their values across calls to fastcall16 
;        functions.
;
 PWM1_wReadCounter:
_PWM1_wReadCounter:
 wPWM1_ReadCounter:                              ; this name deprecated
_wPWM1_ReadCounter:                              ; this name deprecated

   bOrigCompareValue:      EQU   0                  ; Frame offset to temp Compare store
   bOrigClockSetting:      EQU   2                  ; Frame offset to temp Input   store
   wCounter:               EQU   3                  ; Frame offset to temp Count   store
   STACK_FRAME_SIZE:       EQU   5                  ; max stack frame size is 5 bytes

   RAM_PROLOGUE RAM_USE_CLASS_2
   mov   X, SP                                      ; X <-  stack frame pointer
   mov   A, reg[PWM1_COMPARE_MSB_REG]            ; Save the Compare register on the stack
   push  A                                          ;
   mov   A, reg[PWM1_COMPARE_LSB_REG]            ;
   push  A                                          ;  -stack frame now 2 bytes-
   PWM1_Stop_M                                   ; Disable the PWM function
   M8C_SetBank1                                     ;
   mov   A, reg[PWM1_INPUT_LSB_REG]              ; save the LSB clock input setting
   push  A                                          ;   on the stack (now 3 bytes) and ...
                                                    ;   hold the clock low:
   mov   reg[PWM1_INPUT_LSB_REG], INPUT_REG_NULL
   M8C_SetBank0                                     ; Extract the Count via DR2 register
   mov   A, reg[PWM1_COUNTER_MSB_REG]            ; DR2 <- DR0 (in the MSB block)
   mov   A, reg[PWM1_COMPARE_MSB_REG]            ; Stash the Count MSB on the stack
   push  A                                          ;  -stack frame is now 4 bytes
   mov   A, reg[PWM1_COUNTER_LSB_REG]            ; DR2 <- DR0 (in the LSB block)
   mov   A, reg[PWM1_COMPARE_LSB_REG]            ; Stash the Count LSB on the stack
   push  A                                          ;   -stack frame is now 5 bytes-
   mov   A, [X+bOrigCompareValue]                   ; Restore the Compare MSB register
   mov   reg[PWM1_COMPARE_MSB_REG], A            ;
   mov   A, [X+bOrigCompareValue+1]                 ; Restore the Compare LSB register
   mov   reg[PWM1_COMPARE_LSB_REG], A            ;
   M8C_SetBank1                                     ; ---Restore the PWM operation
   mov   A, [X+bOrigClockSetting]                   ; Grab the LSB clock setting...
   mov   reg[PWM1_INPUT_LSB_REG], A              ;    and restore it
   M8C_SetBank0                                     ;
   PWM1_Start_M                                  ; Now re-enable the PWM function
   pop   A                                          ; Setup the return value
   pop   X                                          ;
   ADD   SP, -(STACK_FRAME_SIZE-2)                  ; Zap remainder of stack frame
   RAM_EPILOGUE RAM_USE_CLASS_2
   ret

.ENDSECTION

; End of File PWM1.asm
