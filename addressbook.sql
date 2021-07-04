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

#UC6
SELECT * FROM address_book WHERE City = 'Ahmadnagar';
SELECT * FROM address_book WHERE State = 'Madhya Pradesh';

#UC7
SELECT City,COUNT(*) FROM address_book WHERE City = 'Jalgaon';
SELECT State,COUNT(*) FROM address_book WHERE State = 'Madhya Pradesh';

#UC-8
SELECT * FROM address_book ORDER BY Fname;
SELECT * FROM address_book WHERE City = 'Jalgaon' ORDER BY Fname;

#UC9
ALTER TABLE address_book ADD address_book_name VARCHAR(50) NOT NULL AFTER Email;
ALTER TABLE address_book ADD address_book_type VARCHAR(50) NOT NULL AFTER address_book_name;

DESC address_book;
SELECT * FROM address_book;

UPDATE address_book SET address_book_name = 'AB1' WHERE Fname = 'Paresh' OR Fname = 'Snehal';
UPDATE address_book SET address_book_name = 'AB2' WHERE Fname = 'Sakshi' OR Fname = 'Animesh';
UPDATE address_book SET address_book_name = 'AB3' WHERE Fname = 'Nakul';

UPDATE address_book SET address_book_type = 'Friends' WHERE address_book_name = 'AB1';
UPDATE address_book SET address_book_type = 'Work' WHERE address_book_name = 'AB2';
UPDATE address_book SET address_book_type = 'Family' WHERE address_book_name = 'AB3';

#UC10
SELECT address_book_type,COUNT(*) FROM address_book WHERE address_book_type = 'Friends';

#UC11
CREATE TABLE address_book_friends(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    address_book_id INT ,
    FOREIGN KEY (address_book_id) REFERENCES address_book(Id)
);
INSERT INTO address_book_friends (address_book_id) VALUES ('101'),('104');
SELECT * FROM address_book_friends;

CREATE table address_book_family(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    address_book_id INT ,
    FOREIGN KEY (address_book_id) REFERENCES address_book(Id)
);
INSERT INTO address_book_family (address_book_id) VALUES ('105');
SELECT * FROM address_book_family;

CREATE table address_book_work(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    address_book_id INT ,
    FOREIGN KEY (address_book_id) REFERENCES address_book(Id)
);
INSERT INTO address_book_work (address_book_id) VALUES ('102'),('103');
SELECT * FROM address_book_work;

#UC12
#ER DIAGRAM

#UC13
#Redoing UC6, Retrieving data from address book using city or state..
SELECT * FROM address_book a1, address_book_work w1 WHERE a1.Id = w1.address_book_id  AND City = 'Jalgaon';

#Redoing UC7, Count by city or state..
SELECT City,COUNT(*) AS count FROM address_book a1, address_book_friends f1 WHERE a1.Id = f1.address_book_id  AND City = 'Ahmadnagar';

#Redoing UC8, Sort by first name..
SELECT * FROM address_book a1, address_book_friends f1 WHERE a1.Id = f1.address_book_id ORDER BY Fname;
