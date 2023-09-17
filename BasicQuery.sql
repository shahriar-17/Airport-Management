-- INSERT

INSERT INTO Passenger VALUES(812,'UDOY','FUAD',21,'ududoy@gmail.com','Shere_E_Bangle Hall,Buet');

INSERT INTO Passenger VALUES(813,'ANTOR','MUSABBIR',21,'antoreee@gmail.com','Shere_E_Bangle Hall,Buet');

INSERT INTO Employees VALUES(1001,'Taky','Shaharair',21,'taky@gmail.com','Shere_E_Bangle Hall,Buet');

INSERT INTO AirPort VALUES(14,'KORACHI AIRPORT',21,'KORACHI',500,'PAKISTAN');

INSERT INTO AirPlane VALUES(21,'AMERICAN AIRLINES',40,'DHAKA','WASHINGTON DC');

-- UPDATE

-- 1
UPDATE Passenger SET Age = 30 WHERE ID = 1;
-- 2 
UPDATE Employees SET Salary = 120000 WHERE Id = 29;
--3
UPDATE Ticket SET Price = 3000 WHERE Destination = 'NEWYORK' AND Class = 'BUSINESS';

-- DELETE

--1
DELETE FROM  Employees  WHERE Id = 24;

-- 2
DELETE FROM AirPort WHERE Id = 3;

-- 3 ( CASCADE DELETE)
DELETE FROM Employees WHERE Id = 6;-- In this case, a admin also deleted 
