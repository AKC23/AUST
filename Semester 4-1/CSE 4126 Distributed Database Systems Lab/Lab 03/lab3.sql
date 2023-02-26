clear screen;
SET SERVEROUTPUT ON;

CREATE OR REPLACE Procedure 
inOUTParam(A IN OUT money.id%type)
IS 

SET VERIFY OFF;



BEGIN
	DBMS_output.put_line(A);
	A := 10;	
END inOUTParam;



DECLARE
	NUM MONEY.ID%TYPE;
	
BEGIN
	NUM := 2;
	inOUTParam(NUM);
	DBMS_output.put_line(NUM);
	
END;
/
