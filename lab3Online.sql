CREATE TABLE DEPARTMENTS (
	DEPARTMENT_ID INT NOT NULL IDENTITY(11, 1) PRIMARY KEY,
	DEPARTMENT_NAME VARCHAR(50) NOT NULL,
	LOCATION_ID INT NOT NULL
);

CREATE TABLE EMPLOYEES (
	EMPLOYEE_ID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	FIRSTNAME VARCHAR(50) NOT NULL,
	LASTNAME VARCHAR(50) NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	PHONE_NO VARCHAR(50) NOT NULL,
	HIRE_DATE DATETIME NOT NULL,
	JOB_ID INT NOT NULL,
	MANAGER_ID INT NOT NULL,
	SALARY INT NOT NULL,
	DEPARTMENT_ID INT FOREIGN KEY REFERENCES DEPARTMENTS
);

INSERT INTO DEPARTMENTS (
	DEPARTMENT_NAME,
	LOCATION_ID
) VALUES (
	'Accounting',
	'1700'
),
(
	'Executive',
	'1490'
),
(
	'Finance',
	'1780'
),
(
	'HR',
	'1600'
);

INSERT INTO EMPLOYEES (
	FIRSTNAME,
	LASTNAME,
	EMAIL,
	PHONE_NO,
	HIRE_DATE,
	JOB_ID,
	MANAGER_ID,
	SALARY,
	DEPARTMENT_ID
) VALUES (
	'Hamid',
	'Patwary',
	'Had@gmail.com',
	'0182369214',
	19-01-2023,
	2,
	3,
	130000.00,
	12
),
(
	'Jmid',
	'Patwary',
	'Id@gmail.com',
	'0182139214',
	19-01-2021,
	2,
	3,
	230000.00,
	14
),
(
	'Hid',
	'Patwary',
	'Mid@gmail.com',
	'0181369214',
	19-01-2022,
	2,
	3,
	330000.00,
	11
),
(
	'Mid',
	'Patwary',
	'Hd@gmail.com',
	'0182136914',
	19-01-2023,
	2,
	3,
	30000.00,
	13
),
(
	'Lmid',
	'Patwary',
	'Hid@gmail.com',
	'0182136921',
	19-01-2021,
	2,
	3,
	160000.00,
	12
);

-- 1. Find all the empolyees that belong to the location 1700 --

SELECT
	*
FROM
	EMPLOYEES   E
	JOIN DEPARTMENTS D
	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE
	D.LOCATION_ID = 1700;

-- 2. Find all the employees who do not locate at the location 1760 --

SELECT
	*
FROM
	EMPLOYEES   E
	JOIN DEPARTMENTS D
	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE
	D.LOCATION_ID <> 1760;

-- 3. Find all departments which have at least one employee with salary is greater than 10,000 --
SELECT
	*
FROM
	DEPARTMENTS
WHERE
	DEPARTMENT_ID IN (
		SELECT
			DEPARTMENT_ID
		FROM
			EMPLOYEES
		WHERE
			SALARY > 10000
	);

-- 4. Find all employees whose salaries are greater than the lowest salary of every departement --
SELECT
	*
FROM
	EMPLOYEES
WHERE
	SALARY > (
		SELECT
			MIN(SALARY)
		FROM
			EMPLOYEES
		GROUP BY
			DEPARTMENT_ID
	);

-- 5. Find all employees who earn second - lowest salary of all the employees. Return all the fields of employee --
SELECT
	*
FROM
	EMPLOYEES
WHERE
	SALARY = (
		SELECT
			DISTINCT SALARY
		FROM
			EMPLOYEES
		ORDER BY
			SALARY DESC OFFSET 1 ROW FETCH NEXT 1 ROW ONLY
	);

-- 6. Calculate the average of minimum salary of all departments --
SELECT
	AVG(MIN_SALARY)
FROM
	(
		SELECT
			MIN(SALARY) AS MIN_SALARY
		FROM
			EMPLOYEES
		GROUP BY
			DEPARTMENT_ID
	) AS MIN_SALARY;

-- 7. Update Hamid's salary to the average salary of all employees if his salary is less than the average salary of all employees --UPDATE EMPLOYEES
UPDATE EMPLOYEES
SET
	SALARY = (
		SELECT AVG(SALARY) FROM EMPLOYEES
	)
WHERE
	FIRSTNAME = 'Hamid'
	AND SALARY < (
		SELECT AVG(SALARY) FROM EMPLOYEES
	);