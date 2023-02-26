SET SERVEROUTPUT ON;

---------without params-------------

CREATE OR REPLACE FUNCTION sampleFunction
RETURN NUMBER
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(2);
	return 5; 
END sampleFunction;
/



DECLARE
	NUM NUMBER;
BEGIN
	NUM:=sampleFunction;
	DBMS_OUTPUT.PUT_LINE(num);
END;
/




-------------in param----------------
/*
CREATE OR REPLACE FUNCTION inParamFunction(A IN money.id%TYPE)
RETURN NUMBER
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);
	return A+10; 
END inParamFunction;
/



DECLARE
	NUM NUMBER;
BEGIN
	NUM:=inParamFunction(5);
	DBMS_OUTPUT.PUT_LINE(num);
END;
/
*/



-------------out param----------------
/*
CREATE OR REPLACE FUNCTION outParamFunction(A IN money.id%TYPE, B OUT money.id%TYPE)
RETURN NUMBER
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE('printing A: '|| A);
	B:=10;
	return A+20; 
END outParamFunction;
/



DECLARE
	NUM NUMBER;
	NUM2 NUMBER;
BEGIN
	NUM:=outParamFunction(5,NUM2);
	DBMS_OUTPUT.PUT_LINE('printing num: '|| NUM);
	DBMS_OUTPUT.PUT_LINE('printing num2: '|| NUM2);
END;
/
*/



-----------executing function using dual-----------
/*
CREATE OR REPLACE FUNCTION inParamFunction(A IN money.id%TYPE)
RETURN NUMBER
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);
	return A+10; 
END inParamFunction;
/

SELECT inParamFunction(20) from dual;
*/




----------declaring function with variables-----------
/*
CREATE OR REPLACE FUNCTION myfunc
RETURN money.taka%TYPE
IS

A money.id%TYPE;
B money.taka%TYPE;
C money.taka%TYPE;

BEGIN
	C := 0;
	FOR R IN (SELECT * FROM money) LOOP
		A := R.id;
		B := R.taka;
		C := C + B;
	END LOOP;
	return C;
END myfunc;
/
*/ 



----------declaring PROCEDURE with variables-----------
/*
CREATE OR REPLACE PROCEDURE myproc

IS

A money.id%TYPE;
B money.taka%TYPE;
C money.taka%TYPE;

BEGIN
	C := 0;
	FOR R IN (SELECT * FROM money) LOOP
		A := R.id;
		B := R.taka;
		C := C + B;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(C);
END myproc;
/
*/ 