SET SERVEROUTPUT ON;
SET VERIFY OFF;

-------------BUILT-IN EXCEPTIONS-----------------


/*
DECLARE
	A money.taka%TYPE;
	
BEGIN
	
	SELECT taka into A from money;
	DBMS_OUTPUT.PUT_LINE('after select statement');

EXCEPTION
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
	
END;
/*/



/*
DECLARE
	A money.taka%TYPE;
	
BEGIN
	
	SELECT taka into A from money where id=5;

EXCEPTION
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
		
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	
	
END;
/
*/



/*
DECLARE
	A money.taka%TYPE;
	B NUMBER := 0;
	val number;
	
BEGIN
	
	SELECT taka into A from money where id=1;
	val:= A/B;

EXCEPTION
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
		
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('OTHER ERRORS FOUND');
	
END;
/
*/



/*
DECLARE
	A money.taka%TYPE;
	B NUMBER := 0;
	val number;
	
BEGIN
	
	SELECT taka into A from money where id=1;
	val:= A/B;

EXCEPTION
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
		
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	
	WHEN ZERO_DIVIDE THEN
		DBMS_OUTPUT.PUT_LINE('CANNOT DIVIDE BY ZERO');
	
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('OTHER ERRORS FOUND');
	
END;
/
*/



---------------USER DEFINED EXCEPTIONS----------
/*
DECLARE
	A money.taka%TYPE;
	B NUMBER := &X;
	val number;
	userDefException EXCEPTION;
	
BEGIN
	
	SELECT taka into A from money where id=1;
	
	IF B<0 THEN
		RAISE userDefException;
	END IF;
	val:= A/B;

EXCEPTION
	WHEN userDefException THEN
		DBMS_OUTPUT.PUT_LINE('DIVISOR IS NEGATIVE');
		
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
		
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	
	WHEN ZERO_DIVIDE THEN
		DBMS_OUTPUT.PUT_LINE('CANNOT DIVIDE BY ZERO');
	
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('OTHER ERRORS FOUND');
	
END;
/
*/




DECLARE
	A money.taka%TYPE;
	B NUMBER := &X;
	val number;
	userDefException EXCEPTION;
	
BEGIN
	
	SELECT taka into A from money where id=1;
	val:= A/B;
	IF B<0 THEN
		RAISE userDefException;
	END IF;
	

EXCEPTION
	WHEN userDefException THEN
		DBMS_OUTPUT.PUT_LINE('DIVISOR IS NEGATIVE');
		B:= B*(-1);
		val := A/B;
		DBMS_OUTPUT.PUT_LINE(val);
		
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
		
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	
	WHEN ZERO_DIVIDE THEN
		DBMS_OUTPUT.PUT_LINE('CANNOT DIVIDE BY ZERO');
	
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('OTHER ERRORS FOUND');
	
END;
/