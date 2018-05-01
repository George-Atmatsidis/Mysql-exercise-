/**
 * /////////////////////////////////////////////////////////////////
 * // ΑΣΚΗΣΗ ΠΡΑΞΗΣ ΙΙ: ΕΝΤΟΛΕΣ ΟΡΙΣΜΟΥ ΚΑΙ ΔΙΑΧΕΙΡΙΣΗΣ ΔΕΔΟΜΕΝΩΝ //
 * // ΤΖΙΚΑΣ ΓΕΩΡΓΙΟΣ 3822                                        //
 * /////////////////////////////////////////////////////////////////
 */

/**
 * ///////////////////////
 * // DATABASE CREATION //
 * ///////////////////////
 */
CREATE DATABASE IF NOT EXISTS `tzikas_ap2_3822`;
USE `tzikas_ap2_3822`;

/**
 * ////////////////////
 * // TABLE CREATION //
 * ////////////////////
 */
CREATE TABLE IF NOT EXISTS `CUSTOMER`(
  `CSTID` INT,
  `CSTNAME` VARCHAR(100),
  `CSTAGE` DECIMAL(3,1),
  PRIMARY KEY (`CSTID`)
);

CREATE TABLE IF NOT EXISTS `ROOM`(
  `RMID` INT, 
  `RMNAME` VARCHAR(100), 
  `RMSIZE` DECIMAL(4, 1), 
  PRIMARY KEY(`RMID`)
);

/**
 * ///////////////////
 * // TABLE INSERTS //
 * ///////////////////
 */
INSERT INTO
  `CUSTOMER`
(
  `CSTID`,
  `CSTNAME`,
  `CSTAGE`
)
VALUES
  (1, 'Dimitrioy Nick', 30),
  (2, 'Antonioy Chrysa', 45),
  (3, 'Petropoylos Kostas', 28),
  (4, 'Makaridis Nick', NULL);

INSERT INTO
  `ROOM`
(
  `RMID`,
  `RMNAME`,
  `RMSIZE`
)
VALUES
  (1, 'Victoria', 150.2),
  (2, 'Kentayros', 97.5),
  (3, 'Sensations', 120.0);

/**
 * ////////////////////////////////////////////
 * // Ερώτημα 1)                             //
 * // Αλλαγή τύπου στήλης 'rmSize' στον ROOM //
 * ////////////////////////////////////////////
 */
ALTER TABLE 
  `ROOM` 
MODIFY COLUMN
  `RMSIZE` INT;

/*
Output of: SHOW CREATE TABLE `ROOM`;
----------------------------------------
| ROOM  | CREATE TABLE `room` (
  `RMID` int(11) NOT NULL,
  `RMNAME` varchar(100) DEFAULT NULL,
  `RMSIZE` int(11) DEFAULT NULL,
  PRIMARY KEY (`RMID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `ROOM`;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| RMID   | int(11)      | NO   | PRI | NULL    |       |
| RMNAME | varchar(100) | YES  |     | NULL    |       |
| RMSIZE | int(11)      | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+

Output of: SELECT * FROM `ROOM`;
+------+------------+--------+
| RMID | RMNAME     | RMSIZE |
+------+------------+--------+
|    1 | Victoria   |    150 |
|    2 | Kentayros  |     98 |
|    3 | Sensations |    120 |
+------+------------+--------+
*/

-- Παρατηρείται πως γίνεται μετατροπή της στήλης RMSIZE από DECIMAL σε INT με στρογγυλοποίηση των τιμών της.

ALTER TABLE 
  `ROOM` 
MODIFY COLUMN
  `RMSIZE` DECIMAL(5, 2);

/*
Output of: SHOW CREATE TABLE `ROOM`;
----------------------------------------
| ROOM  | CREATE TABLE `room` (
  `RMID` int(11) NOT NULL,
  `RMNAME` varchar(100) DEFAULT NULL,
  `RMSIZE` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`RMID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `ROOM`;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| RMID   | int(11)      | NO   | PRI | NULL    |       |
| RMNAME | varchar(100) | YES  |     | NULL    |       |
| RMSIZE | decimal(5,2) | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+

Output of: SELECT * FROM `ROOM`;
+------+------------+--------+
| RMID | RMNAME     | RMSIZE |
+------+------------+--------+
|    1 | Victoria   | 150.00 |
|    2 | Kentayros  |  98.00 |
|    3 | Sensations | 120.00 |
+------+------------+--------+
*/

-- Παρατηρείται πως γίνεται μετατροπή της στήλης RMSIZE από INT σε DECIMAL με την προσθήκη μηδενικών στις τιμές της.

/**
 * //////////////////////////////////
 * // Ερώτημα 2)                   //
 * // Εισαγωγή δεδομένων στον ROOM //
 * //////////////////////////////////
 */
INSERT INTO
  `ROOM`
(
  `RMID`,
  `RMNAME`,
  `RMSIZE`
)
VALUES
  (4, 'Pantheon', 100);

/*
Output of: SHOW CREATE TABLE `ROOM`;
----------------------------------------
| ROOM  | CREATE TABLE `room` (
  `RMID` int(11) NOT NULL,
  `RMNAME` varchar(100) DEFAULT NULL,
  `RMSIZE` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`RMID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `ROOM`;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| RMID   | int(11)      | NO   | PRI | NULL    |       |
| RMNAME | varchar(100) | YES  |     | NULL    |       |
| RMSIZE | decimal(5,2) | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+

Output of: SELECT * FROM `ROOM`;
+------+------------+--------+
| RMID | RMNAME     | RMSIZE |
+------+------------+--------+
|    1 | Victoria   | 150.00 |
|    2 | Kentayros  |  98.00 |
|    3 | Sensations | 120.00 |
|    4 | Pantheon   | 100.00 |
+------+------------+--------+
*/

/**
 * //////////////////////////////////////////
 * // Ερώτημα 3)                           //
 * // Αντικατάσταση εγγραφής στον CUSTOMER //
 * //////////////////////////////////////////
 */
UPDATE
  `CUSTOMER`
SET
  `CSTNAME` = 'Adamoglou Katerina',
  `CSTAGE` = 22
WHERE
  `CSTID` = 3;

/*
Output of: SHOW CREATE TABLE `CUSTOMER`;
----------------------------------------
| CUSTOMER | CREATE TABLE `customer` (
  `CSTID` int(11) NOT NULL,
  `CSTNAME` varchar(100) DEFAULT NULL,
  `CSTAGE` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`CSTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `CUSTOMER`;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| CSTID   | int(11)      | NO   | PRI | NULL    |       |
| CSTNAME | varchar(100) | YES  |     | NULL    |       |
| CSTAGE  | decimal(3,1) | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+

Output of: SELECT * FROM `CUSTOMER`;
+-------+--------------------+--------+
| CSTID | CSTNAME            | CSTAGE |
+-------+--------------------+--------+
|     1 | Dimitrioy Nick     |   30.0 |
|     2 | Antonioy Chrysa    |   45.0 |
|     3 | Adamoglou Katerina |   22.0 |
|     4 | Makaridis Nick     |   NULL |
+-------+--------------------+--------+
*/

/**
 * /////////////////////////////////////
 * // Ερώτημα 4)                      //
 * // Διόρθωση εγγραφής στον CUSTOMER //
 * /////////////////////////////////////
 */
UPDATE
  `CUSTOMER`
SET
  `CSTNAME` = 'Marinakis Eyaggelos',
  `CSTAGE` = 38
WHERE
  `CSTID` = 4;

/*
Output of: SHOW CREATE TABLE `CUSTOMER`;
----------------------------------------
| CUSTOMER | CREATE TABLE `customer` (
  `CSTID` int(11) NOT NULL,
  `CSTNAME` varchar(100) DEFAULT NULL,
  `CSTAGE` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`CSTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `CUSTOMER`;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| CSTID   | int(11)      | NO   | PRI | NULL    |       |
| CSTNAME | varchar(100) | YES  |     | NULL    |       |
| CSTAGE  | decimal(3,1) | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+

Output of: SELECT * FROM `CUSTOMER`;
+-------+---------------------+--------+
| CSTID | CSTNAME             | CSTAGE |
+-------+---------------------+--------+
|     1 | Dimitrioy Nick      |   30.0 |
|     2 | Antonioy Chrysa     |   45.0 |
|     3 | Adamoglou Katerina  |   22.0 |
|     4 | Marinakis Eyaggelos |   38.0 |
+-------+---------------------+--------+
*/

/**
 * //////////////////////////////////////////////////////
 * // Ερώτημα 5)                                       //
 * // Προσθήκη στήλης 'beds' στον ROOM με default τιμή //
 * //////////////////////////////////////////////////////
 */
ALTER TABLE 
  `ROOM` 
ADD COLUMN
  `BEDS` INT DEFAULT 2;

/*
Output of: SHOW CREATE TABLE `ROOM`;
----------------------------------------
| ROOM  | CREATE TABLE `room` (
  `RMID` int(11) NOT NULL,
  `RMNAME` varchar(100) DEFAULT NULL,
  `RMSIZE` decimal(5,2) DEFAULT NULL,
  `BEDS` int(11) DEFAULT '2',
  PRIMARY KEY (`RMID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `ROOM`;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| RMID   | int(11)      | NO   | PRI | NULL    |       |
| RMNAME | varchar(100) | YES  |     | NULL    |       |
| RMSIZE | decimal(5,2) | YES  |     | NULL    |       |
| BEDS   | int(11)      | YES  |     | 2       |       |
+--------+--------------+------+-----+---------+-------+

Output of: SELECT * FROM `ROOM`;
+------+------------+--------+------+
| RMID | RMNAME     | RMSIZE | BEDS |
+------+------------+--------+------+
|    1 | Victoria   | 150.00 |    2 |
|    2 | Kentayros  |  98.00 |    2 |
|    3 | Sensations | 120.00 |    2 |
|    4 | Pantheon   | 100.00 |    2 |
+------+------------+--------+------+
*/

/**
 * //////////////////////////////////////////////////////////
 * // Ερώτημα 6)                                           //
 * // Αλλαγή τιμής της 'beds' για εγγραφές με rmId 1 και 3 //
 * //////////////////////////////////////////////////////////
 */
UPDATE
  `ROOM`
SET
  `BEDS` = 3
WHERE
  `RMID` IN(1,3);

/*
Output of: SHOW CREATE TABLE `ROOM`;
----------------------------------------
| ROOM  | CREATE TABLE `room` (
  `RMID` int(11) NOT NULL,
  `RMNAME` varchar(100) DEFAULT NULL,
  `RMSIZE` decimal(5,2) DEFAULT NULL,
  `BEDS` int(11) DEFAULT '2',
  PRIMARY KEY (`RMID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `ROOM`;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| RMID   | int(11)      | NO   | PRI | NULL    |       |
| RMNAME | varchar(100) | YES  |     | NULL    |       |
| RMSIZE | decimal(5,2) | YES  |     | NULL    |       |
| BEDS   | int(11)      | YES  |     | 2       |       |
+--------+--------------+------+-----+---------+-------+

Output of: SELECT * FROM `ROOM`;
+------+------------+--------+------+
| RMID | RMNAME     | RMSIZE | BEDS |
+------+------------+--------+------+
|    1 | Victoria   | 150.00 |    3 |
|    2 | Kentayros  |  98.00 |    2 |
|    3 | Sensations | 120.00 |    3 |
|    4 | Pantheon   | 100.00 |    2 |
+------+------------+--------+------+
*/

/**
 * ///////////////////////////////////////////////////////////
 * // Ερώτημα 7)                                            //
 * // Υλοποίηση συσχέτισης BOOK με επιπλέον γνώρισμα bkDate //
 * ///////////////////////////////////////////////////////////
 */
CREATE TABLE IF NOT EXISTS `BOOK`(
  `CID` INT,
  `RID` INT,
  `BKDATE` DATE,
  PRIMARY KEY (`CID`, `RID`),
  FOREIGN KEY (`CID`) REFERENCES `CUSTOMER` (`CSTID`),
  FOREIGN KEY (`RID`) REFERENCES `ROOM` (`RMID`)
);

/*
Output of: SHOW CREATE TABLE `BOOK`;
----------------------------------------
| BOOK  | CREATE TABLE `book` (
  `CID` int(11) NOT NULL,
  `RID` int(11) NOT NULL,
  `BKDATE` date DEFAULT NULL,
  PRIMARY KEY (`CID`,`RID`),
  KEY `RID` (`RID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CSTID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`RID`) REFERENCES `room` (`RMID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `BOOK`;
+--------+---------+------+-----+---------+-------+
| Field  | Type    | Null | Key | Default | Extra |
+--------+---------+------+-----+---------+-------+
| CID    | int(11) | NO   | PRI | NULL    |       |
| RID    | int(11) | NO   | PRI | NULL    |       |
| BKDATE | date    | YES  |     | NULL    |       |
+--------+---------+------+-----+---------+-------+
*/

/**
 * /////////////////////////////////
 * // Ερώτημα 8)                  //
 * // Προσθήκη δεδομένων στη BOOK //
 * /////////////////////////////////
 */
INSERT INTO
  `BOOK`
(
  `CID`,
  `RID`,
  `BKDATE`
)
VALUES
  (3, 2, '2018-01-18'),
  (3, 3, '2018-02-21'),
  (4, 1, '2018-03-10'),
  (4, 3, '2018-04-05'),
  (1, 2, '2018-01-25'),
  (1, 4, '2018-02-10'),
  (2, 2, '2018-03-08'),
  (2, 4, '2018-04-06');

/*
Output of: SHOW CREATE TABLE `BOOK`;
----------------------------------------
| BOOK  | CREATE TABLE `book` (
  `CID` int(11) NOT NULL,
  `RID` int(11) NOT NULL,
  `BKDATE` date DEFAULT NULL,
  PRIMARY KEY (`CID`,`RID`),
  KEY `RID` (`RID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CSTID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`RID`) REFERENCES `room` (`RMID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `BOOK`;
+--------+---------+------+-----+---------+-------+
| Field  | Type    | Null | Key | Default | Extra |
+--------+---------+------+-----+---------+-------+
| CID    | int(11) | NO   | PRI | NULL    |       |
| RID    | int(11) | NO   | PRI | NULL    |       |
| BKDATE | date    | YES  |     | NULL    |       |
+--------+---------+------+-----+---------+-------+

Output of: SELECT * FROM `BOOK`;
+-----+-----+------------+
| CID | RID | BKDATE     |
+-----+-----+------------+
|   1 |   2 | 2018-01-25 |
|   1 |   4 | 2018-02-10 |
|   2 |   2 | 2018-03-08 |
|   2 |   4 | 2018-04-06 |
|   3 |   2 | 2018-01-18 |
|   3 |   3 | 2018-02-21 |
|   4 |   1 | 2018-03-10 |
|   4 |   3 | 2018-04-05 |
+-----+-----+------------+
*/

/**
 * //////////////////////////////////////////////////
 * // Ερώτημα 9)                                   //
 * // Απόπειρα αφαίρεσης εγγραφής από τον CUSTOMER //
 * //////////////////////////////////////////////////
 */
-- Η εντολή DELETE δεν λειτουργεί διότι υπάρχει το ξένο κλειδί CID στον πίνακα BOOK
-- Για να γίνει διαγραφή:
-- Προσθέτω την λειτουργία ON DELETE CASCADE
-- και προαιρετικά για ενημέρωση:
-- Προσθέτω την λειτουργία ON UPDATE CASCADE

-- Διαγραφή του τρέχοντος περιορισμού:
ALTER TABLE
  `BOOK`
  DROP FOREIGN KEY
  `BOOK_IBFK_1`;

/*
Output of: SHOW CREATE TABLE `BOOK`;
----------------------------------------
| book  | CREATE TABLE `book` (
  `CID` int(11) NOT NULL,
  `RID` int(11) NOT NULL,
  `BKDATE` date DEFAULT NULL,
  PRIMARY KEY (`CID`,`RID`),
  KEY `RID` (`RID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`RID`) REFERENCES `room` (`RMID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------
*/

-- Δημιουργία του ίδιου περιορισμού με ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE
  `BOOK`
  ADD FOREIGN KEY (`CID`)
  REFERENCES CUSTOMER (`CSTID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

/*
Output of: SHOW CREATE TABLE `BOOK`;
----------------------------------------
| book  | CREATE TABLE `book` (
  `CID` int(11) NOT NULL,
  `RID` int(11) NOT NULL,
  `BKDATE` date DEFAULT NULL,
  PRIMARY KEY (`CID`,`RID`),
  KEY `RID` (`RID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`RID`) REFERENCES `room` (`RMID`),
  CONSTRAINT `book_ibfk_3` FOREIGN KEY (`CID`) REFERENCES `customer` (`CSTID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------
*/

-- Τώρα μπορώ να διαγράψω την εγγραφή με CSTID=4 από τον πίνακα CUSTOMER με:
DELETE FROM `CUSTOMER` WHERE `CSTID`=4;

/*
Output of: SELECT * FROM `CUSTOMER`;
+-------+--------------------+--------+
| CSTID | CSTNAME            | CSTAGE |
+-------+--------------------+--------+
|     1 | Dimitrioy Nick     |   30.0 |
|     2 | Antonioy Chrysa    |   45.0 |
|     3 | Adamoglou Katerina |   22.0 |
+-------+--------------------+--------+
*/

/**
 * /////////////////////////////////////////////////////////
 * // Ερώτημα 10)                                         //
 * // Δημιουργία συσχέτισης ACCOMPANIED (1:Ν με CUSTOMER) //
 * /////////////////////////////////////////////////////////
 */
CREATE TABLE IF NOT EXISTS `ACCOMPANIED`(
  `CID` INT,
  `ACNAME` VARCHAR(100),
  `ACAGE` DECIMAL(3,1),
  PRIMARY KEY (`CID`, `ACNAME`),
  FOREIGN KEY (`CID`) REFERENCES `CUSTOMER` (`CSTID`)
);

/*
Output of: SHOW CREATE TABLE `ACCOMPANIED`;
----------------------------------------
| ACCOMPANIED | CREATE TABLE `accompanied` (
  `CID` int(11) NOT NULL,
  `ACNAME` varchar(100) NOT NULL,
  `ACAGE` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`CID`,`ACNAME`),
  CONSTRAINT `accompanied_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CSTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `ACCOMPANIED`;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| CID    | int(11)      | NO   | PRI | NULL    |       |
| ACNAME | varchar(100) | NO   | PRI | NULL    |       |
| ACAGE  | decimal(3,1) | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
*/

/**
 * /////////////////////////////////////
 * // Ερώτημα 11)                      //
 * // Προσθήκη τιμών στην ACCOMPANIED //
 * /////////////////////////////////////
 */

INSERT INTO
  `CUSTOMER`
(
  `CSTID`,
  `CSTNAME`,
  `CSTAGE`
)
VALUES
  (5, 'Nikou Kostas', 40);

INSERT INTO
  `ACCOMPANIED`
(
  `CID`,
  `ACNAME`,
  `ACAGE`
)
VALUES
  (2, 'Antonioy John', 8),
  (2, 'Antonioy Maria', 11),
  (5, 'Nikou George', 15),
  (5, 'Nikou Eleni', 6);

/*
Output of: SHOW CREATE TABLE `ACCOMPANIED`;
----------------------------------------
| ACCOMPANIED | CREATE TABLE `accompanied` (
  `CID` int(11) NOT NULL,
  `ACNAME` varchar(100) NOT NULL,
  `ACAGE` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`CID`,`ACNAME`),
  CONSTRAINT `accompanied_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CSTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
----------------------------------------

Output of: DESCRIBE `ACCOMPANIED`;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| CID    | int(11)      | NO   | PRI | NULL    |       |
| ACNAME | varchar(100) | NO   | PRI | NULL    |       |
| ACAGE  | decimal(3,1) | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+

Output of: SELECT * FROM `ACCOMPANIED`;
+-----+----------------+-------+
| CID | ACNAME         | ACAGE |
+-----+----------------+-------+
|   2 | Antonioy John  |   8.0 |
|   2 | Antonioy Maria |  11.0 |
|   5 | Nikou Eleni    |   6.0 |
|   5 | Nikou George   |  15.0 |
+-----+----------------+-------+
*/
