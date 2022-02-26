TITLE   8086 Code Template (for EXE file)

;       AUTHOR          emu8086
;       DATE            ?
;       VERSION         1.00
;       FILE            ?.ASM

; Note: Set the delay to 100 ms in Emu 8086 and to 10 ms 
;       in I/O Emulation Kit to get best results for this sample
;       (i.e., the delay of I/O Emulation Kit is much smaller than
;        the delay of Emu8086).

; 8086 Code Template

; Directive to make EXE output:
       #MAKE_EXE#

DSEG    SEGMENT 'DATA'

; TODO: add your data here!!!! 

;NUMBERS	DB 02H, 06H, 02H, 0BH, 0AH, 08H 

NUMBERS	DB 0CH, 08H, 00H, 01H

DSEG    ENDS

SSEG    SEGMENT STACK   'STACK'
        DW      100h    DUP(?)
SSEG    ENDS

CSEG    SEGMENT 'CODE'

;*******************************************

START   PROC    FAR

; Store return address to OS:
 	PUSH    DS
 	MOV     AX, 0
 	PUSH    AX

; set segment registers:
	MOV     AX, DSEG
 	MOV     DS, AX
 	MOV     ES, AX


	MOV DX, 2070H

MAINLOOP:

	MOV CX, 4           ; 4 instructions

NEXT:
	MOV AL,NUMBERS[SI]
	OUT dx,al
	INC SI
	
    XOR BX,BX        
	MOV BX,CX           ; store counter value in bx for counting delay
	                    	
	MOV CX,1EAH         ; delay code
	
	DELAY:
	LOOP DELAY
	
	MOV CX,BX           ; restore the previous value of CX
    
	LOOP NEXT
	

; return to operating system:
	RET
START   ENDP

;*******************************************

CSEG    ENDS 

END    START    ; set entry point.

