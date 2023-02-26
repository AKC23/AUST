SET SERVEROUTPUT ON;

---------------IN PARAMETER----------------------
/*
CREATE OR REPLACE PROCEDURE inParam(A IN money.id%TYPE)
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);

END inParam;
/

EXEC inParam(2);
EXEC inParam(4);
*/




---------------OUT PARAMETER-----------------------
/*
CREATE OR REPLACE PROCEDURE outParam(A IN money.id%TYPE,B OUT money.id%TYPE)
IS

BEGIN
	B:= 10;
	DBMS_OUTPUT.PUT_LINE(A);

END outParam;
/


DECLARE
	NUM money.id%TYPE;
BEGIN
	outParam(2,NUM);
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/
*/





------------------IN OUT PARAMETER----------------------
/*
CREATE OR REPLACE PROCEDURE inOutParam(A IN OUT money.id%TYPE)
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);
	A := 10;
END inOutParam;
/



DECLARE
	NUM money.id%TYPE;
BEGIN
	NUM := 2;
	inOutParam(NUM);
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/
*/

