SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X NUMBER PROMPT "Enter Last 3 digits of ID = "


DECLARE
	A NUMBER;
	B int;

BEGIN
	B := 0;
	BEGIN
		A := &X;
		B := MOD(A, 2);
	END;
	
	IF B = 0 THEN
		DBMS_OUTPUT.PUT_LINE('EVEN');
	ELSE
		DBMS_OUTPUT.PUT_LINE('ODD');
	END IF;
END;
/

/*
ACCEPT Y CHAR PROMPT "ENTER NAME = "

DECLARE
	C VARCHAR2(10);
BEGIN
	C := '&Y';
	DBMS_OUTPUT.PUT_LINE(C);
END;
/
*/