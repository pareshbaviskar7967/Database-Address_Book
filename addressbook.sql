#Welcome to the address book

#UC-1
CREATE DATABASE address_book_service;
USE address_book_service;

#UC-2
CREATE TABLE address_book (
  Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Fname VARCHAR(50) NOT NULL,
  Lname VARCHAR(50) NOT NULL,
  Address VARCHAR(50) NOT NULL,
  City VARCHAR(50) NOT NULL,
  State VARCHAR(50) NOT NULL,
  Pin INT NOT NULL,
  Mobile VARCHAR(17) NOT NULL UNIQUE,
  Email VARCHAR(50)
);

#UC3
INSERT INTO address_book (Id, Fname, Lname, Address, City, State, Pin, Mobile, Email)
VALUES (101,'Paresh','22kar','Sagar park','Jalgaon','Maharashtra',425001,'8708095441','paresh@email'),
       (102,'Sakshi','Mujumdar','Adarsh nagar','Jalgaon','Maharashtra',425001,'987654321','sakshi@email'),
       (103,'Animesh','Vipradas','Aryan park','Jalgaon','Maharashtra',425001,'9786542315','animesh@email'),
       (104,'Snehal','Kale','Sagar park','Jalgaon','Maharashtra',425001,'9564984532','snehal@email'),
       (105,'Nakul','Upadhyay','Inner ring road','Indore','Madhya Pradesh',425001,'123456789','nakul@email');
SELECT * FROM address_book;

#UC4
UPDATE address_book
SET Address = 'MalbarHill area'
WHERE Fname = 'Snehal';
SELECT * FROM address_book;

#UC5
INSERT INTO address_book (Id, Fname, Lname, Address, City, State, Pin, Mobile, Email)
VALUES (106,'Pratham','Naik','Area','City','State',425001,'1238529637','name@email');
SELECT * FROM address_book;

DELETE FROM address_book
WHERE Fname = 'Pratham';

