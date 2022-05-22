TITLE   8086 Code Template (for EXE file)

;       AUTHOR          emu8086
;       DATE            ?
;       VERSION         1.00
;       FILE            ?.ASM

; 8086 Code Template

; Directive to make EXE output:
       #MAKE_EXE#

DSEG    SEGMENT 'DATA'

Dots    DB	01H,01H,01H,01H,01H,03H,07H,0FH,1FH,3FH,7FH ;upto T in ss
        DB  01H,03H,07H,0FH,1FH,3FH,7FH,02H,04H,02H,01H,03H,07H,0FH,1FH,3FH,7FH ;upto M is ss
        DB  01H,01H,02H,06H,0EH,1EH,3EH,7EH,01H,02H,06H,0EH,1EH,3EH,7EH,09H,09H,09H; upto A in ss
        DB  01H,01H,01H,01H,01H,03H,07H,0FH,1FH,3FH,7FH,41H,41H,7FH,41H,41H ;upto I in dot
        DB  02H,01H,01H,01H,02H,06H,09H,09H,09H,12H,32H,49H,49H,49H,26H    ;S in dot 
        DB  01H,01H,01H,01H,01H,03H,07H,0FH,1FH,3FH,7FH,41H,41H,7FH,41H,41H ;upto I in dot
        DB  01H,01H,02H,06H,0EH,1EH,3EH,7EH,01H,02H,06H,0EH,1EH,3EH,7EH,09H,09H,09H; upto A in ss
        DB  01H,03H,07H,0FH,1FH,3FH,7FH,01H,02H,04H,08H,14H,22H,41H   ;K in dot

Ports   DW  2000h, 2001h, 2002h, 2003h, 2004h,, 2002h, 2002h, 2002h, 2002h, 2002h, 2002h  ;upto T in ss
        DW  2005h, 2005h, 2005h, 2005h, 2005h, 2005h, 2005h, 2006h, 2007H, 2008H, 2009H, 2009H, 2009H, 2009H, 2009H, 2009H, 2009H   ;upto M  is ss
        DW  200Ch, 200Bh, 200Ah, 200Ah, 200Ah, 200Ah, 200Ah, 200Ah, 200Dh, 200Eh, 200Eh, 200Eh, 200Eh, 200Eh, 200Eh, 200BH, 200CH, 200DH   ;upto A in ss
        DW  200FH, 2010H, 2011H, 2012H, 2013H, 2011H, 2011H, 2011H, 2011H, 2011H, 2011H, 200FH, 2010H, 2011H, 2012H, 2013H  ;upto I in dot
        DW  2018h, 2017h, 2016h, 2015h, 2014h, 2014h, 2015h, 2016h, 2017h, 2018h, 2018h, 2017h, 2016h, 2015h, 2014h ;S in dot
        DW  2019H, 201AH, 201BH, 201CH, 201DH, 201BH, 201BH, 201BH, 201BH, 201BH, 201BH, 2019H, 201AH, 201BH, 201CH, 201DH  ;upto I in dot
        DW  2020h, 201Fh, 201Eh, 201Eh, 201Eh, 201Eh, 201Eh, 201Eh, 2021h, 2022h, 2022h, 2022h, 2022h, 2022h, 2022h, 201FH, 2020H, 2021H;UPTO A 
        DW  2023h, 2023h, 2023h, 2023h, 2023h, 2023h, 2023h, 2027h, 2026h, 2025h, 2024H, 2025H, 2026H, 2027H   ;upto K in dot

SCL 	DB  01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h, 09h ,09h, 7Eh, 7Fh, 02h, 04h, 02h, 7Fh, 01h, 01h, 7Fh, 01h 
        DB  01H, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h, 09h ,09h, 7Eh, 7Fh, 02h, 04h, 02h, 7Fh, 01h, 01h, 7Fh
        DB  7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h, 09h ,09h, 7Eh, 7Fh, 02h, 04h, 02h, 7Fh, 01h, 01h  
        DB  01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h, 09h ,09h, 7Eh, 7Fh, 02h, 04h, 02h, 7Fh, 01h 
        DB  01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h, 09h ,09h, 7Eh, 7Fh, 02h, 04h, 02h, 7Fh  
        DB  7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h, 09h ,09h, 7Eh, 7Fh, 02h, 04h, 02h  
        DB  02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h, 09h ,09h, 7Eh, 7Fh, 02h, 04h
        DB  04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h, 09h ,09h, 7Eh, 7Fh, 02h 
        DB  02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h, 09h ,09h, 7Eh, 7Fh
        DB  7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h, 09h ,09h, 7Eh
        
        DB  7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h, 09h ,09h
        DB  09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h, 09h 
        DB  09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7Eh, 09h
        DB  09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h, 7EH
        DB  7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h, 41h
        DB  41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh, 41h
        DB  41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h, 7Fh
        DB  7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h, 41h
        DB  41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h, 41h 
        DB  41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h, 26h
        
        DB  26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h, 49h
        DB  49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h, 49h
        DB  49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h, 49h
        DB  49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h, 32h
        DB  32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h, 41h
        DB  41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh, 41h 
        DB  41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h, 7Fh
        DB  7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h, 41h
        DB  41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh, 41h
        DB  41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h, 7Eh
        
        DB  7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h ,09h
        DB  09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h, 09h 
        DB  09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh, 09h
        DB  09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh, 7Eh
        DB  7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h, 7Fh
        DB  7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h, 08h 
        DB  08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h, 14h 
        DB  14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h, 22h 
        DB  22H, 14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h, 41h 
        DB  41H, 22H, 14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h, 01h
        
        DB  01H, 41H, 22H, 14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh, 01h
        DB  01H, 01H, 41H, 22H, 14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7Fh
        DB  7FH, 01H, 01H, 41H, 22H, 14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H, 01H
        DB  01H, 7FH, 01H, 01H, 41H, 22H, 14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH, 01H
        DB  01H, 01H, 7FH, 01H, 01H, 41H, 22H, 14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H, 7FH
        DB  7FH, 01H, 01H, 7FH, 01H, 01H, 41H, 22H, 14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H, 02H 
        DB  02H, 7FH, 01H, 01H, 7FH, 01H, 01H, 41H, 22H, 14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H, 04H 
        DB  04H, 02H, 7FH, 01H, 01H, 7FH, 01H, 01H, 41H, 22H, 14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH, 02H 
        DB  02H, 04H, 02H, 7FH, 01H, 01H, 7FH, 01H, 01H, 41H, 22H, 14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH, 7FH 
        DB  7FH, 02H, 04H, 02H, 7FH, 01H, 01H, 7FH, 01H, 01H, 41H, 22H, 14H, 08H, 7FH, 7EH, 09H, 09H, 09H, 7EH, 41H, 41H, 7FH, 41H, 41H, 32H, 49H, 49H, 49H, 26H, 41H, 41H, 7FH, 41H, 41H, 7EH, 09H, 09H, 09H, 7EH



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
    	
    MOV BX, 0 

MAIN:	
	
	INC BX
	MOV DI, 0
	MOV SI, 0


	MOV CX, 125 

NEXT: 
    MOV DX, Ports[DI]
	MOV AL,Dots[SI]
	OUT DX,AL
	
	PUSH CX 
	MOV CX, 26H
    L: LOOP L 
    
    POP CX
	
	INC SI
	ADD DI,2

	LOOP NEXT
	
	
	;scroll
	MOV DI,0
    
 L1:  
    MOV CX,40 
    MOV DX,2027h
    CMP DI,1600
    JAE CLE

    
NEXT2:
    MOV AL,SCL[DI]
    OUT DX,AL
    DEC DX
    INC DI 
    CMP DX,2000h
    JB L1
    LOOP NEXT2
     
    
CLE: 
      MOV AL,0
    MOV DX,2030H
    MOV CX,3
    DEL_SSD1:
    
    OUT DX,AL
    INC DX
    LOOP DEL_SSD1 
    
    MOV DX,2070H
    OUT DX,AL
    
    PUSH CX
    
     MOV CX, 26H
     L3: LOOP L3
     
    POP CX 
	
	MOV AL,0
    MOV DX,2000H
    MOV CX,40
    DEL_DOT:
    
    OUT DX,AL
    INC DX
    LOOP DEL_DOT 
    
    CMP BX,5
    JB  MAIN
	          

; return to operating system:
    RET
START   ENDP       

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.





