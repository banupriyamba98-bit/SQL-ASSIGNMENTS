CREATE DATABASE IF NOT EXISTS EMPLOYEE;
USE EMPLOYEE;

CREATE TABLE IF NOT EXISTS Departments (
Department_id int PRIMARY KEY,
Department_name Varchar(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS LOCATION (
Location_id int AUTO_INCREMENT PRIMARY KEY,
Location Varchar(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS EMPLOYEES(
Employee_id int PRIMARY KEY,
Employee_name Varchar(50) NOT NULL,
Gender enum("M","F") NOT NULL,
Age int NOT NULL CHECK (Age>=18),
Hire_date date DEFAULT (Current_date),
Designation Varchar(100),
Department_id int NOT NULL,
Location_id int NOT NULL,
FOREIGN KEY(Department_id) REFERENCES Departments(Department_id),
FOREIGN KEY(Location_id) REFERENCES Location(Location_id),
Salary Decimal(10,2) NOT NULL
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');

INSERT INTO location (location) VALUES Department_id
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Pune');

INSERT INTO employees (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) VALUES
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
(5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
(5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
(5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
(5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
(5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
(5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
(5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
(5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
(5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
(5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
(5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
(5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
(5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
(5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
(5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
(5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
(5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
(5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
(5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
(5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
(5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
(5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
(5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
(5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
(5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
(5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
(5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
(5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);


SELECT DISTINCT SALARY FROM EMPLOYEES;

SELECT Age AS Employee_Age, Salary AS Employee_Salary FROM Employees;

SELECT * FROM EMPLOYEES
WHERE Salary > 50000.00 AND Hire_date <'2016-01-01';

SELECT * FROM EMPLOYEES
WHERE Designation IS NULL OR Designation = "Data Scientist";

SELECT * FROM EMPLOYEES 
ORDER BY 
Department_id ASC, Salary DESC;

SELECT * FROM EMPLOYEES 
WHERE YEAR(Hire_date) = '2018'
ORDER BY Hire_date
LIMIT 5;

SELECT SUM(EMPLOYEES.Salary) AS TOTAL_SALARY
FROM EMPLOYEES
INNER JOIN Departments
ON EMPLOYEES.Department_id = Departments.Department_id
WHERE Department_name = "Finance";

SELECT MIN(Age) AS Minimum_age FROM EMPLOYEES;

SELECT L.Location_name, MAX(E.Salary) AS Maximum_Salary
FROM EMPLOYEES E
INNER JOIN Location L
ON E.Location_id = L. Location_id
GROUP BY Location_name;

SELECT Designation, AVG(Salary) AS Average_Salary 
FROM EMPLOYEES
GROUP BY Designation
HAVING Designation LIKE '%Analyst%';	

SELECT D.Department_name, Count(Employee_id) AS Employee_Count
FROM Departments D
left JOIN EMPLOYEES E
ON D.Department_id = E.Department_id
GROUP BY Department_name
HAVING Count(Employee_id)<3;

SELECT L.Location_name, E.Gender, AVG(E.Age) AS Average_age
FROM Location L
JOIN EMPLOYEES E
ON L.Location_id = E.Location_id
WHERE Gender ='F'
GROUP BY L.Location_name
HAVING AVG(E.Age)<30;

SELECT E.Employee_name, E.Designation, D.Department_name
FROM EMPLOYEES E
INNER JOIN Departments D
ON E.Department_id = D.Department_id;

SELECT D.Department_name, COUNT(E.Employee_id) AS Total_Employees 
FROM Departments D
LEFT JOIN EMPLOYEES E
ON D.Department_id = E.Department_id
GROUP BY D.Department_name;

SELECT L.Location_name, E.Employee_name 
FROM EMPLOYEES E
RIGHT JOIN Location L
ON L.Location_id = E.Location_id;

SELECT * FROM Departments;
SELECT * FROM LOCATION;
SELECT * FROM Employees;
