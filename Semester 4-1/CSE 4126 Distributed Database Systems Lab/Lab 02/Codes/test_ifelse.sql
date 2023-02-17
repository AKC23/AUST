SET SERVEROUTPUT ON;


------IF-ELSE---------
/*
DECLARE
	NUM int:=5; 
BEGIN
	IF MOD(NUM,2) = 0 THEN
		DBMS_OUTPUT.PUT_LINE('EVEN');
	
	ELSE 
		DBMS_OUTPUT.PUT_LINE('ODD');
	END IF;
	
END;
/
*/


-----------IF-ELSIF-ELSE---------
/*
DECLARE
	NUM int:=5; 
BEGIN
	IF MOD(NUM,3) = 0 THEN
		DBMS_OUTPUT.PUT_LINE('ZERO');
	ELSIF MOD(NUM,3) = 1 THEN
		DBMS_OUTPUT.PUT_LINE('ONE');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('TWO');
	END IF;
	
END;
/
*/



-----------IF-ELSIF-ELSE ALONG WITH DATABASE---------
/*
DECLARE
	NUM money.taka%TYPE; 
BEGIN
	select taka into NUM from money where id=1;
	IF MOD(NUM,3) = 0 THEN
		DBMS_OUTPUT.PUT_LINE('ZERO');
	ELSIF MOD(NUM,3) = 1 THEN
		DBMS_OUTPUT.PUT_LINE('ONE');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('TWO');
	END IF;
	
END;
/
*/



-----------CASE-WHEN-ELSE---------------
/*

DECLARE
	NUM money.taka%TYPE; 
BEGIN
	select taka into NUM from money where id=1;
	CASE
		WHEN MOD(NUM,3) = 0 THEN
			DBMS_OUTPUT.PUT_LINE('ZERO');
		WHEN MOD(NUM,3) = 1 THEN
			DBMS_OUTPUT.PUT_LINE('ONE');
		ELSE
			DBMS_OUTPUT.PUT_LINE('TWO');
	
	END CASE;
	
END;
/


*/


-----------CASE-WHEN-ELSE: DIFFERENT FORMAT---------------
/*
DECLARE
	NUM money.taka%TYPE; 
BEGIN
	select taka into NUM from money where id=1;
	CASE MOD(NUM,3)
		WHEN 0 THEN
			DBMS_OUTPUT.PUT_LINE('ZERO');
		WHEN 1 THEN
			DBMS_OUTPUT.PUT_LINE('ONE');
		ELSE
			DBMS_OUTPUT.PUT_LINE('TWO');
	
	END CASE;
	
END;
/
*/