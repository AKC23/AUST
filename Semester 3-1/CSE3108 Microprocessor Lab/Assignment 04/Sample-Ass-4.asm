DSEG    SEGMENT 'DATA' 
       
LP   DB 1 

DOTS DB 00000001B, 00000011B, 00000111B, 00001111B, 00011111B, 00111111B, 01111111B
        
SVNS DB 00000010B, 00000110B, 00000001B, 00100001B, 01100001B, 01100101B, 01101101B

DSEG    ENDS

SSEG    SEGMENT STACK   'STACK'
        DW      100h    DUP(?)
SSEG    ENDS

CSEG    SEGMENT 'CODE'

   
    
START   PROC    FAR

 	PUSH    DS
 	MOV     AX, 0
 	PUSH    AX

	MOV     AX, DSEG
 	MOV     DS, AX
 	MOV     ES, AX


MAINLOOP:

	MOV DX, 2070H	 
    MOV Al, 00001100B 
    OUT DX, AL 
              
              
    MOV SI, 0
    MOV CX, 2          
    
        
STEP1:
 
    MOV BX, CX
    MOV DX, 2000H 
    MOV AL, DOTS[SI]
    OUT DX, AL

    MOV DX, 2030H
    MOV AL, SVNS[SI]
    OUT DX, AL
    
    INC SI
        
	MOV CX, 02FH 
    L1:LOOP L1 
    
    MOV CX, BX             
    LOOP STEP1
 
    MOV CX, 5
    
STEP2:
    
    MOV BX, CX

    MOV DX, 2000H 
    MOV AL, DOTS[SI]
    OUT DX, AL
               
    MOV DX, 2031H
    MOV AL, SVNS[SI]
    OUT DX, AL
    
    INC SI
    
	MOV CX, 02FH 
    L2: LOOP L2 

    MOV CX, BX
    
    LOOP STEP2

    
    MOV CX, 6
    MOV DX,2001H            
 
STEP3:
    
    MOV BX, CX 
    MOV AL,01000000B
    OUT DX, AL
    
	MOV CX, 02FH 
    L3: LOOP L3
    
    INC DX
    
    MOV CX, BX
    LOOP STEP3


    MOV CX, 6
    DEC DX
    
STEP4:
    
    MOV BX, CX  
    
    SHR AL, 1
    ADD AL, 01000000B
    OUT DX, AL
    
    MOV CX, 02FH 
    L4:LOOP L4
    
    
    MOV CX, BX
    LOOP STEP4
     
        
    DEC DX
    MOV CX, 5
 
STEP5:

    
    MOV BX, CX
    MOV AL,01000001B
    OUT DX, AL
    
    DEC DX
    
	MOV CX, 02FH 
    L5:LOOP L5
    
    MOV CX, BX
    LOOP STEP5 


    INC DX
    MOV CX, 5
 
STEP6:

    
    MOV BX, CX
    MOV AL,01000101B
    OUT DX, AL
    
    INC DX
    
	MOV CX, 02FH 
    L6:LOOP L6
    
    MOV CX, BX
    LOOP STEP6 
    
    
    MOV CX, 4
    MOV DX, 2002H
    MOV AL, 00000011B
STEP7:
    
    MOV BX, CX  
    
    SHL AL, 1
    ADD AL, 01000001B
    OUT DX, AL
    
    MOV CX, 02FH 
    L7:LOOP L7
    
    
    MOV CX, BX
    LOOP STEP7
    

    MOV DX, 2070H	 
    MOV Al, 00000000B 
    OUT DX, AL
    
        
    MOV AL, 00000000B
    MOV CX, 7
    MOV DX, 2000H  
    
CLR1:
    
    OUT DX, AL
    INC DX
    
    LOOP CLR1
    
    MOV CX, 2
    MOV DX, 2030H
CLR2:

    OUT DX, AL
    INC DX
    LOOP CLR2
     
 	MOV CX, 02FH 
    L8:LOOP L8
    
    ADD LP, 1
    CMP LP, 5

JBE MAINLOOP
         
	RET
START   ENDP

CSEG    ENDS 

        END    START