CREATE TABLE CUSTOMER (
    CustomerId int IDENTITY(1, 1) PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Age int NOT NULL CHECK (Age >= 18),
    Address varchar(200) NULL DEFAULT 'Dhaka',
    Salary decimal(18, 2) NULL
)
INSERT INTO CUSTOMER (Name, Age, Address, Salary)
VALUES ('Rahim', 32, 'Gulshan', 2000.00),
    ('Karim', 25, 'Dhanmondi', 1500.00),
    ('Hashim', 23, 'Mottijheel', 2000.00),
    ('Khan', 25, 'Tejgaon', 6500.00),
    ('Rahman', 27, 'Wari', 8500.00),
    ('Mehedi', 22, 'Mohammadpur', 4500.00),
    ('Kashim', 24, 'Kakrail', 10000.00),
    ('Kazi', 22, 'Kakrail', 1000.00) -- ORDER BY
SELECT *
FROM CUSTOMER
ORDER BY Name,
    Age
SELECT *
FROM CUSTOMER
ORDER BY Age,
    Name
SELECT *
FROM CUSTOMER
ORDER BY Name desc
SELECT *
FROM CUSTOMER
WHERE Name <> 'Rahim' CREATE TABLE CUSTOMER (
        CustomerId int IDENTITY(1, 1) PRIMARY KEY,
        Name varchar(50) NOT NULL,
        Age int NOT NULL CHECK (Age >= 18),
        Address varchar(200) NULL DEFAULT 'Dhaka',
        Salary decimal(18, 2) NULL
    )
INSERT INTO CUSTOMER (Name, Age, Address, Salary)
VALUES ('Rahim', 32, 'Gulshan', 2000.00),
    ('Karim', 25, 'Dhanmondi', 1500.00),
    ('Hashim', 23, 'Mottijheel', 2000.00),
    ('Khan', 25, 'Tejgaon', 6500.00),
    ('Rahman', 27, 'Wari', 8500.00),
    ('Mehedi', 22, 'Mohammadpur', 4500.00),
    ('Kashim', 24, 'Kakrail', 10000.00),
    ('Kazi', 22, 'Kakrail', 1000.00)
SELECT *
FROM CUSTOMER -- ORDER BY
SELECT *
FROM CUSTOMER
ORDER BY Name,
    Age
SELECT *
FROM CUSTOMER
ORDER BY Age,
    Name
SELECT *
FROM CUSTOMER
ORDER BY Name desc
SELECT *
FROM CUSTOMER
WHERE Name <> 'Rahim' --OPERATORS 
    --LIKE
    -- Value starts with 200 and anything in the end
SELECT *
FROM CUSTOMER
WHERE SALARY LIKE '200%' -- Value ends with ka and anything in the beginning 
SELECT *
FROM CUSTOMER
WHERE NAME LIKE '%Ka' --For the value where ka is present anywhere in the data 
SELECT *
FROM CUSTOMER
WHERE NAME LIKE '%Ka%'
SELECT *
FROM CUSTOMER
WHERE NAME LIKE '___K' -- For 3 characters in beginning and then k and then anything else 
SELECT *
FROM CUSTOMER
WHERE NAME LIKE '___K%' -- For atleast 1 character
SELECT *
FROM CUSTOMER
WHERE NAME LIKE '%_%' -----
SELECT *
FROM CUSTOMER
WHERE NAME LIKE 'k____%'
SELECT Name,
    Salary * 12
FROM CUSTOMER --IN
SELECT *
FROM CUSTOMER
WHERE AGE IN (25, 27, 60) -- BETWEEN 
    -- AND & OR
SELECT *
FROM CUSTOMER
WHERE AGE >= 25
    AND SALARY >= 6500
SELECT *
FROM CUSTOMER
WHERE AGE >= 25
    OR SALARY >= 6500
SELECT *
FROM CUSTOMER
WHERE NAME LIKE 'Ka%'
    AND (
        AGE >= 25
        OR SALARY >= 6500
    ) -- IS 
SELECT *
FROM CUSTOMER
WHERE AGE IS NOT NULL
SELECT *
FROM CUSTOMER
WHERE AGE IS NULL -- TOP
SELECT TOP 3 *
from CUSTOMER
SELECT TOP 60 percent *
from CUSTOMER
SELECT SUM(SALARY),
    AVG(SALARY)
FROM CUSTOMER
SELECT SUM(SALARY) as 'Total Salary',
    AVG(SALARY) as 'Average Salary'
FROM CUSTOMER
SELECT MIN(SALARY)
FROM CUSTOMER
WHERE AGE >= 25
SELECT MAX(SALARY) - MIN(SALARY)
FROM CUSTOMER
WHERE AGE >= 25 --Returns the number of record in a table
SELECT COUNT(*)
FROM CUSTOMER
WHERE NAME LIKE 'Ka%'
SELECT COUNT(Address) as NumberOfCustomers
FROM CUSTOMER
SELECT COUNT(Distinct Address) as NumberOfCustomers
FROM CUSTOMER
SELECT len(Name)
FROM CUSTOMER
SELECT *
FROM CUSTOMER
where len(Name) > 4
UPDATE CUSTOMER
SET Name = upper(Name) ----------------------------
    -- COUNT(), MAX(), MIN(), SUM(), AVG()
SELECT Age
FROM CUSTOMER
SELECT MAX(Age)
FROM CUSTOMER
SELECT Age,
    MAX(Salary)
FROM CUSTOMER
SELECT MAX(Age),
    MAX(Salary)
FROM CUSTOMER
SELECT Age,
    MAX(Salary)
FROM CUSTOMER
GROUP BY Age
SELECT Age,
    MAX(Salary)
FROM CUSTOMER
GROUP BY Age
ORDER BY age;
Select COUNT(Salary),
    Max(Age)
FROM CUSTOMER