SQL> STUDENT INFORMATION DATABASE
-- Oracle SQL Project
-- BCA Beginner Project

-- STUDENT TABLE

CREATE TABLE student_info (
    roll NUMBER PRIMARY KEY,
    fname VARCHAR2(30),
    lname VARCHAR2(30),
    city VARCHAR2(30),
    dob DATE
);

-- INSERT STUDENT RECORDS

INSERT INTO student_info VALUES
(101, 'rahul', 'patel', 'jamnagar', '12-MAY-07');

INSERT INTO student_info VALUES
(102, 'priya', 'shah', 'rajkot', '18-FEB-08');

INSERT INTO student_info VALUES
(103, 'neha', 'parmar', 'ahmedabad', '20-JAN-08');

INSERT INTO student_info VALUES
(104, 'aarav', 'mehta', 'jamnagar', '07-JAN-08');

INSERT INTO student_info VALUES
(105, 'kavya', 'patel', 'surat', '21-AUG-07');

COMMIT;


-- DISPLAY STUDENT INFORMATION

SELECT * FROM student_info;


-- COURSE TABLE

CREATE TABLE std_course (
    cid NUMBER PRIMARY KEY,
    roll NUMBER,
    cname VARCHAR2(50),
    marks NUMBER,
    FOREIGN KEY (roll) REFERENCES student_info(roll)
);


-- INSERT COURSE RECORDS

INSERT INTO std_course VALUES
(1, 101, 'database management', 82);

INSERT INTO std_course VALUES
(2, 102, 'database management', 82);

INSERT INTO std_course VALUES
(3, 103, 'database management', 76);

INSERT INTO std_course VALUES
(4, 104, 'database management', 88);

INSERT INTO std_course VALUES
(5, 105, 'database management', 84);

COMMIT;


-- DISPLAY COURSE INFORMATION

SELECT * FROM std_course;


-- ORDER BY CID

SELECT *
FROM std_course
ORDER BY cid ASC;


-- COUNT TOTAL STUDENTS

SELECT COUNT(*) AS total_students
FROM student_info;


-- MINIMUM DATE OF BIRTH

SELECT MIN(dob) AS earliest_dob
FROM student_info;


-- MAXIMUM DATE OF BIRTH

SELECT MAX(dob) AS latest_dob
FROM student_info;


-- COUNT STUDENTS BY CITY

SELECT city, COUNT(*) AS total_students
FROM student_info
GROUP BY city;


-- STUDENTS WHOSE FIRST NAME STARTS WITH A

SELECT *
FROM student_info
WHERE fname LIKE 'a%';


-- JOIN TWO TABLES

SELECT s.roll,
       s.fname,
       s.lname,
       s.city,
       c.cname,
       c.marks
FROM student_info s
JOIN std_course c
ON s.roll = c.roll
ORDER BY s.roll;


-- AVERAGE MARKS

SELECT AVG(marks) AS average_marks
FROM std_course;


-- HIGHEST MARKS

SELECT MAX(marks) AS highest_marks
FROM std_course;


-- LOWEST MARKS

SELECT MIN(marks) AS lowest_marks
FROM std_course;


-- STUDENTS SCORING 80 OR MORE

SELECT s.roll,
       s.fname,
       s.lname,
       c.marks
FROM student_info s
JOIN std_course c
ON s.roll = c.roll
WHERE c.marks >= 80;


-- PASS / FAIL RESULT

SELECT s.roll,
       s.fname,
       s.lname,
       c.marks,
       CASE
           WHEN c.marks >= 40 THEN 'PASS'
           ELSE 'FAIL'
       END AS result
FROM student_info s
JOIN std_course c
ON s.roll = c.roll
ORDER BY s.roll;


-- TOP STUDENT

SELECT s.roll,
       s.fname,
       s.lname,
       c.marks
FROM student_info s
JOIN std_course c
ON s.roll = c.roll
WHERE c.marks = (SELECT MAX(c2.marks)
                 FROM std_course c2);-- STUDENT INFORMATION DATABASE
-- Oracle SQL Project
-- BCA Beginner Project

-- STUDENT TABLE

CREATE TABLE student_info (
    roll NUMBER PRIMARY KEY,
    fname VARCHAR2(30),
    lname VARCHAR2(30),
    city VARCHAR2(30),
    dob DATE
);

-- INSERT STUDENT RECORDS

INSERT INTO student_info VALUES
(101, 'rahul', 'patel', 'jamnagar', '12-MAY-07');

INSERT INTO student_info VALUES
(102, 'priya', 'shah', 'rajkot', '18-FEB-08');

INSERT INTO student_info VALUES
(103, 'neha', 'parmar', 'ahmedabad', '20-JAN-08');

INSERT INTO student_info VALUES
(104, 'aarav', 'mehta', 'jamnagar', '07-JAN-08');

INSERT INTO student_info VALUES
(105, 'kavya', 'patel', 'surat', '21-AUG-07');

COMMIT;


-- DISPLAY STUDENT INFORMATION

SELECT * FROM student_info;


-- COURSE TABLE

CREATE TABLE std_course (
    cid NUMBER PRIMARY KEY,
    roll NUMBER,
    cname VARCHAR2(50),
    marks NUMBER,
    FOREIGN KEY (roll) REFERENCES student_info(roll)
);


-- INSERT COURSE RECORDS

INSERT INTO std_course VALUES
(1, 101, 'database management', 82);

INSERT INTO std_course VALUES
(2, 102, 'database management', 82);

INSERT INTO std_course VALUES
(3, 103, 'database management', 76);

INSERT INTO std_course VALUES
(4, 104, 'database management', 88);

INSERT INTO std_course VALUES
(5, 105, 'database management', 84);

COMMIT;


-- DISPLAY COURSE INFORMATION

SELECT * FROM std_course;


-- ORDER BY CID

SELECT *
FROM std_course
ORDER BY cid ASC;


-- COUNT TOTAL STUDENTS

SELECT COUNT(*) AS total_students
FROM student_info;


-- MINIMUM DATE OF BIRTH

SELECT MIN(dob) AS earliest_dob
FROM student_info;


-- MAXIMUM DATE OF BIRTH

SELECT MAX(dob) AS latest_dob
FROM student_info;


-- COUNT STUDENTS BY CITY

SELECT city, COUNT(*) AS total_students
FROM student_info
GROUP BY city;


-- STUDENTS WHOSE FIRST NAME STARTS WITH A

SELECT *
FROM student_info
WHERE fname LIKE 'a%';


-- JOIN TWO TABLES

SELECT s.roll,
       s.fname,
       s.lname,
       s.city,
       c.cname,
       c.marks
FROM student_info s
JOIN std_course c
ON s.roll = c.roll
ORDER BY s.roll;


-- AVERAGE MARKS

SELECT AVG(marks) AS average_marks
FROM std_course;


-- HIGHEST MARKS

SELECT MAX(marks) AS highest_marks
FROM std_course;


-- LOWEST MARKS

SELECT MIN(marks) AS lowest_marks
FROM std_course;


-- STUDENTS SCORING 80 OR MORE

SELECT s.roll,
       s.fname,
       s.lname,
       c.marks
FROM student_info s
JOIN std_course c
ON s.roll = c.roll
WHERE c.marks >= 80;


-- PASS / FAIL RESULT

SELECT s.roll,
       s.fname,
       s.lname,
       c.marks,
       CASE
           WHEN c.marks >= 40 THEN 'PASS'
           ELSE 'FAIL'
       END AS result
FROM student_info s
JOIN std_course c
ON s.roll = c.roll
ORDER BY s.roll;


-- TOP STUDENT

SELECT s.roll,
       s.fname,
       s.lname,
       c.marks
FROM student_info s
JOIN std_course c
ON s.roll = c.roll
WHERE c.marks = (SELECT MAX(c2.marks)
                 FROM std_course c2);
