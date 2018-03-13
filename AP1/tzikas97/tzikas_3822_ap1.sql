/*
** ΑΣΚΗΣΗ ΠΡΑΞΗΣ Ι: ΕΝTOΛΕΣ OΡΙΣΜΟΥ ΔΕΔΟΜΕΝΩΝ (DDL)
** ΤΖΙΚΑΣ ΓΕΩΡΓΙΟΣ 3822
*/
CREATE DATABASE IF NOT EXISTS `ap1_3822`;
USE `ap1_3822`;

/*
** Ερώτημα 1)
** Δημιουργία πίνακα EMPLOYEES
*/
CREATE TABLE `EMPLOYEES`(
`FNAME` VARCHAR(15),
`LNAME` VARCHAR(15),
`SSN` CHAR(7) NOT NULL,
PRIMARY KEY (`SSN`)
);
/*
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| FNAME | varchar(15) | YES  |     | NULL    |       |
| LNAME | varchar(15) | YES  |     | NULL    |       |
| SSN   | char(7)     | NO   | PRI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
*/

/*
** Ερώτημα 2)
** Τροποποίηση πίνακα EMPLOYEES
*/
ALTER TABLE `EMPLOYEES` ADD COLUMN `ADDRESS` VARCHAR(40) NULL;
ALTER TABLE `EMPLOYEES` ADD COLUMN `ADDRESS2` VARCHAR(40) NULL;
ALTER TABLE `EMPLOYEES` ADD COLUMN `SALARY` INT NULL;
/*
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
** Ερώτημα 3)
** Τροποποίηση πίνακα EMPLOYEES
** Διαγραφή στήλης ADDRESS2
** Τροποποίηση στήλης ADDRESS
** Τροποποίηση στήλης SALARY
*/
ALTER TABLE `EMPLOYEES` DROP COLUMN `ADDRESS2`;
ALTER TABLE `EMPLOYEES` MODIFY COLUMN `ADDRESS` VARCHAR(250) NULL;
ALTER TABLE `EMPLOYEES` MODIFY COLUMN `SALARY` DECIMAL(10,2) NULL;
/*
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
** Ερώτημα 4)
** Δημιουργία πίνακα DEPARTMENTS
*/
CREATE TABLE `DEPARTMENTS`( 
`DNUMBER` INTEGER NOT NULL, 
`DNAME` VARCHAR(30) NOT NULL, 
PRIMARY KEY (`DNUMBER`),
CONSTRAINT `FK_DNUMBER` FOREIGN KEY (`DNUMBER`) REFERENCES `EMPLOYEES` (`SSN`)
);
/*
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| DNUMBER | int(11)     | NO   | PRI | NULL    |       |
| DNAME   | varchar(30) | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
*/

/*
** Ερώτημα 5)
** Διαγραφή πίνακα EMPLOYEES
** Η εντολή DROP δεν λειτουργεί διότι υπάρχει το ξένο κλειδί DNUMBER στον πίνακα DEPARTMENTS
** Για να γίνει διαγραφή:
*/
ALTER TABLE `DEPARTMENTS` DROP FOREIGN KEY `FK_DNUMBER`;
ALTER TABLE `DEPARTMENTS` DROP COLUMN `DNUMBER`;
/*
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| DNAME | varchar(30) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
*/

# Εντολές ώστε να δουλέψει το ερώτημα 6
ALTER TABLE `DEPARTMENTS` ADD COLUMN `DNUMBER` INT(11) NOT NULL;
ALTER TABLE `DEPARTMENTS` ADD PRIMARY KEY (`DNUMBER`);
/*
** Ερώτημα 6)
** Τροποποίηση πίνακα EMPLOYEES
** Ορισμός αναφορικής ακεραιότητας
*/
ALTER TABLE `EMPLOYEES` ADD CONSTRAINT `FK_DNUMBER2` FOREIGN KEY (`SSN`) REFERENCES `DEPARTMENTS` (`DNUMBER`);
/*
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
** Ερώτημα 7)
** Διαγραφή στήλης SSN από τον πίνακα EMPLOYEES
** Για να γίνει διαγραφή:
*/
ALTER TABLE `EMPLOYEES` DROP FOREIGN KEY `FK_DNUMBER2`;
ALTER TABLE `EMPLOYEES` DROP COLUMN `SSN`;
/*
+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| FNAME   | varchar(15)   | YES  |     | NULL    |       |
| LNAME   | varchar(15)   | YES  |     | NULL    |       |
| ADDRESS | varchar(250)  | YES  |     | NULL    |       |
| SALARY  | decimal(10,2) | YES  |     | NULL    |       |
+---------+---------------+------+-----+---------+-------+
*/

# Εντολές ώστε να δουλέψει το ερώτημα 8
ALTER TABLE `EMPLOYEES` ADD COLUMN `SSN` CHAR(7) NOT NULL;
ALTER TABLE `EMPLOYEES` ADD PRIMARY KEY (`SSN`);


/*
** Ερώτημα 8)
** Δημιουργία πίνακα PROJECTS, WORK_ON
** Ορισμός αναφορικής ακεραιότητας
*/

CREATE TABLE `PROJECTS` (
`PNAME` VARCHAR(50) NOT NULL,
`PNUMBER` INT(11) NOT NULL,
`PLOCATION` VARCHAR(15) DEFAULT NULL,
`DNUM` INT(11) NOT NULL,
PRIMARY KEY (`PNUMBER`),
UNIQUE KEY `PNAME` (`PNAME`),
KEY `DNUM` (`DNUM`)
);
/*
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| PNAME     | varchar(50) | NO   | UNI | NULL    |       |
| PNUMBER   | int(11)     | NO   | PRI | NULL    |       |
| PLOCATION | varchar(15) | YES  |     | NULL    |       |
| DNUM      | int(11)     | NO   | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
*/

CREATE TABLE `WORK_ON` (
`ESSN` CHAR(7) NOT NULL,
`PNO` INT NOT NULL,
`HOURS` DECIMAL(3,1) NOT NULL,
PRIMARY KEY (`ESSN` , `PNO`),
FOREIGN KEY (`ESSN`) REFERENCES `EMPLOYEES` (`SSN`),
FOREIGN KEY (`PNO`)	REFERENCES `PROJECTS` (`PNUMBER`)
);
/*
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| ESSN  | char(7)      | NO   | PRI | NULL    |       |
| PNO   | int(11)      | NO   | PRI | NULL    |       |
| HOURS | decimal(3,1) | NO   |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
*/
