CREATE TABLE Customer(
	
	CustomerID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	FirstName varchar (50) NOT NULL,
	LastName varchar (50) NOT NULL,
	CustomerAddress varchar (50) NOT NULL,
	City varchar (50) NOT NULL,
	Country varchar (50) NOT NULL
);

INSERT INTO CUSTOMER 
VALUES ('Amy', 'Johnson', '11000 Beecher', 'Joliet',  'USA'),
       ('Bill', 'Brown', '7312 Bettis Ave.', 'Pittsburg','USA'),
       ('Janna', 'Smith', '200 E. Elm Apt. #32', 'Sparks','USA'),
       ('Evette', 'LeBlanc', '207 Queens Quay West', 'Toronto','CA'),
       ('Drew', 'Brisco', '1690 Hollis Street', 'Ottawa','CA')
	  

CREATE TABLE CustomerOrder(
	
	OrderID int IDENTITY(101,1) NOT NULL PRIMARY KEY,
	OrderDate date NOT NULL,
	CustomerID int NOT NULL,
	Bill money NOT NULL
);


INSERT INTO CustomerOrder
VALUES  ('2019-01-13' , 3, 12.9500),
		('2019-01-12' , 5, 7.9500),
		('2019-01-05' , 2, 9.9500),
		('2019-01-07' , 1, 12.9500),
		('2019-01-09' , 5, 7.9500),
		('2019-01-04' , 1, 7.9500),
		('2019-01-04' , 5, 7.9500),
		('2019-01-06' , 2, 12.9500),
		('2019-01-07' , 3,  9.9500),
		('2019-01-08' , 3,  5.9500),
		('2018-11-11' , 9, 8.9500),
		('2018-12-12' , 8, 9.9500)
		
	   
CREATE TABLE Employee(
	
	EmployeeID int IDENTITY(500,1) NOT NULL PRIMARY KEY,
	EmployeeFirstName varchar (50) NOT NULL,
	EmployeeLastName varchar (50) NOT NULL,
	EmployeeAddress varchar (50) NOT NULL,
	EmployeeCity varchar (50) NOT NULL,
	EmployeeSalary decimal(7,2) NOT NULL,
	EmployeeDept varchar (50) NOT NULL
);


INSERT INTO Employee
VALUES ('David', 'Link', '567 Queens', 'Vacouver',5000.00,'Sales'),
       ('Emily', 'Harper', '456 Elm Apt. #44', 'Dallas', 6000.00,'HR'),
       ('Criss', 'Witt', '7312 GoergeTown.', 'South Carolina',7000.00,'IT'),
       ('Hansen', 'Jones', '11000 Hampton', 'Edmenton',10000.00,'HR'),
       ('Sophie', 'Watson', '1690 Hollis Street', 'Toronto',5500.00,'IT'),
	   ('Drew', 'Brisco', '1690 Hollis Street', 'Toronto', 8500.00,'IT')


SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM CustomerOrder;


-- 1. using subquery return the firstname, lastname, employeedept of those employees having the lowest salary in each department

SELECT e1.EmployeeFirstName, e1.EmployeeLastName, e1.EmployeeDept, e1.EmployeeSalary
FROM Employee e1
WHERE e1.EmployeeSalary IN (
    SELECT MIN(e2.EmployeeSalary)
    FROM Employee e2
    WHERE e2.EmployeeDept = e1.EmployeeDept
);

--2. using subquery return the customers firstname, lastname, orderID and bill where the order amount exists between 9 and 10

SELECT c.FirstName, c.LastName, co.OrderID, co.Bill
FROM Customer c
JOIN CustomerOrder co ON c.CustomerID = co.CustomerID
WHERE co.Bill BETWEEN 9 AND 10;

--3. using subquery return customers customerID, country, orderID in which orders the customerID is greater than 5 and less than 9

SELECT c.CustomerID, c.Country, co.OrderID
FROM Customer c
JOIN CustomerOrder co ON c.CustomerID = co.CustomerID
WHERE c.CustomerID > 5 AND c.CustomerID < 9;

--4. display customers whose address is '1690 Hollis Street'

SELECT *
FROM Customer
WHERE CustomerAddress = '1690 Hollis Street';

--5. find all the order date not '2019-01-13'

SELECT *
FROM CustomerOrder
WHERE OrderDate <> '2019-01-13';

--6. using subquery return the info about those employees who get second-highest salary

SELECT *
FROM Employee
WHERE EmployeeSalary = (
    SELECT MAX(EmployeeSalary)
    FROM Employee
    WHERE EmployeeSalary < (
        SELECT MAX(EmployeeSalary)
        FROM Employee
    )
);

--8. using subquery return those employees who work in the same department as 'Drew'. Exclude all those records where first name is 'Drew' return firstname, lastname, dept

SELECT EmployeeFirstName, EmployeeLastName, EmployeeDept
FROM Employee
WHERE EmployeeDept = (
    SELECT EmployeeDept
    FROM Employee
    WHERE EmployeeFirstName = 'Drew'
) AND EmployeeFirstName <> 'Drew';

--10. using subquery find those employees who earn more than the average salary and work in the same dept as an employee whose first name contains the letter 'D'

SELECT EmployeeFirstName, EmployeeLastName, EmployeeDept, EmployeeSalary
FROM Employee
WHERE EmployeeSalary > (
    SELECT AVG(EmployeeSalary)
    FROM Employee
) AND EmployeeDept = (
    SELECT EmployeeDept
    FROM Employee
    WHERE EmployeeFirstName LIKE '%D%'
);

--7. using subquery find the sum of total bill for each customer who have placed and order

SELECT c.FirstName, c.LastName, 
       (SELECT SUM(co.Bill) FROM CustomerOrder co WHERE co.CustomerID = c.CustomerID) AS TotalBill
FROM Customer c
WHERE EXISTS (SELECT 1 FROM CustomerOrder co WHERE co.CustomerID = c.CustomerID);

--9. show the number of employees having the maximum salary 10000

SELECT COUNT(*)
FROM Employee
WHERE EmployeeSalary = 10000.00;

--10. 