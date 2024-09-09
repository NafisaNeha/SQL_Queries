CREATE DATABASE ASSIGNMENT;

USE ASSIGNMENT;

CREATE TABLE ACTOR (
    ID INT PRIMARY KEY IDENTITY(1, 1),
    FNAME VARCHAR(50),
    LNAME VARCHAR(50),
    GENDER VARCHAR(10)
);

CREATE TABLE MOVIE (
    ID INT PRIMARY KEY IDENTITY(1, 1),
    NAME VARCHAR(100),
    YEAR INT,
    RANK INT
);

CREATE TABLE DIRECTOR (
    ID INT PRIMARY KEY IDENTITY(1, 1),
    FNAME VARCHAR(50),
    LNAME VARCHAR(50)
);

CREATE TABLE CAST (
    P_ID INT,
    MID INT,
    ROLE VARCHAR(50),
    PRIMARY KEY (P_ID, MID),
    FOREIGN KEY (P_ID) REFERENCES ACTOR(ID),
    FOREIGN KEY (MID) REFERENCES MOVIE(ID)
);

CREATE TABLE MOVIE_DIRECTOR (
    D_ID INT,
    M_ID INT,
    PRIMARY KEY (D_ID, M_ID),
    FOREIGN KEY (D_ID) REFERENCES DIRECTOR(ID),
    FOREIGN KEY (M_ID) REFERENCES MOVIE(ID)
);

INSERT INTO ACTOR (
    FNAME,
    LNAME,
    GENDER
) VALUES (
    'James',
    'Smith',
    'Male'
),
(
    'Olivia',
    'Johnson',
    'Female'
),
(
    'William',
    'Davis',
    'Male'
),
(
    'Emma',
    'Brown',
    'Female'
),
(
    'Liam',
    'Miller',
    'Male'
),
(
    'Ava',
    'Jones',
    'Female'
);

INSERT INTO MOVIE (
    NAME,
    YEAR,
    RANK
) VALUES (
    'Adventure Quest',
    2005,
    8
),
(
    'Mystic Dreams',
    2012,
    6
),
(
    'Eternal Echoes',
    1998,
    9
),
(
    'Silver Shadows',
    2010,
    7
),
(
    'Secrets of the Sea',
    1985,
    8
),
(
    'Whispering Pines',
    2018,
    6
);

INSERT INTO DIRECTOR (
    FNAME,
    LNAME
) VALUES (
    'Michael',
    'Anderson'
),
(
    'Sophia',
    'White'
),
(
    'Ethan',
    'Smith'
),
(
    'Isabella',
    'Wilson'
),
(
    'Jackson',
    'Johnson'
),
(
    'Mia',
    'Brown'
);

INSERT INTO CAST (
    P_ID,
    MID,
    ROLE
) VALUES (
    1,
    1,
    'Protagonist'
),
(
    2,
    1,
    'Antagonist'
),
(
    3,
    2,
    'Supporting Role'
),
(
    4,
    2,
    'Main Character'
),
(
    5,
    3,
    'Hero'
),
(
    6,
    3,
    'Villain'
),
(
    1,
    4,
    'Sidekick'
),
(
    3,
    5,
    'Lead'
),
(
    2,
    5,
    'Lead'
),
(
    4,
    6,
    'Supporting'
);

INSERT INTO MOVIE_DIRECTOR (
    D_ID,
    M_ID
) VALUES (
    1,
    2
),
(
    2,
    1
),
(
    3,
    6
),
(
    4,
    5
),
(
    5,
    4
),
(
    6,
    3
);

INSERT INTO ACTOR (
    FNAME,
    LNAME,
    GENDER
) VALUES (
    'John',
    'Doe',
    'Male'
),
(
    'Jane',
    'Doe',
    'Female'
);

INSERT INTO MOVIE (
    NAME,
    YEAR,
    RANK
) VALUES (
    'Officer 444',
    1926,
    34
);

INSERT INTO CAST (
    P_ID,
    MID,
    ROLE
) VALUES (
    6,
    11,
    'Protagonist'
),
(
    11,
    11,
    'Antagonist'
);

INSERT INTO DIRECTOR (
    FNAME,
    LNAME
) VALUES (
    'David',
    'Lee'
),
(
    'Sarah',
    'Kim'
);

INSERT INTO MOVIE (
    NAME,
    YEAR,
    RANK
) VALUES (
    'The Secret Garden',
    1993,
    8
),
(
    'The Sound of Music',
    1965,
    9
),
(
    'The Lion King',
    1994,
    10
),
(
    'The Shawshank Redemption',
    1994,
    10
);

INSERT INTO MOVIE_DIRECTOR (
    D_ID,
    M_ID
) VALUES (
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'David' AND LNAME = 'Lee'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Secret Garden')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'David' AND LNAME = 'Lee'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Sound of Music')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Sarah' AND LNAME = 'Kim'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Lion King')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Sarah' AND LNAME = 'Kim'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Shawshank Redemption')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Sarah' AND LNAME = 'Kim'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Secret Garden')
);

INSERT INTO ACTOR (
    FNAME,
    LNAME,
    GENDER
) VALUES (
    'Robert',
    'Johnson',
    'Male'
),
(
    'Sophia',
    'Garcia',
    'Female'
);

INSERT INTO CAST (
    P_ID,
    MID,
    ROLE
) VALUES (
    (SELECT ID FROM ACTOR WHERE FNAME = 'Robert' AND LNAME = 'Johnson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Lion King'),
    'Protagonist'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Sophia' AND LNAME = 'Garcia'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Secret Garden'),
    'Antagonist'
);

INSERT INTO MOVIE_DIRECTOR (
    D_ID,
    M_ID
) VALUES (
    7,
    9
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Michael' AND LNAME = 'Anderson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'Adventure Quest')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Sophia' AND LNAME = 'White'),
    (SELECT ID FROM MOVIE WHERE NAME = 'Mystic Dreams')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Ethan' AND LNAME = 'Smith'),
    (SELECT ID FROM MOVIE WHERE NAME = 'Eternal Echoes')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Isabella' AND LNAME = 'Wilson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'Silver Shadows')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Jackson' AND LNAME = 'Johnson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'Secrets of the Sea')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Mia' AND LNAME = 'Brown'),
    (SELECT ID FROM MOVIE WHERE NAME = 'Whispering Pines')
);

INSERT INTO CAST (
    P_ID,
    MID,
    ROLE
) VALUES (
    (SELECT ID FROM ACTOR WHERE FNAME = 'Robert' AND LNAME = 'Johnson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Secret Garden'),
    'Supporting Role'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Sophia' AND LNAME = 'Garcia'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Lion King'),
    'Supporting Role'
);

INSERT INTO ACTOR (
    FNAME,
    LNAME,
    GENDER
) VALUES (
    'Emily',
    'Wilson',
    'Female'
),
(
    'Jacob',
    'Brown',
    'Male'
);

INSERT INTO CAST (
    P_ID,
    MID,
    ROLE
) VALUES (
    (SELECT ID FROM ACTOR WHERE FNAME = 'Emily' AND LNAME = 'Wilson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'Secrets of the Sea'),
    'Protagonist'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Jacob' AND LNAME = 'Brown'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Sound of Music'),
    'Antagonist'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Emily' AND LNAME = 'Wilson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'Whispering Pines'),
    'Supporting Role'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Jacob' AND LNAME = 'Brown'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Shawshank Redemption'),
    'Main Character'
);

UPDATE MOVIE
SET
    YEAR = 1890
WHERE
    NAME = 'Secrets of the Sea';

UPDATE MOVIE
SET
    YEAR = 1905
WHERE
    NAME = 'The Sound of Music';

UPDATE MOVIE
SET
    YEAR = 1910
WHERE
    NAME = 'Whispering Pines';

UPDATE MOVIE
SET
    YEAR = 1925
WHERE
    NAME = 'The Shawshank Redemption';

INSERT INTO ACTOR (
    FNAME,
    LNAME,
    GENDER
) VALUES (
    'William',
    'Taylor',
    'Male'
),
(
    'Sophie',
    'Clark',
    'Female'
),
(
    'Ethan',
    'Wright',
    'Male'
);

INSERT INTO CAST (
    P_ID,
    MID,
    ROLE
) VALUES (
    (SELECT ID FROM ACTOR WHERE FNAME = 'William' AND LNAME = 'Taylor'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Secret Garden'),
    'Protagonist'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Sophie' AND LNAME = 'Clark'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Sound of Music'),
    'Antagonist'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Ethan' AND LNAME = 'Wright'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Lion King'),
    'Supporting Role'
);

UPDATE MOVIE
SET
    YEAR = 1975
WHERE
    NAME = 'The Secret Garden';

UPDATE MOVIE
SET
    YEAR = 1960
WHERE
    NAME = 'The Sound of Music';

UPDATE MOVIE
SET
    YEAR = 1970
WHERE
    NAME = 'The Lion King';

INSERT INTO DIRECTOR (
    FNAME,
    LNAME
) VALUES (
    'John',
    'Smith'
),
(
    'Emily',
    'Johnson'
),
(
    'Michael',
    'Brown'
),
(
    'Sophia',
    'Garcia'
),
(
    'Jacob',
    'Martinez'
),
(
    'Isabella',
    'Davis'
),
(
    'Ethan',
    'Rodriguez'
),
(
    'Mia',
    'Wilson'
),
(
    'Jackson',
    'Anderson'
),
(
    'Ava',
    'Taylor'
);

INSERT INTO MOVIE (
    NAME,
    YEAR,
    RANK
) VALUES (
    'The Secret Garden 2',
    2022,
    7
),
(
    'The Sound of Music 2',
    2023,
    8
),
(
    'The Lion King 2',
    2024,
    9
),
(
    'The Shawshank Redemption 2',
    2025,
    10
),
(
    'The Secret Garden 3',
    2026,
    7
),
(
    'The Sound of Music 3',
    2027,
    8
),
(
    'The Lion King 3',
    2028,
    9
),
(
    'The Shawshank Redemption 3',
    2029,
    10
),
(
    'The Secret Garden 4',
    2030,
    7
),
(
    'The Sound of Music 4',
    2031,
    8
);

INSERT INTO MOVIE_DIRECTOR (
    D_ID,
    M_ID
) VALUES (
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'John' AND LNAME = 'Smith'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Secret Garden 2')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Emily' AND LNAME = 'Johnson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Sound of Music 2')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Michael' AND LNAME = 'Brown'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Lion King 2')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Sophia' AND LNAME = 'Garcia'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Shawshank Redemption 2')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Jacob' AND LNAME = 'Martinez'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Secret Garden 3')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Isabella' AND LNAME = 'Davis'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Sound of Music 3')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Ethan' AND LNAME = 'Rodriguez'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Lion King 3')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Mia' AND LNAME = 'Wilson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Shawshank Redemption 3')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Jackson' AND LNAME = 'Anderson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Secret Garden 4')
),
(
    (SELECT ID FROM DIRECTOR WHERE FNAME = 'Ava' AND LNAME = 'Taylor'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Sound of Music 4')
);

INSERT INTO CAST (
    P_ID,
    MID,
    ROLE
) VALUES (
    (SELECT ID FROM ACTOR WHERE FNAME = 'Robert' AND LNAME = 'Johnson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Secret Garden 2'),
    'Protagonist'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Sophia' AND LNAME = 'Garcia'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Sound of Music 2'),
    'Antagonist'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Ethan' AND LNAME = 'Wright'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Lion King 2'),
    'Supporting Role'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Emily' AND LNAME = 'Wilson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Shawshank Redemption 2'),
    'Main Character'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Jacob' AND LNAME = 'Brown'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Secret Garden 3'),
    'Protagonist'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Isabella' AND LNAME = 'Clark'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Sound of Music 3'),
    'Antagonist'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Mia' AND LNAME = 'Garcia'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Lion King 3'),
    'Supporting Role'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Jackson' AND LNAME = 'Martinez'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Shawshank Redemption 3'),
    'Main Character'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Ava' AND LNAME = 'Taylor'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Secret Garden 4'),
    'Protagonist'
),
(
    (SELECT ID FROM ACTOR WHERE FNAME = 'Robert' AND LNAME = 'Johnson'),
    (SELECT ID FROM MOVIE WHERE NAME = 'The Sound of Music 4'),
    'Antagonist'
);

----------------------------------------------- Question 1 -----------------------------------------------

-- This query retrieves the first and last names of all actors who acted in the movie 'Officer 444' in the year 1926.

SELECT
    ACTOR.FNAME,
    ACTOR.LNAME
FROM
    ACTOR
    INNER JOIN CAST
    ON ACTOR.ID = CAST.P_ID
    INNER JOIN MOVIE
    ON CAST.MID = MOVIE.ID
WHERE
    MOVIE.NAME = 'Officer 444'
    AND MOVIE.YEAR=1926;

----------------------------------------------- Question 2 -----------------------------------------------

-- This query retrieves the first and last names of all directors and the number of movies they directed, ordered by the number of movies in descending order.

SELECT
    DIRECTOR.FNAME,
    DIRECTOR.LNAME,
    COUNT(MOVIE_DIRECTOR.M_ID) AS NUMFILMSDIRECTED
FROM
    DIRECTOR
    INNER JOIN MOVIE_DIRECTOR
    ON DIRECTOR.ID = MOVIE_DIRECTOR.D_ID
GROUP BY
    DIRECTOR.FNAME,
    DIRECTOR.LNAME
ORDER BY
    NUMFILMSDIRECTED DESC;

----------------------------------------------- Question 3 -----------------------------------------------

-- This query retrieves the names of all movies that have the minimum number of actors, where the minimum number of actors is determined by a subquery.

SELECT
    MOVIE.NAME,
    COUNT(CAST.P_ID) AS NUMACTORS
FROM
    MOVIE
    INNER JOIN CAST
    ON MOVIE.ID = CAST.MID
GROUP BY
    MOVIE.NAME
HAVING
    COUNT(CAST.P_ID) = (
        SELECT
            MIN(NUMACTORS)
        FROM
            (
                SELECT
                    COUNT(CAST.P_ID) AS NUMACTORS
                FROM
                    MOVIE
                    INNER JOIN CAST
                    ON MOVIE.ID = CAST.MID
                GROUP BY
                    MOVIE.NAME
            ) AS ACTORCOUNTS
    );

----------------------------------------------- Question 4 -----------------------------------------------

-- This query retrieves the first and last names of all actors who have worked with at least 10 different directors.

SELECT
    ACTOR.FNAME,
    ACTOR.LNAME
FROM
    ACTOR
    INNER JOIN CAST
    ON ACTOR.ID = CAST.P_ID
    INNER JOIN MOVIE_DIRECTOR
    ON CAST.MID = MOVIE_DIRECTOR.M_ID
GROUP BY
    ACTOR.FNAME,
    ACTOR.LNAME
HAVING
    COUNT(DISTINCT MOVIE_DIRECTOR.D_ID) >= 10;

----------------------------------------------- Question 5 -----------------------------------------------

-- This query retrieves the names of all movies that have more female actors than male actors.

SELECT
    MOVIE.NAME,
    COUNT(
        CASE
            WHEN ACTOR.GENDER = 'Female' THEN
                1
        END)   AS NUMFEMALEACTORS,
    COUNT(
        CASE
            WHEN ACTOR.GENDER = 'Male' THEN
                1
        END)   AS NUMMALEACTORS
FROM
    MOVIE
    INNER JOIN CAST
    ON MOVIE.ID = CAST.MID
    INNER JOIN ACTOR
    ON CAST.P_ID = ACTOR.ID
GROUP BY
    MOVIE.NAME
HAVING
    COUNT(
        CASE
            WHEN ACTOR.GENDER = 'Female' THEN
                1
        END) > COUNT(
        CASE
            WHEN ACTOR.GENDER = 'Male' THEN
                1
        END);

----------------------------------------------- Question 6 -----------------------------------------------

-- This query retrieves the decade with the most movies and the number of movies in that decade.

SELECT
    TOP 1 (YEAR / 10) * 10 AS DECADE,
    COUNT(*)               AS NUMFILMS
FROM
    MOVIE
GROUP BY
    (YEAR / 10) * 10
ORDER BY
    NUMFILMS DESC;

----------------------------------------------- Question 7 -----------------------------------------------

-- This query retrieves the first and last names of all actors who acted in at least one movie in the second half of the 19th century and at least one movie in the first half of the 20th century.

SELECT
    ACTOR.FNAME,
    ACTOR.LNAME
FROM
    ACTOR
    INNER JOIN CAST
    ON ACTOR.ID = CAST.P_ID
    INNER JOIN MOVIE
    ON CAST.MID = MOVIE.ID
WHERE
    (MOVIE.YEAR >= 1850
    AND MOVIE.YEAR < 1900)
    OR (MOVIE.YEAR >= 1900
    AND MOVIE.YEAR < 1950)
GROUP BY
    ACTOR.FNAME, ACTOR.LNAME
HAVING
    COUNT(DISTINCT
        CASE
            WHEN MOVIE.YEAR >= 1850 AND MOVIE.YEAR < 1900 THEN
                MOVIE.ID
        END) >= 1
    AND COUNT(DISTINCT
        CASE
            WHEN MOVIE.YEAR >= 1900 AND MOVIE.YEAR < 1950 THEN
                MOVIE.ID
        END) >= 1;

----------------------------------------------- Question 8 -----------------------------------------------

-- This query retrieves the first and last names of all directors who directed a movie in a leap year (divisible by 4, except for years divisible by 100 but not by 400).

SELECT
    DISTINCT DIRECTOR.FNAME,
    DIRECTOR.LNAME
FROM
    DIRECTOR
    INNER JOIN MOVIE_DIRECTOR
    ON DIRECTOR.ID = MOVIE_DIRECTOR.D_ID
    INNER JOIN MOVIE
    ON MOVIE_DIRECTOR.M_ID = MOVIE.ID
WHERE
    MOVIE.YEAR % 4 = 0
    AND (MOVIE.YEAR % 100 != 0
    OR MOVIE.YEAR % 400 = 0);

----------------------------------------------- Question 9 -----------------------------------------------

-- This query retrieves the first and last names of all actors who acted in at least one movie before the year 1980.

SELECT
    ACTOR.FNAME,
    ACTOR.LNAME
FROM
    ACTOR
    INNER JOIN CAST
    ON ACTOR.ID = CAST.P_ID
    INNER JOIN MOVIE
    ON CAST.MID = MOVIE.ID
GROUP BY
    ACTOR.FNAME,
    ACTOR.LNAME
HAVING
    MAX(MOVIE.YEAR) < 1980;

----------------------------------------------- Question 10 -----------------------------------------------

-- This query retrieves the first and last names of all actors who acted in the oldest movie they appeared in, along with the name and year of that movie.

SELECT
    ACTOR.FNAME,
    ACTOR.LNAME,
    MOVIE.NAME,
    MOVIE.YEAR
FROM
    ACTOR
    INNER JOIN CAST
    ON ACTOR.ID = CAST.P_ID
    INNER JOIN MOVIE
    ON CAST.MID = MOVIE.ID
WHERE
    MOVIE.YEAR = (
        SELECT
            MIN(MOVIE.YEAR)
        FROM
            CAST
            INNER JOIN MOVIE
            ON CAST.MID = MOVIE.ID
        WHERE
            CAST.P_ID = ACTOR.ID
    )
ORDER BY
    ACTOR.FNAME;