CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;
CREATE TABLE DEPARTMENTS (
Department_id int,
Department_name VARCHAR(100)
);

CREATE TABLE LOCATION (
Location_id int,
Location VARCHAR(30)
);

CREATE TABLE EMPLOYEES (
Employee_id int,
Employee_name VARCHAR(50),
Gender enum("M","F"),
Age int,
Hire_date date,
Designation VARCHAR(100),
Department_id int,
Location_id int,
Salary decimal(10,2)
);

ALTER TABLE EMPLOYEES ADD COLUMN Email VARCHAR(50);
ALTER TABLE EMPLOYEES MODIFY COLUMN Designation VARCHAR(200);
ALTER TABLE EMPLOYEES DROP COLUMN Age;
ALTER TABLE EMPLOYEES RENAME COLUMN Hire_date to Date_of_joining;

RENAME TABLE DEPARTMENTS TO DEPARTMENTS_INFO;
RENAME TABLE LOCATION TO LOCATIONS;

TRUNCATE TABLE EMPLOYEES;
  
DROP TABLE EMPLOYEES;
 
CREATE DATABASE IF NOT EXISTS EMPLOYEE;
USE EMPLOYEE;

CREATE TABLE IF NOT EXISTS Departments (
Department_id int PRIMARY KEY,
Department_name Varchar(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS LOCATION (
Location_id int AUTO_INCREMENT PRIMARY KEY,
Location_name Varchar(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS EMPLOYEES(
Employee_id int PRIMARY KEY,
Employee_name Varchar(50) NOT NULL,
Gender enum("M","F") NOT NULL,
Age int NOT NULL CHECK (Age>=18),
Hire_date date DEFAULT (Current_date),
Designation Varchar(100) NOT NULL,
Department_id int NOT NULL,
Location_id int NOT NULL,
FOREIGN KEY(Department_id) REFERENCES Departments(Department_id),
FOREIGN KEY(Location_id) REFERENCES Location(Location_id),
Salary Decimal(10,2) NOT NULL
);
