
;Name ->  Ahmadul Karim Chowdhury 
;ID ->    190104037
           
;DOT: 0 A 3 K 7           
;SSD: 0 3 7
;LED: Red2


DSEG   SEGMENT 'DATA' 

DOT_SCROLL DB 03H,05H,79H,01H,01H,41H,22H,14H,08H,7FH,36H,49H,49H,49H,22H,7EH,09H,09H,09H,7EH,3EH,41H,41H,41H,3EH
              ;1   2   3  4    5   6   7   8   9  10   11 12  13  14  15  16  17  18  19  20  21  22  23  24  25

LIMIT DB 0
        
DSEG ENDS

SSEG SEGMENT STACK   'STACK'
     DW      100H    DUP(?)
SSEG ENDS

CSEG SEGMENT 'CODE'

START PROC    FAR
    
 	PUSH DS  
 	
 	MOV AX,DSEG
 	MOV DS,AX
 	MOV ES,AX
 	
 	MOV CX, 0
 	MOV DI, 0               ;DI -> LOOP COUNTER
 	 	
MAINLOOP:
    
    MOV DX, 2070H	        ;LED RED2
    MOV AL, 00001000B 
    OUT DX, AL
    
    MOV DX, 2001H
 	MOV AL, 00000001B
 	OUT DX,AL
 	
 	MOV DX, 2002H
 	MOV AL, 00000001B
 	OUT DX,AL
 	
 	MOV DX, 2003H
 	MOV AL, 00000001B
 	OUT DX,AL
 	                        
 	MOV DX,2030H            ;SSD 0 START
    MOV AL,00000001B
    OUT DX,AL
    
    CALL DELAY              ;CALLING DELAY CODE
    
    MOV DX,2030H            ;SSD 0 START
    MOV AL,00000011B
    OUT DX,AL
    
    MOV DX, 2004H
 	MOV AL, 00000010B
 	OUT DX,AL
 	
 	MOV DX, 2004H
 	MOV AL, 00000110B
 	OUT DX,AL
 	
 	MOV DX, 2004H
 	MOV AL, 00001110B
 	OUT DX,AL
 	
 	MOV DX, 2004H
 	MOV AL, 00011110B
 	OUT DX,AL
 	
 	MOV DX, 2004H
 	MOV AL, 00111110B
 	OUT DX,AL
 	
 	MOV DX,2030H            ;SSD 0 
    MOV AL,00000111B
    OUT DX,AL
    
    CALL DELAY              ;CALLING DELAY CODE 
    
    MOV DX, 2003H
 	MOV AL, 01000001B
 	OUT DX,AL
 	
 	MOV DX, 2002H
 	MOV AL, 01000001B
 	OUT DX,AL
 	
 	MOV DX, 2001H
 	MOV AL, 01000001B
 	OUT DX,AL
 	
 	MOV DX,2030H            ;SSD 0 
    MOV AL,00001111B
    OUT DX,AL
    
    CALL DELAY              ;CALLING DELAY CODE
    
    MOV DX,2030H            ;SSD 0 
    MOV AL,00011111B
    OUT DX,AL 
    
    MOV DX, 2000H
 	MOV AL, 00100000B
 	OUT DX,AL
 	
 	MOV DX, 2000H
 	MOV AL, 00110000B
 	OUT DX,AL
 	
 	MOV DX, 2000H
 	MOV AL, 00111000B
 	OUT DX,AL
 	
 	MOV DX, 2000H
 	MOV AL, 00111100B
 	OUT DX,AL
 	
 	MOV DX, 2000H
 	MOV AL, 00111110B
 	OUT DX,AL               ;DOT 0 DONE
 	
 	MOV DX,2030H            ;SSD 0 DONE
    MOV AL,00111111B
    OUT DX,AL               
    
    CALL DELAY              ;CALLING DELAY CODE
    
    MOV DX, 2007H           ;DOT A START
 	MOV AL, 00000001B
 	OUT DX,AL
    
    MOV DX,2031H            ;SSD 3 START
    MOV AL,00000001B
    OUT DX,AL
    
    MOV DX, 2006H
 	MOV AL, 00000001B
 	OUT DX,AL
    
    MOV DX,2031H            ;SSD 3 
    MOV AL,00000011B
    OUT DX,AL
    
    MOV DX, 2005H
 	MOV AL, 00000010B
 	OUT DX,AL
    
    MOV DX, 2005H
 	MOV AL, 00000110B
 	OUT DX,AL
 	
 	MOV DX, 2005H
 	MOV AL, 00001110B
 	OUT DX,AL 
 	
 	MOV DX, 2005H
 	MOV AL, 00011110B
 	OUT DX,AL
 	
 	MOV DX, 2005H
 	MOV AL, 00111110B
 	OUT DX,AL
 	    
    MOV DX, 2005H           
 	MOV AL, 01111110B
 	OUT DX,AL
    
    MOV DX,2031H            ;SSD 3 
    MOV AL,01000011B
    OUT DX,AL
    
 	MOV DX, 2008H
 	MOV AL, 00000001B
 	OUT DX,AL
 	
 	MOV DX,2031H            ;SSD 3 
    MOV AL,01000111B
    OUT DX,AL
 	
 	MOV DX, 2009H
 	MOV AL, 00000010B
 	OUT DX,AL
 	
 	MOV DX, 2009H
 	MOV AL, 00000110B
 	OUT DX,AL
 	
 	MOV DX, 2009H
 	MOV AL, 00001110B
 	OUT DX,AL
 	
 	MOV DX, 2009H
 	MOV AL, 00011110B
 	OUT DX,AL
 	
 	MOV DX, 2009H
 	MOV AL, 00111110B
 	OUT DX,AL
 	
 	MOV DX, 2009H
 	MOV AL, 01111110B
 	OUT DX,AL 
 	
 	MOV DX, 2006H
 	MOV AL, 00001001B
 	OUT DX,AL
 	
 	MOV DX, 2007H
 	MOV AL, 00001001B
 	OUT DX,AL
 	
 	MOV DX, 2008H
 	MOV AL, 00001001B
 	OUT DX,AL               ;DOT A DONE
 	
 	MOV DX,2031H            ;SSD 3 DONE 
    MOV AL,01001111B
    OUT DX,AL
 	
    CALL DELAY              ;CALLING DELAY CODE
    
    MOV DX, 200AH           ;DOT 3 START
 	MOV AL, 00000010B
 	OUT DX,AL
 	
 	MOV DX, 200BH
 	MOV AL, 00000001B
 	OUT DX,AL
 	
 	MOV DX, 200CH
 	MOV AL, 00000001B
 	OUT DX,AL
 	
 	MOV DX, 200DH
 	MOV AL, 00000001B
 	OUT DX,AL
 	
 	MOV DX,2032H            ;SSD 7 START
    MOV AL,00000001B
    OUT DX,AL
    
    CALL DELAY              ;CALLING DELAY CODE
    
    MOV DX,200EH
    MOV AL,00000010B
    OUT DX,AL
    
    MOV DX,200EH
    MOV AL,00000110B
    OUT DX,AL    
    
    MOV DX, 200DH
 	MOV AL, 00001001B
 	OUT DX,AL
    
    MOV DX, 200CH
 	MOV AL, 00001001B
 	OUT DX,AL
    
    MOV DX, 200BH
 	MOV AL, 00001001B
 	OUT DX,AL
    
    MOV DX,2032H            ;SSD 7 
    MOV AL,00000011B
    OUT DX,AL
    
    MOV DX, 200EH
    MOV AL, 00010110B
 	OUT DX, AL
    
    MOV DX, 200EH
    MOV AL, 00110110B
 	OUT DX, AL
 	
 	MOV DX, 200DH
 	MOV AL, 01001001B
 	OUT DX, AL
 	
 	MOV DX, 200CH
 	MOV AL, 01001001B
 	OUT DX, AL
 	
 	MOV DX, 200BH
 	MOV AL, 01001001B
 	OUT DX, AL
 	
 	MOV DX, 200AH
 	MOV AL, 00100010B
 	OUT DX, AL              ;DOT 3 DONE
 	  
    CALL DELAY              ;CALLING DELAY CODE 
    
    MOV DX,200FH            ;DOT K START
    MOV AL,00000001B
    OUT DX,AL
    
    MOV DX,2032H            ;SSD 7 DONE
    MOV AL,00000111B
    OUT DX,AL
    
    MOV DX,200FH
    MOV AL,00000011B
    OUT DX,AL
    
    MOV DX,200FH
    MOV AL,00000111B
    OUT DX,AL
    
    MOV DX,200FH
    MOV AL,00001111B
    OUT DX,AL
    
    MOV DX,200FH
    MOV AL,00011111B
    OUT DX,AL
    
    MOV DX,200FH
    MOV AL,00111111B
    OUT DX,AL
            
    
    MOV DX,200FH
    MOV AL,01111111B
    OUT DX,AL
    
    MOV DX, 2013H
 	MOV AL, 00000001B
 	OUT DX,AL
 	
 	MOV DX, 2012H
 	MOV AL, 00000010B
 	OUT DX,AL
 	
 	MOV DX, 2011H
 	MOV AL, 00000100B
 	OUT DX,AL
 	
 	MOV DX, 2010H
 	MOV AL, 00001000B
 	OUT DX,AL
 	 
 	MOV DX, 2011H
 	MOV AL, 00010100B
 	OUT DX,AL
 	
 	MOV DX, 2012H
 	MOV AL, 00100010B
 	OUT DX,AL
 	
 	MOV DX, 2013H
 	MOV AL, 01000001B
 	OUT DX,AL               ;DOT K DONE
    
    CALL DELAY              ;CALLING DELAY CODE  
    
    MOV DX, 2014H           ;DOT 7 START
 	MOV AL, 00000001B
 	OUT DX,AL
 	
 	MOV DX, 2015H
 	MOV AL, 00000001B
 	OUT DX,AL
 	
 	MOV DX, 2016H
 	MOV AL, 00000001B
 	OUT DX,AL
 	
 	MOV DX, 2017H
 	MOV AL, 00000001B
 	OUT DX,AL
 	
    
    MOV DX, 2018H
    MOV AL, 00000001B
    OUT DX,AL
    
    CALL DELAY              ;CALLING DELAY CODE 
    
    MOV DX, 2018H
    MOV AL, 00000011B
    OUT DX,AL
    
    MOV DX, 2017H
    MOV AL, 00000101B
    OUT DX,AL
    
    MOV DX, 2016H
    MOV AL, 00001001B
    OUT DX,AL
    
    MOV DX, 2016H
    MOV AL, 00011001B
    OUT DX,AL
    
    MOV DX, 2016H
    MOV AL, 00111001B
    OUT DX,AL
    
    MOV DX, 2016H
    MOV AL, 01111001B
    OUT DX,AL               ;DOT 7 END
    
    CALL DELAY              ;CALLING DELAY CODE
    CALL DELAY              ;CALLING DELAY CODE
                    
    MOV LIMIT, 0            ;25 SHIFT
    MOV SI, 25              ;FROM ARRAY 25TH ELEMENT
    
REPEAT:
    
    MOV DX, 2018H
    MOV CX, 26 
    DEC SI
    
    INC LIMIT               
    CMP LIMIT, 26           ;LIMIT >= 26
    JAE CLEAR0 
        
SCROLL: 
     
    MOV AL, DOT_SCROLL[SI]
    OUT DX, AL   
    
    INC SI
    DEC DX 
    
    CMP DX, 1FFFH
    JBE REPEAT
    
    CMP SI, 25
    JAE NEXT 
    LOOP SCROLL      
          
NEXT:
    MOV SI, 0
    LOOP SCROLL 


CLEAR0:
    
    CALL DELAY              ;CALLING DELAY CODE
    
    MOV DX, 2030H
    MOV AL, 00000000B
    OUT DX, AL
    
    MOV DX, 2031H
    MOV AL, 00000000B
    OUT DX, AL
    
    MOV DX, 2032H
    MOV AL, 00000000B
    OUT DX, AL
    
    MOV DX, 2070H	 
    MOV AL, 00000000B 
    OUT DX, AL
     
    MOV DX,2000H 
        
CLEAR1:
    MOV AL,00000000B
    OUT DX,AL
    INC CX
    INC DX
    CMP CX, 26
    JLE CLEAR1
    
    CALL DELAY              ;CALLING DELAY CODE
    
    MOV CX,0
    INC DI
    CMP DI,5

JL MAINLOOP
    
    CALL DELAY              ;CALLING DELAY CODE
CALL ENDING
    
START   ENDP


DELAY PROC                  ;DELAY CODE
    MOV CX, 50H
	DL1: LOOP DL1

    RET
DELAY ENDP 

ENDING PROC

CSEG ENDS 

END START