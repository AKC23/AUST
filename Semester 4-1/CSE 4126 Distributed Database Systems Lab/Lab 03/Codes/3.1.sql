SET SERVEROUTPUT ON;

DECLARE
  A money.id%TYPE;
  B money.taka%TYPE;
  
BEGIN
	FOR R IN (SELECT * FROM money) LOOP
		A := R.id;
		B := R.taka;
		DBMS_OUTPUT.PUT_LINE(A || ' ' || B);
		
		IF MOD(B, 2) = 0 THEN
			DBMS_OUTPUT.PUT_LINE(B || ' = EVEN');
		ELSE
			DBMS_OUTPUT.PUT_LINE(B || ' = ODD');
		END IF;
	END LOOP;
END;
/

