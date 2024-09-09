CREATE DATABASE ASSIGNMENT01;

USE ASSIGNMENT01;

-- Create ACTOR table
CREATE TABLE ACTOR (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    gender VARCHAR(10)
);

-- Insert data into ACTOR table
INSERT INTO ACTOR (id, fname, lname, gender)
VALUES
    (1, 'James', 'Smith', 'Male'),
    (2, 'Olivia', 'Johnson', 'Female'),
    (3, 'William', 'Davis', 'Male'),
    (4, 'Emma', 'Brown', 'Female'),
    (5, 'Liam', 'Miller', 'Male'),
    (6, 'Ava', 'Jones', 'Female'),
    (7, 'John', 'Doe', 'Male'),
    (8, 'Jane', 'Doe', 'Female'),
    (9, 'Robert', 'Johnson', 'Male'),
    (10, 'Sophia', 'Garcia', 'Female'),
    (11, 'Emily', 'Wilson', 'Female'),
    (12, 'Jacob', 'Brown', 'Male'),
    (13, 'William', 'Taylor', 'Male'),
    (14, 'Sophie', 'Clark', 'Female'),
    (15, 'Ethan', 'Wright', 'Male');

-- Create MOVIE table
CREATE TABLE MOVIE (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    year INT,
    rank INT
);

-- Insert data into MOVIE table
INSERT INTO MOVIE (id, name, year, rank)
VALUES
    (1, 'Adventure Quest', 2005, 8),
    (2, 'Mystic Dreams', 2012, 6),
    (3, 'Eternal Echoes', 1998, 9),
    (4, 'Silver Shadows', 2010, 7),
    (5, 'Secrets of the Sea', 1890, 8),
    (6, 'Whispering Pines', 1910, 6),
    (7, 'The Secret Garden', 1975, 8),
    (8, 'The Sound of Music', 1960, 9),
    (9, 'The Lion King', 1970, 10),
    (10, 'The Shawshank Redemption', 1925, 10),
    (11, 'Officer 444', 1926, 34),
    (12, 'The Lion King 2', 2024, 9),
    (13, 'The Lion King 3', 2028, 9),
    (14, 'The Secret Garden 2', 2022, 7),
    (15, 'The Secret Garden 3', 2026, 7),
    (16, 'The Secret Garden 4', 2030, 7),
    (17, 'The Shawshank Redemption 2', 2025, 10),
    (18, 'The Shawshank Redemption 3', 2029, 10),
    (19, 'The Sound of Music 2', 2023, 8),
    (20, 'The Sound of Music 3', 2027, 8),
    (21, 'The Sound of Music 4', 2031, 8);

-- Create DIRECTOR table
CREATE TABLE DIRECTOR (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50)
);

-- Insert data into DIRECTOR table
INSERT INTO DIRECTOR (id, fname, lname)
VALUES
    (1, 'Michael', 'Anderson'),
    (2, 'Sophia', 'White'),
    (3, 'Ethan', 'Smith'),
    (4, 'Isabella', 'Wilson'),
    (5, 'Jackson', 'Johnson'),
    (6, 'Mia', 'Brown'),
    (7, 'David', 'Lee'),
    (8, 'Sarah', 'Kim'),
    (9, 'Ava', 'Taylor'),
    (10, 'Emily', 'Johnson'),
    (11, 'Ethan', 'Rodriguez'),
    (12, 'Isabella', 'Davis'),
    (13, 'Jackson', 'Anderson'),
    (14, 'Jacob', 'Martinez'),
    (15, 'John', 'Smith'),
    (16, 'Mia', 'Wilson'),
    (17, 'Michael', 'Brown'),
    (18, 'Sophia', 'Garcia');

-- Create CAST table
CREATE TABLE CAST (
    p_id INT,
    mid INT,
    role VARCHAR(50),
    PRIMARY KEY (p_id, mid),
    FOREIGN KEY (p_id) REFERENCES ACTOR(id),
    FOREIGN KEY (mid) REFERENCES MOVIE(id)
);

-- Insert data into CAST table
INSERT INTO CAST (p_id, mid, role)
VALUES
    (1, 1, 'Protagonist'),
    (1, 4, 'Sidekick'),
    (2, 1, 'Antagonist'),
    (2, 5, 'Lead'),
    (3, 2, 'Supporting Role'),
    (3, 5, 'Lead'),
    (4, 2, 'Main Character'),
    (4, 6, 'Supporting'),
    (5, 3, 'Hero'),
    (6, 3, 'Villain'),
    (6, 11, 'Protagonist'),
    (9, 1, 'Supporting'),
    (9, 2, 'Supporting'),
    (9, 3, 'Supporting'),
    (9, 4, 'Supporting'),
    (9, 5, 'Supporting'),
    (9, 6, 'Supporting'),
    (9, 7, 'Supporting Role'),
    (9, 8, 'Supporting'),
    (9, 9, 'Protagonist'),
    (9, 10, 'Supporting'),
    (9, 11, 'Supporting'),
    (9, 12, 'Supporting'),
    (9, 13, 'Supporting'),
    (9, 14, 'Protagonist'),
    (9, 15, 'Supporting'),
    (9, 16, 'Supporting'),
    (9, 17, 'Supporting'),
    (9, 18, 'Supporting'),
    (9, 19, 'Supporting'),
    (9, 20, 'Supporting'),
    (9, 21, 'Protagonist'),
    (10, 7, 'Antagonist'),
    (10, 9, 'Supporting Role'),
    (10, 19, 'Protagonist'),
    (11, 1, 'Antagonist'),
    (11, 2, 'Antagonist'),
    (11, 3, 'Antagonist'),
    (11, 4, 'Antagonist'),
    (11, 5, 'Protagonist'),
    (11, 6, 'Supporting Role'),
    (11, 7, 'Antagonist'),
    (11, 8, 'Antagonist'),
    (11, 9, 'Antagonist'),
    (11, 10, 'Antagonist'),
    (11, 11, 'Antagonist'),
    (11, 12, 'Antagonist'),
    (11, 13, 'Antagonist'),
    (11, 14, 'Antagonist'),
    (11, 15, 'Antagonist'),
    (11, 16, 'Antagonist'),
    (11, 17, 'Protagonist'),
    (11, 18, 'Antagonist'),
    (11, 19, 'Antagonist'),
    (11, 20, 'Antagonist'),
    (11, 21, 'Antagonist'),
    (12, 8, 'Antagonist'),
    (12, 10, 'Main Character'),
    (12, 15, 'Protagonist'),
    (13, 7, 'Protagonist'),
    (14, 8, 'Antagonist'),
    (15, 9, 'Supporting Role'),
    (15, 12, 'Protagonist');

-- Create MOVIE_DIRECTOR table
CREATE TABLE MOVIE_DIRECTOR (
    d_id INT,
    m_id INT,
    PRIMARY KEY (d_id, m_id),
    FOREIGN KEY (d_id) REFERENCES DIRECTOR(id),
    FOREIGN KEY (m_id) REFERENCES MOVIE(id)
);

-- Insert data into MOVIE_DIRECTOR table
INSERT INTO MOVIE_DIRECTOR (d_id, m_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (2, 2),
    (3, 3),
    (3, 6),
    (4, 4),
    (4, 5),
    (5, 4),
    (5, 5),
    (6, 3),
    (6, 6),
    (7, 7),
    (7, 8),
    (7, 9),
    (8, 7),
    (8, 9),
    (8, 10),
    (9, 21),
    (10, 19),
    (11, 13),
    (12, 20),
    (13, 16),
    (14, 15),
    (15, 14),
    (16, 18),
    (17, 12),
    (18, 17);


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