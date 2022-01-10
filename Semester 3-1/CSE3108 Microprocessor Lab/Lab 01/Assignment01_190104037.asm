;Assignment 01 - 190104037

;3L4U1
;3 -> 01001111b
;L -> 00111000b
;4 -> 01100110b
;U -> 00111110b
;1 -> 00000110b

TITLE   8086 Code Template (for EXE file)

       #MAKE_EXE#

DSEG SEGMENT 'DATA'

NUMBERS	DB 01001111b, 00111000b, 01100110b, 00111110b, 00000110b

DSEG ENDS

SSEG SEGMENT STACK 'STACK'
DW 100h DUP(?)
SSEG ENDS

CSEG SEGMENT 'CODE'

START PROC FAR
                    ; Store return address to OS:
    PUSH DS
    MOV AX, 0
    PUSH AX

                    ; set segment registers:
    MOV AX, DSEG
    MOV DS, AX
    MOV ES, AX

	MOV DX, 2030h	; first Seven Segment Display
	MOV SI, 0
	MOV CX, 8

NEXT:
	MOV AL,NUMBERS[SI]
	out dx,al
	INC SI
	INC DX
    
    XOR BX,BX        
	MOV BX,CX       ; store counter value in bx for counting delay
	
	                ; delay code	
	MOV CX,5FH      ; loop counter value
	
	DELAY:
	
	LOOP DELAY
	
	MOV CX,BX       ; restore the previous value of CX
    
	LOOP NEXT
	

; return to operating system:
    RET

START ENDP


CSEG ENDS 

END START    ; set entry point.



;Assignment 01 - 3L4U1

;3L4UI
;3 -> 01001111b
;L -> 00111000b
;4 -> 01100110b
;U -> 00111110b
;1 -> 00000110b




