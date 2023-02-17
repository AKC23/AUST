SET SERVEROUTPUT ON;
--ANONYMOUS BLOCK
/*
BEGIN
	DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
END;
/
*/



--NULL BLOCK
/*
BEGIN
	NULL;
END;
/
*/




BEGIN
	insert into money values(4,'D',130);
END;
/

SELECT * FROM MONEY;




-- THIS WILL GIVE ERROR, because data isn't getting stored anywhere
/*
BEGIN
	SELECT * FROM MONEY;
END;
/
*/



-- THIS WILL GIVE ERROR, because data isn't getting stored anywhere
/*
BEGIN
	SELECT name, taka FROM MONEY WHERE id=4;
END;
/
*/



/*
DECLARE
	t_name varchar2(20);
	t_taka number;
BEGIN
	SELECT name, taka into t_name, t_taka FROM MONEY WHERE id=1;
	DBMS_OUTPUT.PUT_LINE(t_name);
	DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/
*/



------ANCHOR
/*
DECLARE
	t_name money.name%TYPE;
	t_taka money.taka%TYPE;
BEGIN
	SELECT name, taka into t_name, t_taka FROM MONEY WHERE id=1;
	DBMS_OUTPUT.PUT_LINE(t_name);
	DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/
*/



------------ASSIGNMENT OF VALUES
/*
DECLARE
	t_taka money.taka%TYPE;
BEGIN
	t_taka:=500;
	UPDATE money SET taka=t_taka where id = 1;
	DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/
commit;
SELECT * FROM money;
*/



--------INITIALIZATION
/*
DECLARE
	t_taka money.taka%TYPE:=700;
BEGIN
	UPDATE money SET taka=t_taka where id = 1;
	DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/
commit;
SELECT * FROM money;
*/