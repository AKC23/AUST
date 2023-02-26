SET SERVEROUTPUT ON;

--------executing procedure from main--------

BEGIN
	sampleProcedure;
END;
/



--------executing function from main--------
/*
DECLARE
	NUM number;

BEGIN
	NUM := inParamFunction(10);
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/
*/


--------executing procedure from main--------
/*
BEGIN
	myproc;
END;
/
*/


/*

DECLARE
	NUM number;

BEGIN
	NUM := mytest;
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/

*/