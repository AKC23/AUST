TITLE   8086 Code Template (for EXE file)

;       AUTHOR          emu8086
;       DATE            ?
;       VERSION         1.00
;       FILE            ?.ASM

; 8086 Code Template

; Directive to make EXE output:
       #MAKE_EXE#

DSEG    SEGMENT 'DATA'

DOT     DB	01H,01H,04H,01H,43H,01H,53H,01H,5BH,01H,03H,07H,0FH,1FH,3FH,7FH ;upto T in ss
        DB  01H,01H,03H,21H,07H,31H,0FH,39H,1FH,3DH,3FH,7DH,7FH,02H,04H,02H,01H,03H,07H,0FH,1FH,3FH,7FH ;upto M is ss
        DB  01H,01H,05H,01H,03H,02H,43H,06H,53H,0EH,5BH,1EH,3EH,7EH,01H,02H,06H,0EH,1EH,3EH,7EH,09H,09H,09H; upto A in ss
        DB  01H,20H,01H,21H,01H,23H,01H,27H,01H,03H,07H,0FH,1FH,3FH,7FH,41H,41H,7FH,41H,41H ;upto I in dot
        DB  02H,01H,07H,01H,03H,01H,43H,01H,53H,02H,5BH,06H,09H,09H,09H,12H,32H,49H,49H,49H,26H    ;S in dot 
        DB  01H,40H,01H,42H,01H,43H,01H,63H,01H,67H,03H,6FH,07H,7FH,0FH,1FH,3FH,7FH,41H,41H,7FH,41H,41H ;upto I in dot
        DB  01H,01H,01H,03H,02H,43H,06H,47H,0EH,4FH,1EH,3EH,7EH,01H,02H,06H,0EH,1EH,3EH,7EH,09H,09H,09H; upto A in ss
        DB  01H,20H,03H,21H,07H,23H,0FH,27H,1FH,3FH,7FH,01H,02H,04H,08H,14H,22H,41H   ;K in dot

PORT    DW  2000h, 2030H, 2070H, 2001h, 2030H, 2002h, 2030H, 2003h, 2030H, 2004h, 2002h, 2002h, 2002h, 2002h, 2002h, 2002h  ;upto T in ss
        DW  2005h, 2031H, 2005h, 2031H, 2005h, 2031H, 2005h, 2031H, 2005h, 2031H, 2005h, 2031H, 2005h, 2006h, 2007H, 2008H, 2009H, 2009H, 2009H, 2009H, 2009H, 2009H, 2009H   ;upto M  is ss
        DW  200Ch, 2032H, 2070H, 200Bh, 2032H, 200Ah, 2032H, 200Ah, 2032H, 200Ah, 2032H, 200Ah, 200Ah, 200Ah, 200Dh, 200Eh, 200Eh, 200Eh, 200Eh, 200Eh, 200Eh, 200BH, 200CH, 200DH   ;upto A in ss
        DW  200FH, 2033H, 2010H, 2033H, 2011H, 2033H, 2012H, 2033H, 2013H, 2011H, 2011H, 2011H, 2011H, 2011H, 2011H, 200FH, 2010H, 2011H, 2012H, 2013H  ;upto I in dot
        DW  2018h, 2034H, 2070H, 2017h, 2034H, 2016h, 2034H, 2015h, 2034H, 2014h, 2034H, 2014h, 2015h, 2016h, 2017h, 2018h, 2018h, 2017h, 2016h, 2015h, 2014h ;S in dot
        DW  2019H, 2035H, 201AH, 2035H, 201BH, 2035H, 201CH, 2035H, 201DH, 2035H, 201BH, 2035H, 201BH, 2035H, 201BH, 201BH, 201BH, 201BH, 2019H, 201AH, 201BH, 201CH, 201DH  ;upto I in dot
        DW  2020h, 2036H, 201Fh, 2036H, 201Eh, 2036H, 201Eh, 2036H, 201Eh, 2036H, 201Eh, 201Eh, 201Eh, 2021h, 2022h, 2022h, 2022h, 2022h, 2022h, 2022h, 201FH, 2020H, 2021H;UPTO A 
        DW  2023h, 2037H, 2023h, 2037H, 2023h, 2037H, 2023h, 2037H, 2023h, 2023h, 2023h, 2027h, 2026h, 2025h, 2024H, 2025H, 2026H, 2027H   ;upto K in dot

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

SSD     DB 5BH,7DH,5BH,27H,5BH,7FH,4FH,27H  

COUNT   DW 2030H,2031H,2032H,2033H,2034H,2035H,2036H,2037H 

FLAG    DW 0

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
    ;/////////////////////////////////PRINT DOT AS WE WRITE//////////////////////////////////

MAIN:	
	
	INC BX
	MOV DI, 0
	MOV SI, 0


	MOV CX, 170 

NEXT: 
    MOV DX, PORT[DI]
	MOV AL,DOT[SI]
	OUT DX,AL
	
	PUSH CX 
	MOV CX, 26H  ; DELAY
    L: LOOP L 
    
    POP CX
	
	INC SI
	ADD DI,2  ; WORD ARRAY INCREMENTED

	LOOP NEXT 
	
	;scroll
	MOV DI,0
	
	;///////////////////////////////////////PRINT SCROLL///////////////////////////////////////
    
 LOOP1:  
    MOV CX,40 
    MOV DX,2027h
    CMP DI,1600
    JAE CLE1
    
NEXT1:
    MOV AL,SCL[DI]
    OUT DX,AL
    DEC DX
    INC DI 
    CMP DX,2000h
    JB LOOP1
    LOOP NEXT1

	;/////////////////////////////////////////////CLEAR SSD AND LED///////////////////////////////////
	 
CLE1: 
      MOV AL,0H
    MOV DX,2030H
    MOV CX,8
    DEL_SSD:
    
    OUT DX,AL
    INC DX
    LOOP DEL_SSD 
    
    MOV DX,2070H
    OUT DX,AL
    
    PUSH CX
    
     MOV CX, 26H
     L3: LOOP L3
     
    POP CX
    
    ;////////////////////////////////////// PRINT SCROLL//////////////////////////////////////// 

	
	;scroll 
	
	
MAINLOOP:
    MOV DI,0
	MOV SI,0
	MOV FLAG,0 
	INC BX
    
 LOOP2:  
    MOV CX,40 
    MOV DX,2027h
    CMP DI,1600
    JAE CLE 
    
    ;//////////////////////////////////PRINT SCROLL////////////////////////////////////
    
NEXT2:
    MOV AL,SCL[DI]
    OUT DX,AL
    DEC DX
    INC DI
    CMP SI,7  ; FOR PRINTING SSD VALUES
    JBE P_SSD
    CMP SI,7
    JA P_SCL  ;IF SI GRATER THAN 7 THEN ONLY SCROLL
    
    ;////////////////////////////////PRINT SSD//////////////////////////////////////
    
  P_SSD:
    PUSH DX
    PUSH DI
    MOV DI, FLAG   ;SAVING THE VALUE FOR COUNT ELEMENT
    MOV DX,COUNT[DI]
    MOV AL,SSD[SI]
    OUT DX,AL
    
    INC SI 
    ADD DI,2
    MOV FLAG,DI
    MOV DX,2070H  ; PRINT LED
    MOV AL,07H
    OUT DX,AL
    POP DI
    POP DX
    
   P_SCL: 
    CMP DX,2000h
    JB LOOP2
    LOOP NEXT2 
    
    ;///////////////////////////////CLEAR SSD AND LED////////////////////////////////
     
    
CLE: 
      MOV AL,0H
    MOV DX,2030H
    MOV CX,8
    DEL_SSD1:
    
    OUT DX,AL
    INC DX
    LOOP DEL_SSD1 
    
    MOV DX,2070H
    OUT DX,AL
    
    PUSH CX
    
     MOV CX, 26H
     L4: LOOP L4
     
    POP CX 
    
    CMP BX,5
    JB  MAINLOOP 
    
    ;////////////////////////////////////CLEAR DOT///////////////////////////////
    
    MOV AL,0H
    MOV DX,2000H
    MOV CX,40
    DEL_DOT:
    
    OUT DX,AL
    INC DX
    LOOP DEL_DOT 
	          

; return to operating system:
    RET
START   ENDP       

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.





