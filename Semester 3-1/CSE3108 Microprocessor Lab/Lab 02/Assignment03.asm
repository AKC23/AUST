;Assignment 03 - 190104037

;3L4U1
;3 -> 01001111b
;L -> 00111000b
;4 -> 01100110b
;U -> 00111110b
;1 -> 00000110b

TITLE   8086 Code Template (for EXE file)

       #MAKE_EXE#

DSEG SEGMENT 'DATA'



;Fahim
;NUMBERS1 DB 6DH, 7CH, 4FH, 38H, 6FH           ;seven segment display
;NUMBERS2 DB 02H, 06H, 02H, 0BH, 0AH, 08H      ;LED Display

;Ahmad
;NUMBERS1 DB 01001111b, 00111000b, 01100110b, 00111110b, 00000110b
NUMBERS1 DB 4FH, 38h, 66H, 3EH, 06H          ;seven segment display
NUMBERS2 DB 0CH, 08H, 00H, 01H               ;LED Display


DSEG ENDS

SSEG SEGMENT STACK 'STACK'
DW 100h DUP(?)
SSEG ENDS

CSEG SEGMENT 'CODE'


START PROC FAR
                    
    PUSH DS             ; Store return address to OS:
    MOV AX,0
    PUSH AX
     
    MOV AX, DSEG        ; set segment registers:
    MOV DS, AX
    MOV ES, AX

	
	MOV SI, 0
	MOV DI, 0
	
	MOV CX, 04H
    MOV BP, 2030H       ; BP -> temnporary register

NEXT:
	
	MOV AL,NUMBERS1[SI]
	MOV DX,BP	        ; Seven Segment Display
	OUT DX,AL
	
	MOV AL,NUMBERS2[DI]
	MOV DX, 2070H	    ; LED Display
	OUT DX,AL
	
	INC SI
	INC DI
	INC BP              ; INCREMENT BP FOR DX
    
    XOR BX,BX        
	MOV BX,CX           ; store counter value in bx for counting delay
	                 	
	MOV CX,1EAH         ; delay code
	
	DELAY:
	LOOP DELAY
	
	MOV CX,BX           ; restore the previous value of CX
    
	LOOP NEXT
	
	
	MOV AL,NUMBERS1[SI] 
	MOV DX,BP	        ; Seven Segment Display (last input)
	OUT DX,AL

; return to operating system:
    RET

START ENDP


CSEG ENDS 

END START    ; set entry point.



;Assignment 03 - 3L4U1

;3L4U1
;3 -> 01001111b
;L -> 00111000b
;4 -> 01100110b
;U -> 00111110b
;1 -> 00000110b







