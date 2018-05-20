/**
 * //////////////////////////////////////
 * // ΑΣΚΗΣΗ ΠΡΑΞΗΣ ΙΙΙ: SQL EΡΩΤΗΜΑΤΑ //
 * // ΤΖΙΚΑΣ ΓΕΩΡΓΙΟΣ 3822             //
 * //////////////////////////////////////
 */

/**
 * ///////////////////////
 * // DATABASE CREATION //
 * ///////////////////////
 */
CREATE DATABASE IF NOT EXISTS `tzikas_ap3_3822`;
USE `tzikas_ap3_3822`;

/**
 * ////////////////////
 * // TABLE CREATION //
 * ////////////////////
 */
CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE dept_manager (
   dept_no      CHAR(4)         NOT NULL,
   emp_no       INT             NOT NULL,
   from_date    DATE            NOT NULL,
   to_date      DATE            NOT NULL,
   PRIMARY KEY (emp_no,dept_no),
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE
); 

CREATE TABLE dept_emp (
    emp_no      INT             NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
    FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no)  ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE
);

CREATE TABLE titles (
    emp_no      INT             NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    PRIMARY KEY (emp_no,title, from_date),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE    
); 

CREATE TABLE salaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
	PRIMARY KEY (emp_no, from_date),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE    
);

/**
 * ///////////////////
 * // TABLE INSERTS //
 * ///////////////////
 */
INSERT INTO `departments` VALUES 
('d001','Marketing'),
('d002','Finance'),
('d003','Human Resources'),
('d004','Production'),
('d005','Development');

INSERT INTO `employees` VALUES 
(10001,'1953-09-02','Georgi','Facello','M','1986-06-26'),
(10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21'),
(10003,'1959-12-03','Parto','Bamford','M','1986-08-28'),
(10004,'1954-05-01','Chirstian','Koblick','M','1986-12-01'),
(10005,'1955-01-21','Kyoichi','Maliniak','M','1989-09-12'),
(10006,'1953-04-20','Anneke','Preusig','F','1989-06-02'),
(10007,'1957-05-23','Tzvetan','Zielinski','F','1989-02-10'),
(10008,'1958-02-19','Saniya','Kalloufi','M','1994-09-15'),
(10009,'1952-04-19','Sumant','Peac','F','1985-02-18'),
(10010,'1963-06-01','Duangkaew','Piveteau','F','1989-08-24'),
(10011,'1953-11-07','Mary','Sluis','F','1990-01-22'),
(10012,'1960-10-04','Patricio','Bridgland','M','1992-12-18'),
(10013,'1963-06-07','Eberhardt','Terkki','M','1985-10-20'),
(10014,'1956-02-12','Berni','Genin','M','1987-03-11'),
(10015,'1959-08-19','Guoxiang','Nooteboom','M','1987-07-02'),
(10016,'1961-05-02','Kazuhito','Cappelletti','M','1995-01-27'),
(10017,'1958-07-06','Cristinel','Bouloucos','F','1993-08-03'),
(10018,'1954-06-19','Kazuhide','Peha','F','1987-04-03'),
(10019,'1953-01-23','Lillian','Haddadi','M','1999-04-30'),
(10020,'1952-12-24','Mayuko','Warwick','M','1991-01-26'),
(10021,'1956-12-24','Kostas','Tsiknas','M','1991-01-26'),
(10022,'1960-12-24','John','Tsimperidis','M','1995-01-26');

INSERT INTO `dept_emp` VALUES 
(10001,'d001','1986-06-26','9999-01-01'),
(10002,'d002','1996-08-03','9999-01-01'),
(10002,'d003','1996-08-03','9999-01-01'),
(10003,'d003','1995-12-03','9999-01-01'),
(10004,'d004','1986-12-01','9999-01-01'),
(10004,'d001','1986-12-01','9999-01-01'),
(10005,'d005','1989-09-12','9999-01-01'),
(10006,'d001','1990-08-05','9999-01-01'),
(10007,'d002','1989-02-10','9999-01-01'),
(10008,'d003','1998-03-11','2000-07-31'),
(10009,'d004','1985-02-18','9999-01-01'),
(10010,'d005','1996-11-24','2000-06-26'),
(10010,'d001','2000-06-26','9999-01-01'),
(10011,'d002','1990-01-22','1996-11-09'),
(10012,'d003','1992-12-18','9999-01-01'),
(10013,'d004','1985-10-20','9999-01-01'),
(10014,'d005','1993-12-29','9999-01-01'),
(10015,'d001','1992-09-19','1993-08-22'),
(10016,'d002','1998-02-11','9999-01-01'),
(10017,'d003','1993-08-03','9999-01-01'),
(10018,'d004','1992-07-29','9999-01-01'),
(10019,'d005','1999-04-30','9999-01-01'),
(10019,'d004','1999-04-30','9999-01-01'),
(10020,'d001','1997-12-30','9999-01-01'),
(10021,'d005','1995-12-30','9999-01-01'),
(10022,'d005','1995-12-30','9999-01-01');

INSERT INTO `dept_manager` VALUES 
('d001',10001,'1988-01-01','1991-10-01'),
('d002',10005,'1991-10-01','9999-01-01'),
('d003',10007,'1987-01-01','1989-12-17'),
('d004',10010,'1989-12-17','9999-01-01'),
('d005',10017,'1990-01-01','1992-03-21');

INSERT INTO `salaries` VALUES 
(10001,60117,'1986-06-26','1987-06-26'),
(10001,62102,'1987-06-26','1988-06-25'),
(10001,66074,'1988-06-25','1989-06-25'),
(10001,66596,'1989-06-25','1990-06-25'),
(10001,66961,'1990-06-25','1991-06-25'),
(10001,71046,'1991-06-25','1992-06-24'),
(10001,74333,'1992-06-24','1993-06-24'),
(10001,75286,'1993-06-24','1994-06-24'),
(10001,75994,'1994-06-24','1995-06-24'),
(10001,76884,'1995-06-24','1996-06-23'),
(10001,80013,'1996-06-23','1997-06-23'),
(10001,81025,'1997-06-23','1998-06-23'),
(10001,81097,'1998-06-23','1999-06-23'),
(10001,84917,'1999-06-23','2000-06-22'),
(10001,85112,'2000-06-22','2001-06-22'),
(10001,85097,'2001-06-22','2002-06-22'),
(10001,88958,'2002-06-22','9999-01-01'),
(10002,65828,'1996-08-03','1997-08-03'),
(10002,65909,'1997-08-03','1998-08-03'),
(10002,67534,'1998-08-03','1999-08-03'),
(10002,69366,'1999-08-03','2000-08-02'),
(10002,71963,'2000-08-02','2001-08-02'),
(10002,72527,'2001-08-02','9999-01-01'),
(10003,40006,'1995-12-03','1996-12-02'),
(10003,43616,'1996-12-02','1997-12-02'),
(10003,43466,'1997-12-02','1998-12-02'),
(10003,43636,'1998-12-02','1999-12-02'),
(10003,43478,'1999-12-02','2000-12-01'),
(10003,43699,'2000-12-01','2001-12-01'),
(10003,43311,'2001-12-01','9999-01-01'),
(10004,40054,'1986-12-01','1987-12-01'),
(10004,42283,'1987-12-01','1988-11-30'),
(10004,42542,'1988-11-30','1989-11-30'),
(10004,46065,'1989-11-30','1990-11-30'),
(10004,48271,'1990-11-30','1991-11-30'),
(10004,50594,'1991-11-30','1992-11-29'),
(10004,52119,'1992-11-29','1993-11-29'),
(10004,54693,'1993-11-29','1994-11-29'),
(10004,58326,'1994-11-29','1995-11-29'),
(10004,60770,'1995-11-29','1996-11-28'),
(10004,62566,'1996-11-28','1997-11-28'),
(10004,64340,'1997-11-28','1998-11-28'),
(10004,67096,'1998-11-28','1999-11-28'),
(10004,69722,'1999-11-28','2000-11-27'),
(10004,70698,'2000-11-27','2001-11-27'),
(10004,74057,'2001-11-27','9999-01-01'),
(10005,78228,'1989-09-12','1990-09-12'),
(10005,82621,'1990-09-12','1991-09-12'),
(10005,83735,'1991-09-12','1992-09-11'),
(10005,85572,'1992-09-11','1993-09-11'),
(10005,85076,'1993-09-11','1994-09-11'),
(10005,86050,'1994-09-11','1995-09-11'),
(10005,88448,'1995-09-11','1996-09-10'),
(10005,88063,'1996-09-10','1997-09-10'),
(10005,89724,'1997-09-10','1998-09-10'),
(10005,90392,'1998-09-10','1999-09-10'),
(10005,90531,'1999-09-10','2000-09-09'),
(10005,91453,'2000-09-09','2001-09-09'),
(10005,94692,'2001-09-09','9999-01-01'),
(10006,40000,'1990-08-05','1991-08-05'),
(10006,42085,'1991-08-05','1992-08-04'),
(10006,42629,'1992-08-04','1993-08-04'),
(10006,45844,'1993-08-04','1994-08-04'),
(10006,47518,'1994-08-04','1995-08-04'),
(10006,47917,'1995-08-04','1996-08-03'),
(10006,52255,'1996-08-03','1997-08-03'),
(10006,53747,'1997-08-03','1998-08-03'),
(10006,56032,'1998-08-03','1999-08-03'),
(10006,58299,'1999-08-03','2000-08-02'),
(10006,60098,'2000-08-02','2001-08-02'),
(10006,59755,'2001-08-02','9999-01-01'),
(10007,56724,'1989-02-10','1990-02-10'),
(10007,60740,'1990-02-10','1991-02-10'),
(10007,62745,'1991-02-10','1992-02-10'),
(10007,63475,'1992-02-10','1993-02-09'),
(10007,63208,'1993-02-09','1994-02-09'),
(10007,64563,'1994-02-09','1995-02-09'),
(10007,68833,'1995-02-09','1996-02-09'),
(10007,70220,'1996-02-09','1997-02-08'),
(10007,73362,'1997-02-08','1998-02-08'),
(10007,75582,'1998-02-08','1999-02-08'),
(10007,79513,'1999-02-08','2000-02-08'),
(10007,80083,'2000-02-08','2001-02-07'),
(10007,84456,'2001-02-07','2002-02-07'),
(10007,88070,'2002-02-07','9999-01-01'),
(10008,46671,'1998-03-11','1999-03-11'),
(10008,48584,'1999-03-11','2000-03-10'),
(10008,52668,'2000-03-10','2000-07-31'),
(10009,60929,'1985-02-18','1986-02-18'),
(10009,64604,'1986-02-18','1987-02-18'),
(10009,64780,'1987-02-18','1988-02-18'),
(10009,66302,'1988-02-18','1989-02-17'),
(10009,69042,'1989-02-17','1990-02-17'),
(10009,70889,'1990-02-17','1991-02-17'),
(10009,71434,'1991-02-17','1992-02-17'),
(10009,74612,'1992-02-17','1993-02-16'),
(10009,76518,'1993-02-16','1994-02-16'),
(10009,78335,'1994-02-16','1995-02-16'),
(10009,80944,'1995-02-16','1996-02-16'),
(10009,82507,'1996-02-16','1997-02-15'),
(10009,85875,'1997-02-15','1998-02-15'),
(10009,89324,'1998-02-15','1999-02-15'),
(10009,90668,'1999-02-15','2000-02-15'),
(10009,93507,'2000-02-15','2001-02-14'),
(10009,94443,'2001-02-14','2002-02-14'),
(10009,94409,'2002-02-14','9999-01-01'),
(10010,72488,'1996-11-24','1997-11-24'),
(10010,74347,'1997-11-24','1998-11-24'),
(10010,75405,'1998-11-24','1999-11-24'),
(10010,78194,'1999-11-24','2000-11-23'),
(10010,79580,'2000-11-23','2001-11-23'),
(10010,80324,'2001-11-23','9999-01-01'),
(10011,42365,'1990-01-22','1991-01-22'),
(10011,44200,'1991-01-22','1992-01-22'),
(10011,48214,'1992-01-22','1993-01-21'),
(10011,50927,'1993-01-21','1994-01-21'),
(10011,51470,'1994-01-21','1995-01-21'),
(10011,54545,'1995-01-21','1996-01-21'),
(10011,56753,'1996-01-21','1996-11-09'),
(10012,40000,'1992-12-18','1993-12-18'),
(10012,41867,'1993-12-18','1994-12-18'),
(10012,42318,'1994-12-18','1995-12-18'),
(10012,44195,'1995-12-18','1996-12-17'),
(10012,46460,'1996-12-17','1997-12-17'),
(10012,46485,'1997-12-17','1998-12-17'),
(10012,47364,'1998-12-17','1999-12-17'),
(10012,51122,'1999-12-17','2000-12-16'),
(10012,54794,'2000-12-16','2001-12-16'),
(10012,54423,'2001-12-16','9999-01-01'),
(10013,40000,'1985-10-20','1986-10-20'),
(10013,40623,'1986-10-20','1987-10-20'),
(10013,40561,'1987-10-20','1988-10-19'),
(10013,40306,'1988-10-19','1989-10-19'),
(10013,43569,'1989-10-19','1990-10-19'),
(10013,46305,'1990-10-19','1991-10-19'),
(10013,47118,'1991-10-19','1992-10-18'),
(10013,50351,'1992-10-18','1993-10-18'),
(10013,49887,'1993-10-18','1994-10-18'),
(10013,53957,'1994-10-18','1995-10-18'),
(10013,57590,'1995-10-18','1996-10-17'),
(10013,59228,'1996-10-17','1997-10-17'),
(10013,59571,'1997-10-17','1998-10-17'),
(10013,63274,'1998-10-17','1999-10-17'),
(10013,63352,'1999-10-17','2000-10-16'),
(10013,66744,'2000-10-16','2001-10-16'),
(10013,68901,'2001-10-16','9999-01-01'),
(10014,46168,'1993-12-29','1994-12-29'),
(10014,48242,'1994-12-29','1995-12-29'),
(10014,47921,'1995-12-29','1996-12-28'),
(10014,50715,'1996-12-28','1997-12-28'),
(10014,53228,'1997-12-28','1998-12-28'),
(10014,53962,'1998-12-28','1999-12-28'),
(10014,56937,'1999-12-28','2000-12-27'),
(10014,59142,'2000-12-27','2001-12-27'),
(10014,60598,'2001-12-27','9999-01-01'),
(10015,40000,'1992-09-19','1993-08-22'),
(10016,70889,'1998-02-11','1999-02-11'),
(10016,72946,'1999-02-11','2000-02-11'),
(10016,76826,'2000-02-11','2001-02-10'),
(10016,76381,'2001-02-10','2002-02-10'),
(10016,77935,'2002-02-10','9999-01-01'),
(10017,71380,'1993-08-03','1994-08-03'),
(10017,75538,'1994-08-03','1995-08-03'),
(10017,79510,'1995-08-03','1996-08-02'),
(10017,82163,'1996-08-02','1997-08-02'),
(10017,86157,'1997-08-02','1998-08-02'),
(10017,89619,'1998-08-02','1999-08-02'),
(10017,91985,'1999-08-02','2000-08-01'),
(10017,96122,'2000-08-01','2001-08-01'),
(10017,98522,'2001-08-01','2002-08-01'),
(10017,99651,'2002-08-01','9999-01-01'),
(10018,55881,'1987-04-03','1988-04-02'),
(10018,59206,'1988-04-02','1989-04-02'),
(10018,61361,'1989-04-02','1990-04-02'),
(10018,61648,'1990-04-02','1991-04-02'),
(10018,61217,'1991-04-02','1992-04-01'),
(10018,61244,'1992-04-01','1993-04-01'),
(10018,63286,'1993-04-01','1994-04-01'),
(10018,65739,'1994-04-01','1995-04-01'),
(10018,67519,'1995-04-01','1996-03-31'),
(10018,69276,'1996-03-31','1997-03-31'),
(10018,72585,'1997-03-31','1998-03-31'),
(10018,72804,'1998-03-31','1999-03-31'),
(10018,76957,'1999-03-31','2000-03-30'),
(10018,80305,'2000-03-30','2001-03-30'),
(10018,84541,'2001-03-30','2002-03-30'),
(10018,84672,'2002-03-30','9999-01-01'),
(10019,44276,'1999-04-30','2000-04-29'),
(10019,46946,'2000-04-29','2001-04-29'),
(10019,46775,'2001-04-29','2002-04-29'),
(10019,50032,'2002-04-29','9999-01-01'),
(10020,40000,'1997-12-30','1998-12-30'),
(10020,40647,'1998-12-30','1999-12-30'),
(10020,43800,'1999-12-30','2000-12-29'),
(10020,44927,'2000-12-29','2001-12-29'),
(10020,47017,'2001-12-29','9999-01-01');

INSERT INTO `titles` VALUES 
(10001,'Senior Engineer','1986-06-26','9999-01-01'),
(10002,'Staff','1996-08-03','9999-01-01'),
(10003,'Senior Engineer','1995-12-03','9999-01-01'),
(10004,'Engineer','1986-12-01','1995-12-01'),
(10004,'Senior Engineer','1995-12-01','9999-01-01'),
(10005,'Senior Staff','1996-09-12','9999-01-01'),
(10005,'Staff','1989-09-12','1996-09-12'),
(10006,'Senior Engineer','1990-08-05','9999-01-01'),
(10007,'Senior Staff','1996-02-11','9999-01-01'),
(10007,'Staff','1989-02-10','1996-02-11'),
(10008,'Assistant Engineer','1998-03-11','2000-07-31'),
(10009,'Assistant Engineer','1985-02-18','1990-02-18'),
(10009,'Engineer','1990-02-18','1995-02-18'),
(10009,'Senior Engineer','1995-02-18','9999-01-01'),
(10010,'Engineer','1996-11-24','9999-01-01'),
(10011,'Staff','1990-01-22','1996-11-09'),
(10012,'Engineer','1992-12-18','2000-12-18'),
(10012,'Senior Engineer','2000-12-18','9999-01-01'),
(10013,'Senior Staff','1985-10-20','9999-01-01'),
(10014,'Engineer','1993-12-29','9999-01-01'),
(10015,'Senior Staff','1992-09-19','1993-08-22'),
(10016,'Staff','1998-02-11','9999-01-01'),
(10017,'Senior Staff','2000-08-03','9999-01-01'),
(10017,'Staff','1993-08-03','2000-08-03'),
(10018,'Engineer','1987-04-03','1995-04-03'),
(10018,'Senior Engineer','1995-04-03','9999-01-01'),
(10019,'Staff','1999-04-30','9999-01-01'),
(10020,'Engineer','1997-12-30','9999-01-01');

/**
 * ///////////////////////////////////////////////
 * // Ερώτημα 1)                                //
 * // Εμφάνιση των ονοματεπωνύμων των υπαλλήλων //
 * ///////////////////////////////////////////////
 */
-- a) Των οποίων το όνομά τους ξεκινά από ‘Ka’
SELECT
  CONCAT(`FIRST_NAME`, ' ', `LAST_NAME`) AS `ON/MO`
FROM
  `EMPLOYEES`
WHERE
  `FIRST_NAME` LIKE 'Ka%';

/*
Output of: SELECT CONCAT(`FIRST_NAME`, ' ', `LAST_NAME`) AS `ON/MO` FROM `EMPLOYEES` WHERE `FIRST_NAME` LIKE 'Ka%';
+----------------------+
| ON/MO                |
+----------------------+
| Kazuhito Cappelletti |
| Kazuhide Peha        |
+----------------------+
*/

-- b) Των οποίων το όνομά τους περιέχει τους χαρακτήρες ‘ra’
SELECT
  CONCAT(`FIRST_NAME`, ' ', `LAST_NAME`) AS `ON/MO`
FROM
  `EMPLOYEES`
WHERE
  `FIRST_NAME` LIKE '%ra%';

/*
Output of: SELECT CONCAT(`FIRST_NAME`, ' ', `LAST_NAME`) AS `ON/MO` FROM `EMPLOYEES` WHERE `FIRST_NAME` LIKE '%ra%';
Empty set (0.00 sec)
*/

-- c) Των οποίων το όνομά τους αποτελείται από 5 χαρακτήρες
SELECT
  CONCAT(`FIRST_NAME`, ' ', `LAST_NAME`) AS `ON/MO`
FROM
  `EMPLOYEES`
WHERE
  LENGTH(`FIRST_NAME`)=5;

/*
Output of: SELECT CONCAT(`FIRST_NAME`, ' ', `LAST_NAME`) AS `ON/MO` FROM `EMPLOYEES` WHERE LENGTH(`FIRST_NAME`)=5;
+---------------+
| ON/MO         |
+---------------+
| Parto Bamford |
| Berni Genin   |
+---------------+
*/

/**
 * ///////////////////////////////////////////
 * // Ερώτημα 2)                            //
 * // Εμφάνιση των 10 καλύτερων μισθοδοσιών //
 * ///////////////////////////////////////////
 */
SELECT
  `SALARY`
FROM
  `SALARIES`
ORDER BY
  `SALARY` DESC
LIMIT 10;

/*
Output of: SELECT `SALARY` FROM `SALARIES` ORDER BY `SALARY` DESC LIMIT 10;
+--------+
| SALARY |
+--------+
|  99651 |
|  98522 |
|  96122 |
|  94692 |
|  94443 |
|  94409 |
|  93507 |
|  91985 |
|  91453 |
|  90668 |
+--------+
*/

/**
 * ///////////////////////////////////////////////////////////////////
 * // Ερώτημα 3)                                                    //
 * // Εμφάνιση του μικρότερου, του μεγαλύτερου και του μέσου μισθού //
 * ///////////////////////////////////////////////////////////////////
 */
-- Εμφάνιση του μικρότερου
SELECT
  `SALARY`
FROM
  `SALARIES`
ORDER BY
  `SALARY` ASC
LIMIT 1;

/*
Output of: SELECT `SALARY` FROM `SALARIES` ORDER BY `SALARY` ASC LIMIT 1;
+--------+
| SALARY |
+--------+
|  40000 |
+--------+
*/

-- Εμφάνιση του μεγαλύτερου
SELECT
  `SALARY`
FROM
  `SALARIES`
ORDER BY
  `SALARY` DESC
LIMIT 1;

/*
Output of: SELECT `SALARY` FROM `SALARIES` ORDER BY `SALARY` DESC LIMIT 1;
+--------+
| SALARY |
+--------+
|  99651 |
+--------+
*/

-- Εμφάνιση του μέσου
SELECT
  AVG(`SALARY`)
FROM
  `SALARIES`;

/*
Output of: SELECT AVG(`SALARY`) FROM `SALARIES`;
+---------------+
| AVG(`SALARY`) |
+---------------+
|    64407.6786 |
+---------------+
*/

/**
 * /////////////////////////////////////////////////////////////////////////////////
 * // Ερώτημα 4)                                                                  //
 * // Εμφάνιση των ονοματεπωνύμων των υπαλλήλων με τους αντίστοιχους μισθούς τους //
 * // Ταξινόμηση των αποτελεσμάτων με βάση το ύψος του μισθού σε φθίνουσα διάταξη //
 * /////////////////////////////////////////////////////////////////////////////////
 */
SELECT
  CONCAT(`FIRST_NAME`, ' ', `LAST_NAME`) AS `ON/MO`,
  `SALARY`
FROM
  `EMPLOYEES`,
  `SALARIES`
WHERE
  `EMPLOYEES`.`EMP_NO` = `SALARIES`.`EMP_NO`
ORDER BY
  `SALARY` DESC;

/*
Output of: SELECT CONCAT(`FIRST_NAME`, ' ', `LAST_NAME`) AS `ON/MO`, `SALARY` FROM `EMPLOYEES`, `SALARIES` WHERE `EMPLOYEES`.`EMP_NO` = `SALARIES`.`EMP_NO` ORDER BY `SALARY` DESC;
+----------------------+--------+
| ON/MO                | SALARY |
+----------------------+--------+
| Cristinel Bouloucos  |  99651 |
| Cristinel Bouloucos  |  98522 |
| Cristinel Bouloucos  |  96122 |
| Kyoichi Maliniak     |  94692 |
| Sumant Peac          |  94443 |
| Sumant Peac          |  94409 |
| Sumant Peac          |  93507 |
| Cristinel Bouloucos  |  91985 |
| Kyoichi Maliniak     |  91453 |
| Sumant Peac          |  90668 |
| Kyoichi Maliniak     |  90531 |
| Kyoichi Maliniak     |  90392 |
| Kyoichi Maliniak     |  89724 |
| Cristinel Bouloucos  |  89619 |
| Sumant Peac          |  89324 |
| Georgi Facello       |  88958 |
| Kyoichi Maliniak     |  88448 |
| Tzvetan Zielinski    |  88070 |
| Kyoichi Maliniak     |  88063 |
| Cristinel Bouloucos  |  86157 |
| Kyoichi Maliniak     |  86050 |
| Sumant Peac          |  85875 |
| Kyoichi Maliniak     |  85572 |
| Georgi Facello       |  85112 |
| Georgi Facello       |  85097 |
| Kyoichi Maliniak     |  85076 |
| Georgi Facello       |  84917 |
| Kazuhide Peha        |  84672 |
| Kazuhide Peha        |  84541 |
| Tzvetan Zielinski    |  84456 |
| Kyoichi Maliniak     |  83735 |
| Kyoichi Maliniak     |  82621 |
| Sumant Peac          |  82507 |
| Cristinel Bouloucos  |  82163 |
| Georgi Facello       |  81097 |
| Georgi Facello       |  81025 |
| Sumant Peac          |  80944 |
| Duangkaew Piveteau   |  80324 |
| Kazuhide Peha        |  80305 |
| Tzvetan Zielinski    |  80083 |
| Georgi Facello       |  80013 |
| Duangkaew Piveteau   |  79580 |
| Tzvetan Zielinski    |  79513 |
| Cristinel Bouloucos  |  79510 |
| Sumant Peac          |  78335 |
| Kyoichi Maliniak     |  78228 |
| Duangkaew Piveteau   |  78194 |
| Kazuhito Cappelletti |  77935 |
| Kazuhide Peha        |  76957 |
| Georgi Facello       |  76884 |
| Kazuhito Cappelletti |  76826 |
| Sumant Peac          |  76518 |
| Kazuhito Cappelletti |  76381 |
| Georgi Facello       |  75994 |
| Tzvetan Zielinski    |  75582 |
| Cristinel Bouloucos  |  75538 |
| Duangkaew Piveteau   |  75405 |
| Georgi Facello       |  75286 |
| Sumant Peac          |  74612 |
| Duangkaew Piveteau   |  74347 |
| Georgi Facello       |  74333 |
| Chirstian Koblick    |  74057 |
| Tzvetan Zielinski    |  73362 |
| Kazuhito Cappelletti |  72946 |
| Kazuhide Peha        |  72804 |
| Kazuhide Peha        |  72585 |
| Bezalel Simmel       |  72527 |
| Duangkaew Piveteau   |  72488 |
| Bezalel Simmel       |  71963 |
| Sumant Peac          |  71434 |
| Cristinel Bouloucos  |  71380 |
| Georgi Facello       |  71046 |
| Kazuhito Cappelletti |  70889 |
| Sumant Peac          |  70889 |
| Chirstian Koblick    |  70698 |
| Tzvetan Zielinski    |  70220 |
| Chirstian Koblick    |  69722 |
| Bezalel Simmel       |  69366 |
| Kazuhide Peha        |  69276 |
| Sumant Peac          |  69042 |
| Eberhardt Terkki     |  68901 |
| Tzvetan Zielinski    |  68833 |
| Bezalel Simmel       |  67534 |
| Kazuhide Peha        |  67519 |
| Chirstian Koblick    |  67096 |
| Georgi Facello       |  66961 |
| Eberhardt Terkki     |  66744 |
| Georgi Facello       |  66596 |
| Sumant Peac          |  66302 |
| Georgi Facello       |  66074 |
| Bezalel Simmel       |  65909 |
| Bezalel Simmel       |  65828 |
| Kazuhide Peha        |  65739 |
| Sumant Peac          |  64780 |
| Sumant Peac          |  64604 |
| Tzvetan Zielinski    |  64563 |
| Chirstian Koblick    |  64340 |
| Tzvetan Zielinski    |  63475 |
| Eberhardt Terkki     |  63352 |
| Kazuhide Peha        |  63286 |
| Eberhardt Terkki     |  63274 |
| Tzvetan Zielinski    |  63208 |
| Tzvetan Zielinski    |  62745 |
| Chirstian Koblick    |  62566 |
| Georgi Facello       |  62102 |
| Kazuhide Peha        |  61648 |
| Kazuhide Peha        |  61361 |
| Kazuhide Peha        |  61244 |
| Kazuhide Peha        |  61217 |
| Sumant Peac          |  60929 |
| Chirstian Koblick    |  60770 |
| Tzvetan Zielinski    |  60740 |
| Berni Genin          |  60598 |
| Georgi Facello       |  60117 |
| Anneke Preusig       |  60098 |
| Anneke Preusig       |  59755 |
| Eberhardt Terkki     |  59571 |
| Eberhardt Terkki     |  59228 |
| Kazuhide Peha        |  59206 |
| Berni Genin          |  59142 |
| Chirstian Koblick    |  58326 |
| Anneke Preusig       |  58299 |
| Eberhardt Terkki     |  57590 |
| Berni Genin          |  56937 |
| Mary Sluis           |  56753 |
| Tzvetan Zielinski    |  56724 |
| Anneke Preusig       |  56032 |
| Kazuhide Peha        |  55881 |
| Patricio Bridgland   |  54794 |
| Chirstian Koblick    |  54693 |
| Mary Sluis           |  54545 |
| Patricio Bridgland   |  54423 |
| Berni Genin          |  53962 |
| Eberhardt Terkki     |  53957 |
| Anneke Preusig       |  53747 |
| Berni Genin          |  53228 |
| Saniya Kalloufi      |  52668 |
| Anneke Preusig       |  52255 |
| Chirstian Koblick    |  52119 |
| Mary Sluis           |  51470 |
| Patricio Bridgland   |  51122 |
| Mary Sluis           |  50927 |
| Berni Genin          |  50715 |
| Chirstian Koblick    |  50594 |
| Eberhardt Terkki     |  50351 |
| Lillian Haddadi      |  50032 |
| Eberhardt Terkki     |  49887 |
| Saniya Kalloufi      |  48584 |
| Chirstian Koblick    |  48271 |
| Berni Genin          |  48242 |
| Mary Sluis           |  48214 |
| Berni Genin          |  47921 |
| Anneke Preusig       |  47917 |
| Anneke Preusig       |  47518 |
| Patricio Bridgland   |  47364 |
| Eberhardt Terkki     |  47118 |
| Mayuko Warwick       |  47017 |
| Lillian Haddadi      |  46946 |
| Lillian Haddadi      |  46775 |
| Saniya Kalloufi      |  46671 |
| Patricio Bridgland   |  46485 |
| Patricio Bridgland   |  46460 |
| Eberhardt Terkki     |  46305 |
| Berni Genin          |  46168 |
| Chirstian Koblick    |  46065 |
| Anneke Preusig       |  45844 |
| Mayuko Warwick       |  44927 |
| Lillian Haddadi      |  44276 |
| Mary Sluis           |  44200 |
| Patricio Bridgland   |  44195 |
| Mayuko Warwick       |  43800 |
| Parto Bamford        |  43699 |
| Parto Bamford        |  43636 |
| Parto Bamford        |  43616 |
| Eberhardt Terkki     |  43569 |
| Parto Bamford        |  43478 |
| Parto Bamford        |  43466 |
| Parto Bamford        |  43311 |
| Anneke Preusig       |  42629 |
| Chirstian Koblick    |  42542 |
| Mary Sluis           |  42365 |
| Patricio Bridgland   |  42318 |
| Chirstian Koblick    |  42283 |
| Anneke Preusig       |  42085 |
| Patricio Bridgland   |  41867 |
| Mayuko Warwick       |  40647 |
| Eberhardt Terkki     |  40623 |
| Eberhardt Terkki     |  40561 |
| Eberhardt Terkki     |  40306 |
| Chirstian Koblick    |  40054 |
| Parto Bamford        |  40006 |
| Eberhardt Terkki     |  40000 |
| Anneke Preusig       |  40000 |
| Guoxiang Nooteboom   |  40000 |
| Patricio Bridgland   |  40000 |
| Mayuko Warwick       |  40000 |
+----------------------+--------+
*/

/**
 * //////////////////////////////////////////////////////////////////////////////////////
 * // Ερώτημα 5)                                                                       //
 * // Εμφάνιση του μέσου μισθού ανά υπάλληλο                                           //
 * // Ταξινόμηση των αποτελεσμάτων με βάση το επώνυμο του υπαλλήλου σε αύξουσα διάταξη //
 * //////////////////////////////////////////////////////////////////////////////////////
 */
SELECT
  `FIRST_NAME`,
  `LAST_NAME`,
  AVG(`SALARY`)
FROM
  `EMPLOYEES`,
  `SALARIES`
WHERE
  `EMPLOYEES`.`EMP_NO` = `SALARIES`.`EMP_NO`
GROUP BY
  `EMPLOYEES`.`EMP_NO`
ORDER BY
  `LAST_NAME` ASC;

/*
Output of: SELECT `FIRST_NAME`,  `LAST_NAME`, AVG(`SALARY`) FROM `EMPLOYEES`, `SALARIES` WHERE `EMPLOYEES`.`EMP_NO` = `SALARIES`.`EMP_NO` GROUP BY `EMPLOYEES`.`EMP_NO` ORDER BY `LAST_NAME` ASC;
+------------+-------------+---------------+
| FIRST_NAME | LAST_NAME   | AVG(`SALARY`) |
+------------+-------------+---------------+
| Parto      | Bamford     |    43030.2857 |
| Cristinel  | Bouloucos   |    87064.7000 |
| Patricio   | Bridgland   |    46902.8000 |
| Kazuhito   | Cappelletti |    74995.4000 |
| Georgi     | Facello     |    75388.9412 |
| Berni      | Genin       |    52990.3333 |
| Lillian    | Haddadi     |    47007.2500 |
| Saniya     | Kalloufi    |    49307.6667 |
| Chirstian  | Koblick     |    56512.2500 |
| Kyoichi    | Maliniak    |    87275.7692 |
| Guoxiang   | Nooteboom   |    40000.0000 |
| Sumant     | Peac        |    78284.5556 |
| Kazuhide   | Peha        |    68640.0625 |
| Duangkaew  | Piveteau    |    76723.0000 |
| Anneke     | Preusig     |    50514.9167 |
| Bezalel    | Simmel      |    68854.5000 |
| Mary       | Sluis       |    49782.0000 |
| Eberhardt  | Terkki      |    52431.5882 |
| Mayuko     | Warwick     |    43278.2000 |
| Tzvetan    | Zielinski   |    70826.7143 |
+------------+-------------+---------------+
*/

/**
 * //////////////////////////////////////////////////////////////////////////////////////////
 * // Ερώτημα 6)                                                                           //
 * // Με βάση το ερώτημα 5, εμφάνιση μόνο των υψηλόμισθων υπαλλήλων (μέσος μισθός > 50000) //
 * //////////////////////////////////////////////////////////////////////////////////////////
 */
SELECT
  `FIRST_NAME`,
  `LAST_NAME`,
  AVG(`SALARY`)
FROM
  `EMPLOYEES`,
  `SALARIES`
WHERE
  `EMPLOYEES`.`EMP_NO` = `SALARIES`.`EMP_NO`
GROUP BY
  `EMPLOYEES`.`EMP_NO`
HAVING
  AVG(`SALARY`) > 50000
ORDER BY
  `LAST_NAME` ASC;

/*
Output of: SELECT `FIRST_NAME`,  `LAST_NAME`, AVG(`SALARY`) FROM `EMPLOYEES`, `SALARIES` WHERE `EMPLOYEES`.`EMP_NO` = `SALARIES`.`EMP_NO` GROUP BY `EMPLOYEES`.`EMP_NO` HAVING AVG(`SALARY`) > 50000 ORDER BY `LAST_NAME` ASC;
+------------+-------------+---------------+
| FIRST_NAME | LAST_NAME   | AVG(`SALARY`) |
+------------+-------------+---------------+
| Cristinel  | Bouloucos   |    87064.7000 |
| Kazuhito   | Cappelletti |    74995.4000 |
| Georgi     | Facello     |    75388.9412 |
| Berni      | Genin       |    52990.3333 |
| Chirstian  | Koblick     |    56512.2500 |
| Kyoichi    | Maliniak    |    87275.7692 |
| Sumant     | Peac        |    78284.5556 |
| Kazuhide   | Peha        |    68640.0625 |
| Duangkaew  | Piveteau    |    76723.0000 |
| Anneke     | Preusig     |    50514.9167 |
| Bezalel    | Simmel      |    68854.5000 |
| Eberhardt  | Terkki      |    52431.5882 |
| Tzvetan    | Zielinski   |    70826.7143 |
+------------+-------------+---------------+
*/

/**
 * ////////////////////////////////////////////////////////
 * // Ερώτημα 7)                                         //
 * // Εμφάνιση των ονομάτων των διευθυντών της εταιρείας //
 * ////////////////////////////////////////////////////////
 */
SELECT
  `FIRST_NAME`,
  `LAST_NAME`
FROM
  `EMPLOYEES`,
  `DEPT_MANAGER`
WHERE
  `EMPLOYEES`.`EMP_NO` = `DEPT_MANAGER`.`EMP_NO`;

/*
Output of: SELECT `FIRST_NAME`, `LAST_NAME` FROM `EMPLOYEES`, `DEPT_MANAGER` WHERE `EMPLOYEES`.`EMP_NO` = `DEPT_MANAGER`.`EMP_NO`;
+------------+-----------+
| FIRST_NAME | LAST_NAME |
+------------+-----------+
| Georgi     | Facello   |
| Kyoichi    | Maliniak  |
| Tzvetan    | Zielinski |
| Duangkaew  | Piveteau  |
| Cristinel  | Bouloucos |
+------------+-----------+
*/

/**
 * ///////////////////////////////////////////////////////
 * // Ερώτημα 8)                                        //
 * // Εμφάνιση των ονομάτων των υπαλλήλων της εταιρείας //
 * ///////////////////////////////////////////////////////
 */
SELECT
  `FIRST_NAME`,
  `LAST_NAME`
FROM
  `EMPLOYEES`
LEFT JOIN
  `DEPT_MANAGER`
ON
  `EMPLOYEES`.`EMP_NO` = `DEPT_MANAGER`.`EMP_NO`
WHERE
  `DEPT_MANAGER`.`EMP_NO` IS NULL;

/*
Output of: SELECT `FIRST_NAME`, `LAST_NAME` FROM `EMPLOYEES` LEFT JOIN `DEPT_MANAGER` ON `EMPLOYEES`.`EMP_NO` = `DEPT_MANAGER`.`EMP_NO` WHERE `DEPT_MANAGER`.`EMP_NO` IS NULL;
+------------+-------------+
| FIRST_NAME | LAST_NAME   |
+------------+-------------+
| Bezalel    | Simmel      |
| Parto      | Bamford     |
| Chirstian  | Koblick     |
| Anneke     | Preusig     |
| Saniya     | Kalloufi    |
| Sumant     | Peac        |
| Mary       | Sluis       |
| Patricio   | Bridgland   |
| Eberhardt  | Terkki      |
| Berni      | Genin       |
| Guoxiang   | Nooteboom   |
| Kazuhito   | Cappelletti |
| Kazuhide   | Peha        |
| Lillian    | Haddadi     |
| Mayuko     | Warwick     |
| Kostas     | Tsiknas     |
| John       | Tsimperidis |
+------------+-------------+
*/

/**
 * ///////////////////////////////////////////////////////////////////////////////////////////
 * // Ερώτημα 9)                                                                            //
 * // Εμφάνιση των υπαλλήλων που ανήκουν σε κάποιο τμήμα της εταιρείας αλλά δεν πληρώνονται //
 * ///////////////////////////////////////////////////////////////////////////////////////////
 */
SELECT
  `EMPLOYEES`.`EMP_NO`,
  CONCAT(`EMPLOYEES`.`FIRST_NAME`, ' ', `EMPLOYEES`.`LAST_NAME`) AS `ON/MO`
FROM
  `EMPLOYEES`
LEFT JOIN
  `SALARIES`
ON
  `EMPLOYEES`.`EMP_NO` = `SALARIES`.`EMP_NO`
WHERE
  `SALARIES`.`EMP_NO` IS NULL;

/*
Output of: SELECT `EMPLOYEES`.`EMP_NO`, CONCAT(`EMPLOYEES`.`FIRST_NAME`, ' ', `EMPLOYEES`.`LAST_NAME`) AS `ON/MO` FROM `EMPLOYEES` LEFT JOIN `SALARIES` ON `EMPLOYEES`.`EMP_NO` = `SALARIES`.`EMP_NO` WHERE `SALARIES`.`EMP_NO` IS NULL;
+--------+------------------+
| EMP_NO | ON/MO            |
+--------+------------------+
|  10021 | Kostas Tsiknas   |
|  10022 | John Tsimperidis |
+--------+------------------+
*/

/**
 * ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 * // Ερώτημα 10)                                                                                                        //
 * // Εμφάνιση των ονομάτων των τμημάτων της εταιρείας και το πλήθος των υπαλλήλων που διαθέτουν, ταξινομημένα ανά τμήμα //
 * ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 */
SELECT
  `DEPARTMENTS`.`DEPT_NAME`,
  COUNT(*)
FROM
  `DEPARTMENTS`
JOIN
  `DEPT_EMP`
ON
  `DEPARTMENTS`.`DEPT_NO` = `DEPT_EMP`.`DEPT_NO`
GROUP BY
  `DEPT_NAME`;

/*
Output of: SELECT `DEPARTMENTS`.`DEPT_NAME`, COUNT(*) FROM `DEPARTMENTS` JOIN `DEPT_EMP` ON `DEPARTMENTS`.`DEPT_NO` = `DEPT_EMP`.`DEPT_NO` GROUP BY `DEPT_NAME`;
+-----------------+----------+
| DEPT_NAME       | COUNT(*) |
+-----------------+----------+
| Development     |        6 |
| Finance         |        4 |
| Human Resources |        5 |
| Marketing       |        6 |
| Production      |        5 |
+-----------------+----------+
*/

/**
 * //////////////////////////////////////////////////////////////////////////////////////////////////////////////
 * // Ερώτημα 11)                                                                                              //
 * // Όψη που επιστρέφει τα ονόματα τμημάτων που ανήκουν οι υπάλληλοι καθώς και τους αντίστοιχους μισθούς τους //
 * // Εύρεση του μικρότερου, του μεγαλύτερου και του μέσου μισθού ανά τμήμα                                    //
 * //////////////////////////////////////////////////////////////////////////////////////////////////////////////
 */
-- VIEW CREATION
CREATE VIEW
  `DEPARTMENTS_SALARIES`
AS
SELECT
  `DEPT_NAME`,
  `SALARY`
FROM
  `DEPARTMENTS`
JOIN
  `DEPT_EMP`
ON
  `DEPT_EMP`.`DEPT_NO` = `DEPARTMENTS`.`DEPT_NO`
JOIN
  `EMPLOYEES`
ON
  `EMPLOYEES`.`EMP_NO` = `DEPT_EMP`.`EMP_NO`
JOIN
  `SALARIES`
ON
  `SALARIES`.`EMP_NO` = `EMPLOYEES`.`EMP_NO`;

-- SELECTION
SELECT
  `DEPT_NAME` AS 'TMHMA',
  MIN(`SALARY`) AS 'MIN SALARY',
  MAX(`SALARY`) AS 'MAX SALARY',
  AVG(`SALARY`) AS 'AVERAGE SALARY'
FROM `DEPARTMENTS_SALARIES`
GROUP BY
 `DEPT_NAME`;

 /*
Output of: SELECT  `DEPT_NAME` AS 'TMHMA',  MIN(`SALARY`) AS 'MIN SALARY',  MAX(`SALARY`) AS 'MAX SALARY',  AVG(`SALARY`) AS 'AVERAGE SALARY'FROM `DEPARTMENTS_SALARIES`GROUP BY `DEPT_NAME`;
+-----------------+------------+------------+----------------+
| TMHMA           | MIN SALARY | MAX SALARY | AVERAGE SALARY |
+-----------------+------------+------------+----------------+
| Development     |      44276 |      94692 |     70620.7813 |
| Finance         |      42365 |      88070 |     66504.7500 |
| Human Resources |      40000 |      99651 |     61164.9167 |
| Marketing       |      40000 |      88958 |     61556.4211 |
| Production      |      40000 |      94443 |     63252.4648 |
+-----------------+------------+------------+----------------+
*/

/**
 * /////////////////////////////////////////////////////////////////////////////////////////////////////
 * // Ερώτημα 12)                                                                                     //
 * // Όψη που επιστρέφει τους μισθούς των υπαλλήλων που εργάζονται στο marketing                      //
 * // Εύρεση όλων των υπαλλήλων με μισθό μεγαλύτερο από τον μέγιστο μισθό των υπαλλήλων του marketing //
 * /////////////////////////////////////////////////////////////////////////////////////////////////////
 */
-- VIEW CREATION
CREATE VIEW
  `MARKETING_SALARIES`
AS
SELECT
  `SALARY`
FROM
  `DEPARTMENTS`
JOIN
  `DEPT_EMP`
ON
  `DEPT_EMP`.`DEPT_NO` = `DEPARTMENTS`.`DEPT_NO`
JOIN
  `EMPLOYEES`
ON
  `EMPLOYEES`.`EMP_NO` = `DEPT_EMP`.`EMP_NO`
JOIN
  `SALARIES`
ON
  `SALARIES`.`EMP_NO` = `EMPLOYEES`.`EMP_NO`
WHERE
  `DEPARTMENTS`.`DEPT_NAME`= 'MARKETING' ;

-- SELECTION
SELECT
  CONCAT(`FIRST_NAME`, ' ', `LAST_NAME`) AS 'ON/MO',
  `SALARY`
FROM
  `SALARIES`
JOIN
  `EMPLOYEES`
ON
  `EMPLOYEES`.`EMP_NO` = `SALARIES`.`EMP_NO`
WHERE `SALARY` > (SELECT MAX(`SALARY`) FROM `MARKETING_SALARIES`);

 /*
Output of: SELECT CONCAT(`FIRST_NAME`, ' ', `LAST_NAME`) AS 'ON/MO', `SALARY` FROM `SALARIES` JOIN `EMPLOYEES` ON `EMPLOYEES`.`EMP_NO` = `SALARIES`.`EMP_NO` WHERE `SALARY` > (SELECT MAX(`SALARY`) FROM `MARKETING_SALARIES`);
+---------------------+--------+
| ON/MO               | SALARY |
+---------------------+--------+
| Kyoichi Maliniak    |  89724 |
| Kyoichi Maliniak    |  90392 |
| Kyoichi Maliniak    |  90531 |
| Kyoichi Maliniak    |  91453 |
| Kyoichi Maliniak    |  94692 |
| Sumant Peac         |  89324 |
| Sumant Peac         |  90668 |
| Sumant Peac         |  93507 |
| Sumant Peac         |  94443 |
| Sumant Peac         |  94409 |
| Cristinel Bouloucos |  89619 |
| Cristinel Bouloucos |  91985 |
| Cristinel Bouloucos |  96122 |
| Cristinel Bouloucos |  98522 |
| Cristinel Bouloucos |  99651 |
+---------------------+--------+
*/
