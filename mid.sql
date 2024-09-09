CREATE DATABASE mid;
USE mid;

CREATE TABLE CUSTOMER
(
	CustomerId int IDENTITY(1,1) PRIMARY KEY,
	LastName varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	AreaCode int NULL,
	Address varchar(200) NULL,
	Birthday date NOT NULL,
	Salary decimal(7,2) NULL,
	Phone varchar(11) NOT NULL
);

INSERT INTO CUSTOMER VALUES ('Hansen','Ola','1203','Dhaka','2000-12-18',1020.54,'016118899');
select * from  customer;

TRUNCATE TABLE STUDENT

ALTER TABLE CUSTOMER
DROP COLUMN CustomerSince

ALTER TABLE CUSTOMER
ALTER COLUMN CustomerSince datetime

ALTER TABLE CUSTOMER DROP COLUMN CustomerSince

CREATE TABLE ORDER1
(
	OrderId int IDENTITY (100, 1) PRIMARY KEY,
	CustomerId int NOT NULL FOREIGN KEY REFERENCES CUSTOMER (CustomerId),
	OrderDate date NULL,
	OrderAmount money NOT NULL
);

CREATE TABLE CUSTOMER
(
CustomerId int IDENTITY(1,1) PRIMARY KEY,
CustomerNumber int NOT NULL UNIQUE  CHECK(CustomerNumber>1000),
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
AreaCode int NULL,
Address varchar(200) NULL  DEFAULT  'Dhaka',
Phone varchar(11) NULL,
)

CREATE TABLE ORDERDETAILS
(
OrderId int IDENTITY(1,1) PRIMARY KEY,
CustomerId int NOT NULL FOREIGN KEY REFERENCES CUSTOMER (CustomerId),
OrderDate date NULL,
OrderAmount money NULL
) 

UPDATE CUSTOMER set LastName='michael', FirstName='corris' where customerId=3 OR customerId=2

SELECT * FROM CUSTOMER ORDER BY LastName desc

ALTER TABLE ORDERDETAILS ADD CHECK(OrderAmount > 0);
ALTER TABLE Customer ADD UNIQUE (AreaCode); 
ALTER TABLE Customer ALTER AreaCode SET DEFAULT '1203';
ALTER TABLE Persons ALTER AreaCode DROP DEFAULT; 

SELECT * FROM CUSTOMER WHERE NAME LIKE 'k____%'

SELECT * FROM CUSTOMER WHERE AGE IN ( 25, 27, 60 )

SELECT TOP 60 percent * from CUSTOMER

SELECT MAX(SALARY)-MIN(SALARY) FROM CUSTOMER WHERE AGE >= 25 

SELECT COUNT(Distint Address) as NumberOfCustomers FROM CUSTOMER 
SELECT len(Name) FROM CUSTOMER
SELECT * FROM CUSTOMER where len(Name)>4
UPDATE CUSTOMER SET Name=upper(Name)

SELECT Age,MAX(Salary) AS 'MAX_SALARY' FROM CUSTOMER GROUP BY  Age HAVING SUM(Salary)> 75000;
SELECT Name,SUM(Salary) AS 'MAX_SALARY' FROM CUSTOMER GROUP BY  Name HAVING Name LIKE 'ka%';
SELECT Name,Age,MAX(Salary) AS 'MAX_SALARY' FROM CUSTOMER GROUP BY  Name,age HAVING Name LIKE 'ka%';
SELECT Name,Age,MAX(Salary) AS 'MAX_SALARY' FROM CUSTOMER WHERE Age>22 GROUP BY  Name,age HAVING Name LIKE 'ka%'

INSERT INTO CUSTOMER (Name, Age, Address, Salary) 
VALUES ('Rahim', 32, 'Gulshan',2000.00),
       ('Karim', 25, 'Dhanmondi',1500.00),
       ('Hashim', 23, 'Mottijheel',2000.00),
       ('Khan', 25, 'Tejgaon',6500.00),
       ('Rahman', 27, 'Wari',8500.00),
       ('Mehedi', 22, 'Mohammadpur',4500.00),
       ('Kashim', 24, 'Kakrail',10000.00),
       ('Kazi', 22, 'Kakrail',1000.00)

select * from 
Country full join City
on Country.countryId = City.countryId

select * from Country left join City
on Country.countryId = City.countryId

select * from Country right join City
on Country.countryId = City.countryId

select * from Country inner join City
on Country.countryId = City.countryId

select E1.empName as 'Employee Name', E2.empName as 'Manager Name' 
from employee E1 inner join employee E2
on E1.managerId = E2.empId

select E.empName, J.grade
from employee E inner join JobGrade J
on (E.salary between J.lowest_val and J.highest_val)


UPDATE CUSTOMER
SET SALARY = SALARY * 0.25
WHERE AGE IN (SELECT AGE FROM CUSTOMER_BKP
WHERE AGE >= 27 )


SELECT Name,Age
FROM CUSTOMER 
WHERE Salary >
(SELECT AVG(Salary) + 1000 
FROM CUSTOMER )

SELECT EmployeeName,City FROM EMPLOYEE  WHERE City !='DHAKA'
UNION All

(SELECT EmployeeName,City
FROM EMPLOYEE 
WHERE City !='DHAKA')
INTERSECT
(SELECT EmployeeName,City
FROM EMPLOYEE 
WHERE City !='KHULNA')

(SELECT EmployeeName,City
FROM EMPLOYEE 
)
EXCEPT
(SELECT EmployeeName,City
FROM EMPLOYEE 
WHERE City !='DHAKA'
)