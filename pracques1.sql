CREATE DATABASE PRACQUES;

USE PRACQUES;

CREATE TABLE STUDENTS(
    ROLLNO INT IDENTITY(1, 1) PRIMARY KEY,
    FULLNAME VARCHAR(255) NOT NULL,
    CGPA FLOAT NOT NULL,
    AGE INT NOT NULL,
    GENDER VARCHAR(255) NOT NULL
);

INSERT INTO STUDENTS VALUES (
    'Rahima Khatun',
    3.55,
    23,
    'Female'
),
(
    'Amena Begum',
    3.23,
    21,
    'Female'
),
(
    'Khorshed Mia',
    2.99,
    24,
    'Male'
),
(
    'Sabera Banu',
    3.87,
    20,
    'Female'
),
(
    'Abul Mokhles',
    2.87,
    25,
    'Male'
);

SELECT
    FULLNAME
FROM
    STUDENTS
WHERE
    GENDER = 'Female';

SELECT
    MIN(AGE)
FROM
    STUDENTS
WHERE
    GENDER ='Male';

SELECT
    *
FROM
    STUDENTS IN (
        SELECT
            FULLNAME,
            CGPA
        FROM
            STUDENTS
        WHERE
            CGPA > 3.25
    )
ORDER BY
    CGPA,
    FULLNAME ASC;

SELECT
    FULLNAME
FROM
    STUDENTS
WHERE
    CGPA = (
        SELECT
            MAX(CGPA)
        FROM
            STUDENTS
    );

ALTER TABLE STUDENTS ADD DATE_OF_BIRTH DATE;

UPDATE STUDENTS
SET
    DATE_OF_BIRTH = '1998-05-15'
WHERE
    FULLNAME = 'Rahima Khatun';

UPDATE STUDENTS
SET
    DATE_OF_BIRTH = '2000-02-28'
WHERE
    FULLNAME = 'Amena Begum';

UPDATE STUDENTS
SET
    DATE_OF_BIRTH = '1997-11-10'
WHERE
    FULLNAME = 'Khorshed Mia';

UPDATE STUDENTS
SET
    DATE_OF_BIRTH = '2001-07-22'
WHERE
    FULLNAME = 'Sabera Banu';

UPDATE STUDENTS
SET
    DATE_OF_BIRTH = '1996-09-05'
WHERE
    FULLNAME = 'Abul Mokhles';

SELECT
    FULLNAME,
    DATEDIFF(YEAR,
    DATE_OF_BIRTH,
    GETDATE()) AS AGE
FROM
    STUDENTS;