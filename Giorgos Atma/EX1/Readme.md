create database exercise1;
use exercise1;

1)
create table EMPLOYEES( #δημιουργια πινακα Employees
FNAME varchar(15), # δημιουργια στηλης Fname μεταβλητου μηκους χαρακτηρων 15
LNAME varchar(15), #δημιουργια στηλης Lname μεταβλητου μηκους χαρακτηρων 15
SSN int(7) not null, #δημιουργια στηλης Ssn σταθερου μηκους 7,με ιδιοτητα NOT NULL
primary key (SSN)
);

2)
alter table EMPLOYEES add ADDRESS varchar(40) null; #προσθηκη στηλης ADDRESS 
alter table EMPLOYEES add ADDRESS2 varchar(40) null; προσθηκη στηλης ADDRESS2 
alter table EMPLOYEES add SALARY int null; προσθηκη στηλης SALARY

3)
alter table EMPLOYEES drop ADDRESS2;
alter table EMPLOYEES modify ADDRESS varchar(250) null;
alter table EMPLOYEES modify SALARY decimal(8,2) null;

4)
create table DEPARTMENTS( 
DNUMBER integer not null, 
DNAME varchar(30) not null, 
primary key (DNUMBER)
);



