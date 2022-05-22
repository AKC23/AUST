
 TITLE   8086 Code Template (for EXE file)

;       AUTHOR          emu8086
;       DATE            ?
;       VERSION         1.00
;       FILE            ?.ASM

; 8086 Code Template

; Directive to make EXE output:
       #MAKE_EXE#

DSEG    SEGMENT 'DATA'
   

DOT1	DB 30H,49H,49H,49H,3EH,7FH,02H,04H,02H,7FH,46H,49H,51H,61H,42H,01H,01H,7FH,01H,01H,3EH,41H,41H,41H,3EH;
	    
	    CON DB 0
	        

                                       
NUM        DB 01H,03H,07H,0FH,1FH,3FH,01H,03H,43H,53H,5BH,01H,21H,31H,39H,3DH,7DH

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
  
  MOV CX,0 
  MOV BX,0 
    
  MOV DX,2001H
  MOV AL,01H
  OUT DX,AL
  
  MOV DX,2030H
  MOV AL,01H 
  OUT DX,AL
  
  MOV DX,2070H
  MOV AL,02H 
  OUT DX,AL
  
  MOV DX,2002H
  MOV AL,01H
  OUT DX,AL 
  
  MOV DX,2030H
  MOV AL,03H 
  OUT DX,AL
   
  MOV DX,2003H
  MOV AL,01H
  OUT DX,AL 
  
  MOV DX,2030H
  MOV AL,07H 
  OUT DX,AL
  
  MOV DX,2004H
  MOV AL,02H
  OUT DX,AL 
  
  MOV DX,2030H
  MOV AL,0FH 
  OUT DX,AL
  
  MOV DX,2004H
  MOV AL,06H
  OUT DX,AL 
  
  MOV DX,2030H
  MOV AL,1FH 
  OUT DX,AL
           
  MOV DX,2004H
  MOV AL,0EH
  OUT DX,AL
  
  MOV DX,2030H
  MOV AL,3FH 
  OUT DX,AL
  
  
  MOV DX,2004H
  MOV AL,1EH
  OUT DX,AL 
  
  MOV DX,2031H
  MOV AL,01H 
  OUT DX,AL
  
  MOV DX,2004H
  MOV AL,3EH
  OUT DX,AL 
  
  MOV DX,2031H
  MOV AL,03H 
  OUT DX,AL         
  
  MOV DX,2003H
  MOV AL,41H
  OUT DX,AL 
  
   MOV DX,2031H
  MOV AL,43H 
  OUT DX,AL 
 
  
  MOV DX,2002H
  MOV AL,41H
  OUT DX,AL 
  
   MOV DX,2031H
  MOV AL,53H 
  OUT DX,AL
  
  
  MOV DX,2001H
  MOV AL,41H
  OUT DX,AL 
            
   MOV DX,2031H
  MOV AL,5BH 
  OUT DX,AL
  
  
  MOV DX,2000H
  MOV AL,20H
  OUT DX,AL  
  
  
  MOV DX,2032H
  MOV AL,01H 
  OUT DX,AL
  
  MOV DX,2000H
  MOV AL,30H
  OUT DX,AL
  
   MOV DX,2032H
  MOV AL,21H 
  OUT DX,AL 
  
  
  MOV DX,2000H
  MOV AL,38H
  OUT DX,AL
  
  MOV DX,2032H
  MOV AL,31H 
  OUT DX,AL
  
  MOV DX,2000H
  MOV AL,3CH
  OUT DX,AL 
  
   MOV DX,2032H
  MOV AL,39H 
  OUT DX,AL
  
  MOV DX,2000H
  MOV AL,3EH
  OUT DX,AL ;0
  ;;;;;;;;;;;;;
  
   MOV DX,2032H
  MOV AL,3DH 
  OUT DX,AL
  
  MOV DX,2005H
  MOV AL,01H
  OUT DX,AL 
  
  MOV DX,2032H
  MOV AL,7DH 
  OUT DX,AL
  
  MOV DX,2006H
  MOV AL,01H
  OUT DX,AL 
  
  MOV DX,2007H
  MOV AL,01H
  OUT DX,AL 
  
  
  MOV DX,2008H
  MOV AL,01H
  OUT DX,AL 
  
  
  MOV DX,2009H
  MOV AL,01H
  OUT DX,AL 
  
  MOV DX,2007H
  MOV AL,03H
  OUT DX,AL 
  
  MOV DX,2007H
  MOV AL,07H
  OUT DX,AL 
  
  MOV DX,2007H
  MOV AL,0FH
  OUT DX,AL 
  
  
  MOV DX,2007H
  MOV AL,1FH
  OUT DX,AL 
  
  
  MOV DX,2007H
  MOV AL,3FH
  OUT DX,AL 
  
  MOV DX,2007H
  MOV AL,7FH
  OUT DX,AL 
  
  
  MOV DX,200AH
  MOV AL,02H
  OUT DX,AL
  
  MOV DX,200BH
  MOV AL,01H
  OUT DX,AL    
  
  MOV DX,200CH
  MOV AL,01H
  OUT DX,AL 
  
  MOV DX,200DH
  MOV AL,01H
  OUT DX,AL 
  
  MOV DX,200EH
  MOV AL,02H
  OUT DX,AL
  
  MOV DX,200EH
  MOV AL,06H
  OUT DX,AL  
  
  MOV DX,200DH
  MOV AL,09H
  OUT DX,AL
  
  MOV DX,200CH
  MOV AL,11H
  OUT DX,AL
  
  MOV DX,200BH
  MOV AL,21H
  OUT DX,AL
  
  MOV DX,200AH
  MOV AL,42H
  OUT DX,AL
  
  MOV DX,200BH
  MOV AL,61H
  OUT DX,AL
  
  MOV DX,200CH
  MOV AL,51H
  OUT DX,AL
  
  
  MOV DX,200DH
  MOV AL,49H
  OUT DX,AL
  
  MOV DX,200EH
  MOV AL,46H
  OUT DX,AL   
           
  MOV DX,200FH
  MOV AL,01H
  OUT DX,AL
  
  MOV DX,200FH
  MOV AL,03H
  OUT DX,AL
  
  MOV DX,200FH
  MOV AL,07H
  OUT DX,AL
  
  MOV DX,200FH
  MOV AL,0FH
  OUT DX,AL
  
  MOV DX,200FH
  MOV AL,1FH
  OUT DX,AL
  
  
  MOV DX,200FH
  MOV AL,3FH
  OUT DX,AL
  
  MOV DX,200FH
  MOV AL,7FH
  OUT DX,AL 
  
  
  MOV DX,2010H
  MOV AL,02H
  OUT DX,AL
  
  
  MOV DX,2011H
  MOV AL,04H
  OUT DX,AL
  
  
  MOV DX,2012H
  MOV AL,02H
  OUT DX,AL
  
  MOV DX,2013H
  MOV AL,01H
  OUT DX,AL
  
  MOV DX,2013H
  MOV AL,03H
  OUT DX,AL
  
  MOV DX,2013H
  MOV AL,07H
  OUT DX,AL
  
  MOV DX,2013H
  MOV AL,0FH
  OUT DX,AL
  
  MOV DX,2013H
  MOV AL,1FH
  OUT DX,AL
  
  
  MOV DX,2013H
  MOV AL,3FH
  OUT DX,AL
  
  MOV DX,2013H
  MOV AL,7FH
  OUT DX,AL 
  
  MOV DX,2017H
  MOV AL,01H
  OUT DX,AL
  
  MOV DX,2016H
  MOV AL,01H
  OUT DX,AL
  
  
  MOV DX,2015H
  MOV AL,01H
  OUT DX,AL  
  
  
  MOV DX,2014H
  MOV AL,02H
  OUT DX,AL
  
  MOV DX,2014H
  MOV AL,06H
  OUT DX,AL
  
  MOV DX,2014H
  MOV AL,0EH
  OUT DX,AL
  
  MOV DX,2014H
  MOV AL,1EH
  OUT DX,AL
  
  MOV DX,2014H
  MOV AL,3EH
  OUT DX,AL 
  
  MOV DX,2015H
  MOV AL,41H
  OUT DX,AL
  
  MOV DX,2016H
  MOV AL,41H
  OUT DX,AL 
  
  MOV DX,2017H
  MOV AL,41H
  OUT DX,AL
  
  MOV DX,2018H
  MOV AL,20H
  OUT DX,AL
  
  MOV DX,2018H
  MOV AL,30H
  OUT DX,AL
  
  MOV DX,2017H
  MOV AL,49H
  OUT DX,AL
  
  MOV DX,2016H
  MOV AL,49H
  OUT DX,AL
  
  MOV DX,2015H
  MOV AL,49H
  OUT DX,AL 
         
                         
    MOV CON, 0 
    MOV SI, 25            
 	INC BX
 	
REPEAT1:
    
    MOV DX, 2018H
    MOV CX, 26 
    DEC SI
    
    INC CON
    CMP CON,26
    JAE CLEAR0 
        
SCROLL: 

          
    MOV AL, DOT1[SI]
    OUT DX, AL   
    
    INC SI
    DEC DX
    
    CMP DX, 1FFFH
    JE REPEAT1
    
      
    CMP SI, 25
    JAE NEXT 
    LOOP SCROLL      
          
NEXT:
    MOV SI, 0
    LOOP SCROLL 


CLEAR0: 	
	MOV AL,0
    MOV DX,2030H
    MOV CX,3
    DEL_SSD:
    
    OUT DX,AL
    INC DX
    LOOP DEL_SSD 
    
    MOV DX,2070H
    OUT DX,AL
    
    
	
	
	
MAINLOOP2: 
    INC BX                 
    MOV CON, 0 
    MOV SI, 25            
    MOV DI, 0
 	
 	
REPEAT2:
    
    MOV DX, 2018H
    MOV CX, 26 
    DEC SI
    
    INC CON
    CMP CON,26
    JAE CLEAR1 
        
SCROLL1: 
    
 
    PUSH DX
            
    CMP DI,16
    JA PDOT
    
    CMP DI,5
    JBE PRINTNUM1
    
    CMP DI,10
    JBE PRINTNUM2
    
    CMP DI,16
   JBE PRINTNUM3
    
  PRINTNUM1:
    MOV DX,2030H
    MOV AL,NUM[DI]
    OUT DX,AL
    INC DI
 
    JMP PDOT 
  PRINTNUM2:
    MOV DX,2031H
    MOV AL,NUM[DI]
    OUT DX,AL
    INC DI
     
    JMP PDOT 
    
  PRINTNUM3:
    MOV DX,2032H
    MOV AL,NUM[DI]
    OUT DX,AL 
    INC DI
    
 PDOT: 

  MOV DX,2070H
  MOV AL,02H
  OUT DX,AL
     
    POP DX
     MOV AL, DOT1[SI]
    OUT DX, AL   
    
    INC SI
    DEC DX
    
    CMP DX, 1FFFH
    JE REPEAT2
    
      
    CMP SI, 25
    JAE NEXT1 
    LOOP SCROLL1      
          
NEXT1:
    MOV SI, 0
    LOOP SCROLL1 


CLEAR1: 	
	MOV AL,0
    MOV DX,2030H
    MOV CX,3
    DEL_SSD1:
    
    OUT DX,AL
    INC DX
    LOOP DEL_SSD1 
    
    MOV DX,2070H
    OUT DX,AL
    
    
	CMP BX,4
	JBE MAINLOOP2
	
	

; return to operating system:
    RET
START   ENDP

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.





