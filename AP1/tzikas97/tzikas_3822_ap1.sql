/*
///////////////////////////////////////////////////
** ΑΣΚΗΣΗ ΠΡΑΞΗΣ Ι: ΕΝTOΛΕΣ OΡΙΣΜΟΥ ΔΕΔΟΜΕΝΩΝ (DDL)
** ΤΖΙΚΑΣ ΓΕΩΡΓΙΟΣ 3822
///////////////////////////////////////////////////
*/

CREATE DATABASE IF NOT EXISTS `tzikas_ap1_3822`;
USE `tzikas_ap1_3822`;

/*
///////////////////////////////
** Ερώτημα 1)
** Δημιουργία πίνακα EMPLOYEES
///////////////////////////////
*/

CREATE TABLE `EMPLOYEES`(
`FNAME` VARCHAR(15),
`LNAME` VARCHAR(15),
`SSN` CHAR(7) NOT NULL,
PRIMARY KEY (`SSN`)
);

/*
Output of: SHOW CREATE TABLE `EMPLOYEES`;
----------------------------------------
| employees | CREATE TABLE `employees` (
  `FNAME` varchar(15) DEFAULT NULL,
  `LNAME` varchar(15) DEFAULT NULL,
  `SSN` char(7) NOT NULL,
  `ADDRESS` varchar(250) DEFAULT NULL,
  `SALARY` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
----------------------------------------

Output of: DESCRIBE `EMPLOYEES`;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| FNAME | varchar(15) | YES  |     | NULL    |       |
| LNAME | varchar(15) | YES  |     | NULL    |       |
| SSN   | char(7)     | NO   | PRI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
*/

/*
///////////////////////////////
** Ερώτημα 2)
** Τροποποίηση πίνακα EMPLOYEES
///////////////////////////////
*/

ALTER TABLE `EMPLOYEES` ADD COLUMN `ADDRESS` VARCHAR(40) NULL;
ALTER TABLE `EMPLOYEES` ADD COLUMN `ADDRESS2` VARCHAR(40) NULL;
ALTER TABLE `EMPLOYEES` ADD COLUMN `SALARY` INT;

/*
Output of: SHOW CREATE TABLE `EMPLOYEES`;
----------------------------------------
| employees | CREATE TABLE `employees` (
  `FNAME` varchar(15) DEFAULT NULL,
  `LNAME` varchar(15) DEFAULT NULL,
  `SSN` char(7) NOT NULL,
  `ADDRESS` varchar(40) DEFAULT NULL,
  `ADDRESS2` varchar(40) DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `EMPLOYEES`;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| FNAME    | varchar(15) | YES  |     | NULL    |       |
| LNAME    | varchar(15) | YES  |     | NULL    |       |
| SSN      | char(7)     | NO   | PRI | NULL    |       |
| ADDRESS  | varchar(40) | YES  |     | NULL    |       |
| ADDRESS2 | varchar(40) | YES  |     | NULL    |       |
| SALARY   | int(11)     | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
*/

/*
///////////////////////////////
** Ερώτημα 3)
** Τροποποίηση πίνακα EMPLOYEES
** Διαγραφή στήλης ADDRESS2
** Τροποποίηση στήλης ADDRESS
** Τροποποίηση στήλης SALARY
///////////////////////////////
*/

ALTER TABLE `EMPLOYEES` DROP COLUMN `ADDRESS2`;
ALTER TABLE `EMPLOYEES` MODIFY COLUMN `ADDRESS` VARCHAR(250) NULL;
ALTER TABLE `EMPLOYEES` MODIFY COLUMN `SALARY` DECIMAL(10,2) NULL;

/*
Output of: SHOW CREATE TABLE `EMPLOYEES`;
----------------------------------------
| employees | CREATE TABLE `employees` (
  `FNAME` varchar(15) DEFAULT NULL,
  `LNAME` varchar(15) DEFAULT NULL,
  `SSN` char(7) NOT NULL,
  `ADDRESS` varchar(250) DEFAULT NULL,
  `SALARY` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `EMPLOYEES`;
+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| FNAME   | varchar(15)   | YES  |     | NULL    |       |
| LNAME   | varchar(15)   | YES  |     | NULL    |       |
| SSN     | char(7)       | NO   | PRI | NULL    |       |
| ADDRESS | varchar(250)  | YES  |     | NULL    |       |
| SALARY  | decimal(10,2) | YES  |     | NULL    |       |
+---------+---------------+------+-----+---------+-------+
*/

/*
////////////////////////////////
** Ερώτημα 4)
** Δημιουργία πίνακα DEPARTMENTS
////////////////////////////////
*/

CREATE TABLE `DEPARTMENTS`( 
`DNUMBER` INT NOT NULL, 
`DNAME` VARCHAR(30) NOT NULL, 
`DSSN` CHAR(7) NOT NULL,
`MGRSTARTDATE` DATE NULL,
PRIMARY KEY (`DNUMBER`),
CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`DSSN`) REFERENCES `employees` (`SSN`)
);

/*
Output of: SHOW CREATE TABLE `DEPARTMENTS`;
----------------------------------------
| DEPARTMENTS | CREATE TABLE `departments` (
  `DNUMBER` int(11) NOT NULL,
  `DNAME` varchar(30) NOT NULL,
  `DSSN` char(7) NOT NULL,
  `MGRSTARTDATE` date DEFAULT NULL,
  PRIMARY KEY (`DNUMBER`),
  KEY `DSSN` (`DSSN`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`DSSN`) REFERENCES `employees` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `DEPARTMENTS`;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| DNUMBER      | int(11)     | NO   | PRI | NULL    |       |
| DNAME        | varchar(30) | NO   |     | NULL    |       |
| DSSN         | char(7)     | NO   | MUL | NULL    |       |
| MGRSTARTDATE | date        | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
*/


/*
/////////////////////////////////////////////////////////////////////////////////////////
** Ερώτημα 5)
** Διαγραφή πίνακα EMPLOYEES
** Η εντολή DROP δεν λειτουργεί διότι υπάρχει το ξένο κλειδί DSSN στον πίνακα DEPARTMENTS
** Για να γίνει διαγραφή:
/////////////////////////////////////////////////////////////////////////////////////////
*/

#ALTER TABLE `DEPARTMENTS` DROP FOREIGN KEY `departments_ibfk_1`;
#ALTER TABLE `DEPARTMENTS` DROP COLUMN `DSSN`;
#Τώρα μπορώ να διαγράψω τον πίνακα EMPLOYEES με: DROP TABLE `EMPLOYEES`

/*
//////////////////////////////////
** Ερώτημα 6)
** Τροποποίηση πίνακα EMPLOYEES
** Ορισμός αναφορικής ακεραιότητας
//////////////////////////////////
*/

ALTER TABLE `EMPLOYEES` ADD COLUMN `DNO` INT NOT NULL;
ALTER TABLE `EMPLOYEES` ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DNO`) REFERENCES `DEPARTMENTS` (`DNUMBER`);

/*
Output of: SHOW CREATE TABLE `EMPLOYEES`;
----------------------------------------
| EMPLOYEES | CREATE TABLE `employees` (
  `FNAME` varchar(15) DEFAULT NULL,
  `LNAME` varchar(15) DEFAULT NULL,
  `SSN` char(7) NOT NULL,
  `ADDRESS` varchar(250) DEFAULT NULL,
  `SALARY` decimal(10,2) DEFAULT NULL,
  `DNO` int(11) NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `employees_ibfk_1` (`DNO`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DNO`) REFERENCES `departments` (`DNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `EMPLOYEES`;
+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| FNAME   | varchar(15)   | YES  |     | NULL    |       |
| LNAME   | varchar(15)   | YES  |     | NULL    |       |
| SSN     | char(7)       | NO   | PRI | NULL    |       |
| ADDRESS | varchar(250)  | YES  |     | NULL    |       |
| SALARY  | decimal(10,2) | YES  |     | NULL    |       |
| DNO     | int(11)       | NO   | MUL | NULL    |       |
+---------+---------------+------+-----+---------+-------+
*/

/*
///////////////////////////////////////////////
** Ερώτημα 7)
** Διαγραφή στήλης DNO από τον πίνακα EMPLOYEES
** Για να γίνει διαγραφή:
///////////////////////////////////////////////
*/

ALTER TABLE `EMPLOYEES` DROP FOREIGN KEY `employees_ibfk_1`;
ALTER TABLE `EMPLOYEES` DROP COLUMN `DNO`;

/*
Output of: SHOW CREATE TABLE `EMPLOYEES`;
----------------------------------------
| EMPLOYEES | CREATE TABLE `employees` (
  `FNAME` varchar(15) DEFAULT NULL,
  `LNAME` varchar(15) DEFAULT NULL,
  `SSN` char(7) NOT NULL,
  `ADDRESS` varchar(250) DEFAULT NULL,
  `SALARY` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `EMPLOYEES`;
+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| FNAME   | varchar(15)   | YES  |     | NULL    |       |
| LNAME   | varchar(15)   | YES  |     | NULL    |       |
| SSN     | char(7)       | NO   | PRI | NULL    |       |
| ADDRESS | varchar(250)  | YES  |     | NULL    |       |
| SALARY  | decimal(10,2) | YES  |     | NULL    |       |
+---------+---------------+------+-----+---------+-------+
*/

/*
//////////////////////////////////////
** Ερώτημα 8)
** Δημιουργία πίνακα PROJECTS, WORK_ON
** Ορισμός αναφορικής ακεραιότητας
//////////////////////////////////////
*/

CREATE TABLE PROJECTS(
DNUMBER INT NOT NULL,
PRIMARY KEY (DNUMBER)
);

/*
Output of: SHOW CREATE TABLE `PROJECTS`;
----------------------------------------
| PROJECTS | CREATE TABLE `projects` (
  `DNUMBER` int(11) NOT NULL,
  PRIMARY KEY (`DNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `PROJECTS`;
+---------+---------+------+-----+---------+-------+
| Field   | Type    | Null | Key | Default | Extra |
+---------+---------+------+-----+---------+-------+
| DNUMBER | int(11) | NO   | PRI | NULL    |       |
+---------+---------+------+-----+---------+-------+
*/

CREATE TABLE `WORK_ON` (
`ESSN` CHAR(7) NOT NULL,
`DNO` INT NOT NULL,
PRIMARY KEY (`ESSN` , `DNO`),
FOREIGN KEY (`ESSN`) REFERENCES `EMPLOYEES` (`SSN`),
FOREIGN KEY (`DNO`)	REFERENCES `PROJECTS` (`DNUMBER`)
);

/*
Output of: SHOW CREATE TABLE `WORK_ON`;
----------------------------------------
| WORK_ON | CREATE TABLE `work_on` (
  `ESSN` char(7) NOT NULL,
  `DNO` int(11) NOT NULL,
  PRIMARY KEY (`ESSN`,`DNO`),
  KEY `DNO` (`DNO`),
  CONSTRAINT `work_on_ibfk_1` FOREIGN KEY (`ESSN`) REFERENCES `employees` (`SSN`),
  CONSTRAINT `work_on_ibfk_2` FOREIGN KEY (`DNO`) REFERENCES `projects` (`DNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `WORK_ON`;
+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| ESSN  | char(7) | NO   | PRI | NULL    |       |
| DNO   | int(11) | NO   | PRI | NULL    |       |
+-------+---------+------+-----+---------+-------+
*/