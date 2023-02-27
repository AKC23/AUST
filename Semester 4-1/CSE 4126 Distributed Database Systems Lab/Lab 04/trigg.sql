SET SERVEROUTPUT ON;

/*
CREATE OR REPLACE TRIGGER HELLO 
AFTER INSERT 
ON MONEY

DECLARE

BEGIN
	DBMS_OUTPUT.PUT_LINE('hi');
END;
/
insert into money values(4,'D',150);
*/


/*
CREATE OR REPLACE TRIGGER HELLO2 
BEFORE INSERT 
ON MONEY
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('HELLO2');
END;
/
insert into money values(5,'E',160);
*/



CREATE OR REPLACE TRIGGER HELLO3 
AFTER INSERT OR DELETE 
ON MONEY
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Hi 3');
END;
/
delete from money where id=2;


delete from money where id=2;
--insert into money values(6,'F',170);