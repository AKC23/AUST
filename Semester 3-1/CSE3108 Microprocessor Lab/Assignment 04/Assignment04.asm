DSEG    SEGMENT 'DATA'


Dots DB	00000001b, 00000001b, 00000001b, 00000001b, 00000001b 
      DB 00000001b, 00000001b, 00000001b, 00000001b, 00000001b 
      DB 00000001b, 00000001b, 00000001b, 00000011b, 00000101b  
      DB 00001001b, 00010001b, 00100001b, 01000001b, 00100001b
      DB 00010001b, 00001001b, 00000101b, 00000011b   

SSD DB 00100000B, 00110000B, 00110010B, 00110110B, 01110110B    ;H
     DB 00100000B, 00110000B, 00111000B, 01111000B, 01111000B   ;t

LED DB 08H, 0CH, 0CH, 0CH, 0CH   ;R2 -> H, G -> t

DSEG    ENDS

SSEG    SEGMENT STACK   'STACK'
        DW      100h    DUP(?)
SSEG    ENDS

CSEG    SEGMENT 'CODE'

START   PROC    FAR

; Store return address to OS:
    PUSH    DS
    MOV     AX, 0
    PUSH    AX

; set segment registers:
    MOV     AX, DSEG
    MOV     DS, AX
    MOV     ES, AX   


    MOV CX, 5               ;MAINLOOP WILL RUN FOR 5 TIMES
    MOV DI, CX              ;DI -> TEMPORARY VARIABLE, USED LATER
    INC DI
                            
MAINLOOP:
    
	MOV SI, 0
	 
	MOV CX, 5               ;L1 WILL RUN FOR 5 TIMES
	MOV DX, 2000H           ;(2000 - 2004)
	MOV BP, DX
	
L1:
	  
	MOV AL, Dots[SI]
	OUT DX, AL
	
    MOV DX, 2030H
    MOV AL, SSD[SI]   
    OUT DX, AL  
    
    MOV DX, 2070H	        
    MOV Al, LED[SI]         ;GLOW R2+G FOR H AND t
    OUT DX, AL
    
    INC SI
    INC BP
    MOV BX, CX              ;BX -> TEMPORARY REGISTER TO HOLD CX VALUE
    
    CALL DELAY              ;CALLING DELAY CODE
    

	MOV CX, BX
	MOV DX, BP
	
LOOP L1
	
	MOV CX, 5               ;L2 WILL RUN FOR 5 TIMES
	MOV DX, 2005H           ;(2005 - 2009)
	MOV BP, DX
	
L2:

	MOV BX, CX  
	MOV AL, Dots[SI]
	OUT DX,AL
	
    MOV DX, 2031H
    MOV AL, SSD[SI]   
    OUT DX, AL
    
    INC SI
    INC BP
    
	CALL DELAY              ;CALLING DELAY CODE
	
	MOV CX, BX
	MOV DX, BP
	
LOOP L2
	
	MOV CX, 3               ;L3 WILL RUN FOR 3 TIMES 
	MOV DX, 200AH           ;(200A - 200C)
	MOV BP, DX
	
L3:

	MOV BX, CX  
	MOV AL, Dots[SI]
	OUT DX,AL
    
    INC SI
    INC BP
    
	CALL DELAY              ;CALLING DELAY CODE
	
	MOV CX, BX
	MOV DX, BP
	
LOOP L3
	                 
	MOV CX, 4               ;L4 WILL RUN FOR 4 TIMES	
	MOV DX, 2001H           ;(2001-2004)
	MOV BP, DX
	
L4:

	MOV BX, CX  
	MOV AL, Dots[SI]
	OUT DX,AL
    
    INC SI
    INC BP
    
	CALL DELAY              ;CALLING DELAY CODE
	
	MOV CX, BX
	MOV DX, BP           
	           
LOOP L4	
	
	MOV CX, 5               ;L5 WILL RUN FOR 3 TIMES	
	MOV DX, 2005H           ;(2005-2009)
	MOV BP, DX
		
L5:

	MOV BX, CX  
	MOV AL, Dots[SI]
	OUT DX,AL
    
    INC SI
    INC BP
    
	CALL DELAY              ;CALLING DELAY CODE
	
	MOV CX, BX
	MOV DX, BP           
	           
LOOP L5	    
    
    MOV CX, 2               ;L6 WILL RUN FOR 2 TIMES	
	MOV DX, 200AH           ;(200A-200B)
	MOV BP, DX
    
L6:

	MOV BX, CX  
	MOV AL, Dots[SI]
	OUT DX,AL
    
    INC SI
    INC BP
    
	CALL DELAY              ;CALLING DELAY CODE
	
	MOV CX, BX
	MOV DX, BP           
	           
LOOP L6
	
	
	MOV CX, 13   
	MOV DX,200CH
	MOV AL, 00000000B
	   
CLR1:                       ;DOT MATRIX CLEAR

    OUT DX,AL
    DEC DX
    
LOOP CLR1
    
    
    
	MOV CX, 2   
	MOV DX, 2031H
	MOV AL, 00000000B
	   
CLR2:                       ;SEVEN SEGMENT DISPLAY CLEAR

    OUT DX,AL
    DEC DX
    
LOOP CLR2
    
    
    
    MOV DX, 2070H           ;LED CLEAR	 
    MOV Al, 00000000B       
    OUT DX, AL

	
	DEC DI                  ;TEMPORARY VARIABLE, DI-- FOR MAINLOOP
	MOV CX, DI
	

LOOP MAINLOOP

    RET
START ENDP


DELAY PROC                  ;DELAY CODE
    MOV CX, 62H
	DL1: LOOP DL1

    RET
DELAY ENDP    




CSEG ENDS 

END    START  