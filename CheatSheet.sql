create database CHEATSHEET;
USE CHEATSHEET;

-- ALTER database CHEATSHEET 
 -- DROP DATABASE CHEATSHEET
 
 CREATE TABLE EMPLOYEES(
	employee_id int primary key,
    First_name varchar(29),
    last_name varchar(29),
    dep varchar(29),
    salary decimal(10,2)
 );
 
INSERT INTO employees (employee_id, first_name, last_name, dep, salary)
VALUES
  (1, 'John', 'Doe', 'HR', 50000.00),
  (2, 'Jane', 'Smith', 'IT', 60000.00),
  (3, 'Alice', 'Johnson', 'Finance', 55000.00),
  (4, 'Bob', 'Williams', 'IT', 62000.00),
  (5, 'Emily', 'Brown', 'HR', 48000.00);
  
  ALTER TABLE employeeS
  ADD COLUMN position VARCHAR(40);
  
  -- drop table employees
  
    SELECT*FROM employees;
    SELECT distinct DEP FROM employees;
    SELECT * FROM employees WHERE salary > 55000.00;
    SELECT * FROM employees LIMIT 3;
    SELECT * FROM employees 
    limit 10
    OFFSEt 2; -- OFFSET: Skip A Specified Number Of Rows Before Returning The Result Set
 
 SELECT 
 FIRST_NAME,
 LAST_NAME,
 CASE
 WHEN SALARY > 5500 THEN 'HIGH'
 WHEN SALARY > 5000 THEN 'MID'
ELSE 'LOW'
END AS SALARY_CATEGORY
FROM employees;

SELECT*FROM EMPLOYEES;
SET SQL_SAFE_UPDATES = 0; -- TO RE-ENABLE SET SQL_SAFE_UPDATES = 1;

UPDATE EMPLOYEES
SET POSITION = CASE
WHEN DEP = 'HR' THEN 'HR Specialist'
WHEN DEP ='IT' THEN 'IT Support'
WHEN DEP ='Finance' THEN 'Manager'
ELSE POSITION -- Keeps the current position if the department does not match any case
END;
SELECT * FROM EMPLOYEES;
 
 UPDATE employees
SET salary = 55000.00
WHERE employee_id = 1;
 
 DELETE FROM employees
WHERE employee_id = 5;
 
 SELECT * FROM employees
WHERE DEP = 'IT';

SELECT * FROM employees
WHERE first_name LIKE 'J%';

SELECT * FROM employees
WHERE dep IN ('HR', 'Finance');

SELECT * FROM employees
WHERE dep IS NULL;

SELECT dep, COUNT(*) AS employee_count
FROM employees
GROUP BY dep;

SELECT SUM(salary) FROM employees;

SELECT FIRST_NAME, MIN(salary) FROM employees
GROUP BY FIRST_NAME;

SELECT AVG(salary) FROM employees;


SELECT* FROM employeeS
WHERE SALARY = ( SELECT MIN(SALARY) FROM EMPLOYEES);

DROP TABLE EMPLOYEES;
-- RELATIONSHIPS

CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(50)
);

CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

ALTER TABLE EMPLOYEES
ADD COLUMN EMAIL VARCHAR(50) UNIQUE; 

SELECT * FROM EMPLOYEES;

ALTER TABLE EMPLOYEES
ADD COLUMN AGE INT CHECK (AGE>=18);

SELECT*FROM departments;

INSERT INTO departments VALUES 
(2,'HR');

INSERT INTO EMPLOYEES VALUES 
(1,'AHMAD','ALI','2','REEEEEEEE','17'); -- Error Code: 3819. Check constraint 'employees_chk_1' is violated.

INSERT INTO EMPLOYEES VALUES 
(1,'AHMAD','ALI','2','REEEEEEEE','20'); -- okay 

SELECT *FROM EMPLOYEES;

-- String patterns 

SELECT * from employees 
where first_name like 'A%'; -- get the row where the first name starts with A . this is a wild card charecter 

SELECT * from employees 
where first_name like '%A';

SELECT * from employees 
where AGE >=19 AND department_id = 2;


SELECT * from employees 
order by age desc;

-- Date and Time Built-in Functions
-- DATE : YYYYMMDD
-- TIME : HHMMSS
-- TIMESTAMP :  YYYYMMDD HHMMSSZZZZZZ( Z IS MICRO SECONDS)

-- FUNCTIONS :  Year() ,Month() , Day(), DayOfMonth() , DayOfWeek(), DayOfYear() , Week() , Hour() , Minute() , Second()
 
 -- SubQuires 
 
 select employee_id from employees
  where age = ( select MIN(age) from employees); 
  
  -- nested select
  
  select employee_id from employees 
	where age > (select avg(age) from employees);
    
-- joins

