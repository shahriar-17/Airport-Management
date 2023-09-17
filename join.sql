-- QUERY 

SELECT * FROM EMPLOYEES WHERE SALARY < 100000
ORDER BY ID;

SELECT Price FROM TICKET WHERE Source = 'DHAKA' AND Destination = 'LONDON' AND Class = 'BUSINESS';

SELECT * FROM DELETEDEMPLOYEES
ORDER BY ID;

SELECT * FROM ADMINS
ORDER BY ID;

SELECT * FROM AIRPLANE;

-- PATH FIND 

SELECT l.Place 
FROM LOCATION l JOIN AIRPLANE a
ON(l.FLIGHT_NO = a.FLIGHT_NO)
WHERE a.SOURCE = 'DUBAI';

