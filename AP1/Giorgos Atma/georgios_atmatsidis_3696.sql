/*
ΟΝΟΜΑ: ΓΕΩΡΓΙΟΣ
ΕΠΩΝΥΜΟ: ΑΤΜΑΤΣΙΔΗΣ
ΑΕΜ: 3696
Email: georgatma.gr@gmail.com
*/
CREATE DATABASE atmatsidis; 
USE atmatsidis;
###############################################################################################################
# ΑΣΚΗΣΗ 1
###############################################################################################################
CREATE TABLE EMPLOYEES( 
FNAME VARCHAR(15), 
LNAME VARCHAR(15),
SSN INT(7) NOT NULL,
PRIMARY KEY (SSN)
);
SHOW CREATE TABLE EMPLOYEES;
/*
				::----->OUTPUT<-----::
# Table, Create Table
EMPLOYEES, CREATE TABLE `EMPLOYEES` (
  `FNAME` varchar(15) DEFAULT NULL,
  `LNAME` varchar(15) DEFAULT NULL,
  `SSN` int(7) NOT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/
###############################################################################################################
#ΑΣΚΗΣΗ 2
###############################################################################################################
ALTER TABLE EMPLOYEES ADD COLUMN(
 ADDRESS VARCHAR(40) NULL,
 ADDRESS2 VARCHAR(40) NULL,
 SALARY INT NULL
 );
 SHOW CREATE TABLE EMPLOYEES;
/*
				::----->OUTPUT<-----::
# Table, Create Table
EMPLOYEES, CREATE TABLE `EMPLOYEES` (
  `FNAME` varchar(15) DEFAULT NULL,
  `LNAME` varchar(15) DEFAULT NULL,
  `SSN` int(7) NOT NULL,
  `ADDRESS` varchar(40) DEFAULT NULL,
  `ADDRESS2` varchar(40) DEFAULT NULL,
  `SALARY` int(11) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1              
*/
###############################################################################################################
#ΑΣΚΗΣΗ 3
###############################################################################################################
ALTER TABLE EMPLOYEES DROP ADDRESS2;
ALTER TABLE EMPLOYEES MODIFY SALARY DECIMAL(8,2) NULL;
ALTER TABLE EMPLOYEES MODIFY ADDRESS VARCHAR(250) NULL;

SHOW CREATE TABLE EMPLOYEES;

/*
				::----->OUTPUT<-----::
# Table, Create Table
EMPLOYEES, CREATE TABLE `EMPLOYEES` (
  `FNAME` varchar(15) DEFAULT NULL,
  `LNAME` varchar(15) DEFAULT NULL,
  `SSN` int(7) NOT NULL,
  `ADDRESS` varchar(250) DEFAULT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

*/
###############################################################################################################
#ΑΣΚΗΣΗ 4 
###############################################################################################################
/*
Λόγο της ολικής συμμετοχής στο Department ο πίνακας Employees θα δώσει το πρωτεύων κλειδί του ως ξένο στον Department.
Για αυτό θα πρέπει να έχω  ένα γνώρισμα στον Department το EMPNO.
Αρχικά θα φτιάξω πρώτα τον πίνακα DEPARTMENTS μέτα την σχέση MANAGE (επείδη έχει Γνώρισμα) και τέλος θα βάλω τους περιορισμούς.
*/
CREATE TABLE DEPARTMENTS( 
DNUMBER INTEGER NOT NULL, 
DNAME VARCHAR(30) NOT NULL, 
EMPNO INT(7) NOT NULL,
PRIMARY KEY (DNUMBER)
);
SHOW CREATE TABLE DEPARTMENTS;
/*
				::----->OUTPUT<-----::
# Table, Create Table
DEPARTMENTS, CREATE TABLE `DEPARTMENTS` (
  `DNUMBER` int(11) NOT NULL,
  `DNAME` varchar(30) NOT NULL,
  `EMPNO` int(7) NOT NULL,
  PRIMARY KEY (`DNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/

# Πίνακας Σχέσης EMPLOYEE-DEPARTMENTS
CREATE TABLE MANAGE (
	MGSTARTDATE DATE NOT NULL,
	EMPNO INT(7) NOT NULL,
	DNUMBER INTEGER NOT NULL,
	PRIMARY KEY (MGSTARTDATE)
);
SHOW CREATE TABLE MANAGE;
/*
				::----->OUTPUT<-----::
# Table, Create Table
MANAGE, CREATE TABLE `MANAGE` (
  `MGSTARTDATE` date NOT NULL,
  `EMPNO` int(7) NOT NULL,
  `DNUMBER` int(11) NOT NULL,
  PRIMARY KEY (`MGSTARTDATE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/

# Τώρα θα βάλω τους περιορισμούς των πινάκων
ALTER TABLE DEPARTMENTS ADD CONSTRAINT departments_const FOREIGN KEY (EMPNO) REFERENCES EMPLOYEES (SSN);
ALTER TABLE MANAGE ADD CONSTRAINT manage_const FOREIGN KEY (EMPNO) REFERENCES EMPLOYEES (SSN);
ALTER TABLE MANAGE ADD CONSTRAINT manage_const1 FOREIGN KEY (DNUMBER) REFERENCES DEPARTMENTS (DNUMBER);
#Προβολή πινάκων μετά την εισαγωγή περιορισμών.
SHOW CREATE TABLE DEPARTMENTS;
/*
				::----->OUTPUT<-----::
# Table, Create Table
DEPARTMENTS, CREATE TABLE `DEPARTMENTS` (
  `DNUMBER` int(11) NOT NULL,
  `DNAME` varchar(30) NOT NULL,
  `EMPNO` int(7) NOT NULL,
  PRIMARY KEY (`DNUMBER`),
  KEY `departments_const` (`EMPNO`),
  CONSTRAINT `departments_const` FOREIGN KEY (`EMPNO`) REFERENCES `EMPLOYEES` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

*/
SHOW CREATE TABLE MANAGE;
/*
				::----->OUTPUT<-----::
# Table, Create Table
MANAGE, CREATE TABLE `MANAGE` (
  `MGSTARTDATE` date NOT NULL,
  `EMPNO` int(7) NOT NULL,
  `DNUMBER` int(11) NOT NULL,
  PRIMARY KEY (`MGSTARTDATE`),
  KEY `manage_const` (`EMPNO`),
  KEY `manage_const1` (`DNUMBER`),
  CONSTRAINT `manage_const` FOREIGN KEY (`EMPNO`) REFERENCES `EMPLOYEES` (`SSN`),
  CONSTRAINT `manage_const1` FOREIGN KEY (`DNUMBER`) REFERENCES `DEPARTMENTS` (`DNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/
###############################################################################################################
#ΑΣΚΗΣΗ 5
###############################################################################################################
/*Δεν γίνεται η διαγράφη του πίνακα EMPLOYEES γιατί δίνει το κλειδί του στο DEPARTMENTS.
για να γίνει η διαγραφή θα πρέπει να διαγράψω τον περιορισμό departments_const
Δεν εκτελώ την εντολή γιατί θα χρειαστώ τον πίνακα EMPLOYEES για την επόμενη άσκηση.
Κατά την εκτέλεση::
Προσπαθώντας να σβήσω το EMPLOYEES παίρνω το μηνυμα:
	DROP TABLE EMPLOYEES Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails
Για να μπορέσω να κάνω διαγραφή τον πίνακα EMPLOYEES θα πρέπει να βγάλω το ξένο κλειδί (foreign key):

	ALTER TABLE DEPARTMENTS DROP FOREIGN KEY departments_const;
    
Τώρα μπορώ να κάνω διαγραφή τον πίνακα EMPLOYEES

		DROP TABLE EMPLOYEES;	
*/

###############################################################################################################
#ΑΣΚΗΣΗ 6
###############################################################################################################
#Ο EMPLOYEES σημμετέχει ολικά στο DEPARTMENTS.
#
ALTER TABLE EMPLOYEES ADD DNO INTEGER NOT NULL; # Δημιουργώ ένα καινούργιο γνώρισμα που θα δεχτεί το ξένο κλειδί.
ALTER TABLE EMPLOYEES ADD CONSTRAINT employees_const FOREIGN KEY (DNO) REFERENCES DEPARTMENTS (DNUMBER); # Δημιουργία περιορισμού
SHOW CREATE TABLE EMPLOYEES;
/*
				::----->OUTPUT<-----::
# Table, Create Table
EMPLOYEES, CREATE TABLE `EMPLOYEES` (
  `FNAME` varchar(15) DEFAULT NULL,
  `LNAME` varchar(15) DEFAULT NULL,
  `SSN` int(7) NOT NULL,
  `ADDRESS` varchar(250) DEFAULT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `DNO` int(11) NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `employees_const` (`DNO`),
  CONSTRAINT `employees_const` FOREIGN KEY (`DNO`) REFERENCES `DEPARTMENTS` (`DNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

*/

###############################################################################################################
#ΑΣΚΗΣΗ 7
###############################################################################################################
# Για την διαγραφή του DNO θα πρέπει να κάνω:
ALTER TABLE EMPLOYEES DROP FOREIGN KEY employees_const;
ALTER TABLE EMPLOYEES DROP DNO;
SHOW CREATE TABLE EMPLOYEES;
/*
				::----->OUTPUT<-----::
# Table, Create Table
EMPLOYEES, CREATE TABLE `EMPLOYEES` (
  `FNAME` varchar(15) DEFAULT NULL,
  `LNAME` varchar(15) DEFAULT NULL,
  `SSN` int(7) NOT NULL,
  `ADDRESS` varchar(250) DEFAULT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/
###############################################################################################################
#ΑΣΚΗΣΗ 8
###############################################################################################################
CREATE TABLE PROJECT(
DNUMBER INT(7) NOT NULL,
PRIMARY KEY (DNUMBER)
);
SHOW CREATE TABLE PROJECT;
/*
				::----->OUTPUT<-----::
# Table, Create Table
PROJECT, CREATE TABLE `PROJECT` (
  `DNUMBER` int(7) NOT NULL,
  PRIMARY KEY (`DNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/
#  Επειδή είναι πολλά προς πολλά η Σχέση works_on θα γίνει πίνακας.
CREATE TABLE WORKS_ON(
PROJECT_ID INT (7) NOT NULL,
EMPNO INT(7) NOT NULL,
PRIMARY KEY(PROJECT_ID,EMPNO),
FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT(DNUMBER),
FOREIGN KEY (EMPNO) REFERENCES EMPLOYEES(SSN)
);
SHOW CREATE TABLE WORKS_ON;
/*
				::----->OUTPUT<-----::
# Table, Create Table
WORKS_ON, CREATE TABLE `WORKS_ON` (
  `PROJECT_ID` int(7) NOT NULL,
  `EMPNO` int(7) NOT NULL,
  PRIMARY KEY (`PROJECT_ID`,`EMPNO`),
  KEY `EMPNO` (`EMPNO`),
  CONSTRAINT `WORKS_ON_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`DNUMBER`),
  CONSTRAINT `WORKS_ON_ibfk_2` FOREIGN KEY (`EMPNO`) REFERENCES `EMPLOYEES` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/

#drop database atmatsidis;
