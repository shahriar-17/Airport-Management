-- TRIGGER 1

CREATE OR REPLACE TRIGGER ResignedEmployees
BEFORE DELETE
ON EMPLOYEES
FOR EACH ROW 
DECLARE
  A_ID NUMBER(5);
	A_First_Name VARCHAR2(50);
	A_Last_Name VARCHAR2(50);
	A_Salary VARCHAR2(10);
	A_Email NUMBER(15);
	A_Address VARCHAR2(50);
BEGIN 
  A_ID := :OLD.ID;
	A_First_Name := :OLD.First_Name;
	A_Last_Name := :OLD.Last_Name;
	A_Salary := :OLD.Salary;
	A_Email := :OLD.Email;
	A_Address := :OLD.Address;
	INSERT INTO DeletedEmployees VALUES(A_ID,A_First_Name,A_Last_Name,A_Salary,A_Email,A_Address);
END;
/

DELETE FROM EMPLOYEES WHERE ID = 16;

-- TRIGGER 2

CREATE OR REPLACE TRIGGER MAKE_ADMIN
AFTER UPDATE 
ON Employees
FOR EACH ROW
WHEN (NEW.Salary >= 1000000)
BEGIN
   INSERT INTO Admins (ID,First_Name,Last_Name,Salary,Email,Address) VALUES (:NEW.ID, :NEW.First_Name,:NEW.Last_Name,:NEW.Salary,:NEW.Email,:NEW.Address);
  
END;
/

-- TRIGGER 3

CREATE OR REPLACE TRIGGER Registration
AFTER INSERT
ON Passenger
FOR EACH ROW 
DECLARE
  A_ID NUMBER(5);
	A_First_Name VARCHAR2(50);
	A_Last_Name VARCHAR2(50);
	A_Age NUMBER(10);
	A_ NUMBER(15);
	A_Address VARCHAR2(50);
BEGIN 
  A_ID := :OLD.ID;
	A_First_Name := :NEW.First_Name;
	A_Last_Name := :NEW.Last_Name;
	A_Age := :NEW.Age;
	A_Phone_Number := :NEW.Phone_Number;
	A_Address := :NEW.Address;
	INSERT INTO Passenger VALUES(A_ID,A_First_Name,A_Last_Name,A_Age,A_Phone_Number,A_Address);
END;
/

