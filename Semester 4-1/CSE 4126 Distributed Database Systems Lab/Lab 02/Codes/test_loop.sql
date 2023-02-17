SET SERVEROUTPUT ON;

-------------PL/SQL'S OWN LOOP--------
/*
DECLARE
	NUM int:=0; 
BEGIN
	LOOP
		NUM := NUM+1;
		DBMS_OUTPUT.PUT_LINE(NUM);
		IF NUM = 5 THEN
			EXIT;
		END IF;
	END LOOP;
	
END;
/

*/

---------------------PL/SQL'S OWN LOOP, EXIT WHEN------------

/*
DECLARE
	NUM int:=0; 
BEGIN
	LOOP
		NUM := NUM+1;
		DBMS_OUTPUT.PUT_LINE(NUM);
		EXIT WHEN NUM = 5;
	END LOOP;
	
END;
/

*/


--------------WHILE LOOP------------
/*
DECLARE
	NUM int:=0; 
BEGIN
	WHILE NUM<5
	LOOP
		NUM := NUM+1;
		DBMS_OUTPUT.PUT_LINE(NUM);
	END LOOP;
	
END;
/
*/



------------FOR LOOP-------------
/*
BEGIN
	FOR i IN 1..5 LOOP
		DBMS_OUTPUT.PUT_LINE(i);
	END LOOP;
	
END;
/
*/



/*
DECLARE
	NUM int:=5; 
BEGIN
	FOR i IN 1..NUM LOOP
		DBMS_OUTPUT.PUT_LINE(i);
	END LOOP;
	
END;
/
*/



-----------INSERT INTO TABLE USING LOOP-------------
/*
DECLARE
	NUM money.id%TYPE := 0; 
BEGIN
	SELECT COUNT(id) INTO NUM FROM MONEY;
	FOR i IN 1..5 LOOP
		NUM := NUM + 1;
		INSERT INTO money VALUES(NUM, 'D', 200);
	END LOOP;
	
END;
/

SELECT * FROM money;

*/

---------------USER INPUT------------------
/*
DECLARE
	A int := &x;
	B int := &y;
BEGIN
	DBMS_OUTPUT.PUT_LINE(A+B);
	
END;
/
*/



/*
SET VERIFY OFF;
DECLARE
	A int := &x;
	B int := &y;
BEGIN
	DBMS_OUTPUT.PUT_LINE(A+B);
	
END;
/
*/




------------WILL GIVE ERROR------------
/*
SET VERIFY OFF;
DECLARE
	A int := &x;
	B int := &y;
BEGIN
	DBMS_OUTPUT.PUT_LINE(x+y);
	
END;
/
*/
------------------------------


/*
SET VERIFY OFF;
DECLARE
	A int := &x;
	B int := &x;
BEGIN
	DBMS_OUTPUT.PUT_LINE(A+B);
	
END;
/
*/



------------CHARACTER INPUT----------

SET VERIFY OFF;
DECLARE
	A VARCHAR2(20) := '&name';
	B VARCHAR2(20) := '&address';
BEGIN
	IF A = 'Fahim' THEN
		DBMS_OUTPUT.PUT_LINE('Person 1');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Person 2');
	end if;
END;
/

/*
SET VERIFY OFF;
DECLARE
	xinput char(10);
BEGIN
	DBMS_OUTPUT.PUT_LINE('hello');
	xinput:= &x;
END;
/


