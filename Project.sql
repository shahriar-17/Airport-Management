CREATE TABLE Passenger(
   ID NUMBER(5) NOT NULL,
	 First_Name VARCHAR2(50),
	 Last_Name VARCHAR2(50) NOT NULL,
	 Age NUMBER(5) NOT NULL,
	 Email VARCHAR2(50) NOT NULL,
	 Address VARCHAR2(50) NOT NULL,
	 PRIMARY KEY(ID)
);

CREATE TABLE LoginPsngr(
	ID NUMBER(5) PRIMARY KEY,
	Password VARCHAR2(50) NOT NULL,
	FOREIGN KEY(ID) REFERENCES Passenger(ID)
);

CREATE TABLE Employees(
  ID NUMBER(5) NOT NULL,
	First_Name VARCHAR2(50),
	Last_Name VARCHAR2(50) NOT NULL,
	Salary NUMBER(10) NOT NULL,
	Phone_Number NUMBER(15) NOT NULL,
	Address VARCHAR2(50) NOT NULL,
  PRIMARY KEY(ID)
);

CREATE TABLE Admins(
  ID NUMBER(5) NOT NULL,
	First_Name VARCHAR2(50),
	Last_Name VARCHAR2(50) NOT NULL,
	Salary NUMBER(10) NOT NULL,
	Phone_Number NUMBER(15) NOT NULL,
	Address VARCHAR2(50) NOT NULL,
	FOREIGN KEY(ID) REFERENCES Employees(ID)
);

CREATE TABLE LoginAsAdmin(
  ID NUMBER(5) PRIMARY KEY,
	Password VARCHAR2(50) NOT NULL,
	SecurityCode VARCHAR2(50) NOT NULL,
	FOREIGN KEY(ID) REFERENCES Employees(ID)
);


CREATE TABLE Airline(
  Flight_No NUMBER(5) NOT NULL,
	Name VARCHAR2(50) NOT NULL,
	ID NUMBER(5) NOT NULL,
	City VARCHAR2(50) NOT NULL,
	Capacity NUMBER(5) NOT NULL,
	Country VARCHAR2(50) NOT NULL,
	PRIMARY KEY(Flight_No)
);


CREATE TABLE Ticket(
   Flight_No NUMBER(5) PRIMARY KEY,
	 Source VARCHAR2(50) NOT  NULL,
	 Destination VARCHAR2(50) NOT NULL,
	 Flight_Time DATE NOT NULL,
	 Class VARCHAR2(50) NOT NULL,
	 FOREIGN KEY(Flight_No) REFERENCES Airline(Flight_No)
);

CREATE TABLE AirPlane(
   Name VARCHAR2(50) NOT NULL,
	 Capacity NUMBER(5),
	 Source VARCHAR2(50) NOT NULL,
	 Destination VARCHAR2(50) NOT NULL,
	 PRIMARY KEY(Name)
);

CREATE TABLE Location(
    TimeRange NUMBER(5) PRIMARY KEY,
		Place VARCHAR2(50) NOT NULL,
		FOREIGN KEY(Place) REFERENCES AirPlane(Name)
)

CREATE TABLE DeletedEmployees(

  ID NUMBER(5) NOT NULL,
	First_Name VARCHAR2(50) NOT NULL,
	Last_Name VARCHAR2(50) NOT NULL,
	Salary NUMBER(10) NOT NULL,
	Phone_Number NUMBER(15) NOT NULL,
	Address VARCHAR2(50) NOT NULL
);


SELECT * FROM admins;

CREATE OR REPLACE TRIGGER ResignedEmployees
BEFORE DELETE
ON EMPLOYEES
FOR EACH ROW 
DECLARE
  A_ID NUMBER(5);
	A_First_Name VARCHAR2(50);
	A_Last_Name VARCHAR2(50);
	A_Salary VARCHAR2(10);
	A_Phone_Number NUMBER(15);
	A_Address VARCHAR2(50);
BEGIN 
  A_ID := :OLD.ID;
	A_First_Name := :OLD.First_Name;
	A_Last_Name := :OLD.Last_Name;
	A_Salary := :OLD.Salary;
	A_Phone_Number := :OLD.Phone_Number;
	A_Address := :OLD.Address;
	INSERT INTO DeletedEmployees VALUES(A_ID,A_First_Name,A_Last_Name,A_Salary,A_Phone_Number,A_Address);
END;
/

DELETE FROM EMPLOYEES WHERE ID = 16;


CREATE OR REPLACE TRIGGER MAKE_ADMIN
AFTER UPDATE 
ON Employees
FOR EACH ROW
WHEN (NEW.Salary >= 1000000)
BEGIN
   INSERT INTO Admins (ID,First_Name,Last_Name,Salary,Phone_Number,Address) VALUES (:NEW.ID, :NEW.First_Name,:NEW.Last_Name,:NEW.Salary,:NEW.Phone_Number,:NEW.Address);
  
END;
/

UPDATE EMPLOYEES SET SALARY = 2082322 WHERE ID = 5;


CREATE OR REPLACE FUNCTION TOTAL_DEBIT(Code IN NUMBER)
RETURN NUMBER IS 
   debit NUMBER(10);
BEGIN
   SELECT SUM(SALARY) INTO  debit FROM Employees
	    WHERE ID = Code;
		
	 RETURN debit;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
	   RETURN -1;
  WHEN OTHERS THEN
	  RAISE;
END;
/



DECLARE 
  AMMOUNT NUMBER(10);
BEGIN
  AMMOUNT := TOTAL_DEBIT(5);
	DBMS_OUTPUT.PUT_LINE(AMMOUNT);
END;
/



	
   


		
  
    





