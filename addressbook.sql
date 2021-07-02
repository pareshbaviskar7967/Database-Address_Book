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