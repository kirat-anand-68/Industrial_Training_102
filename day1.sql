-- DAY 1: SQL PRACTICE QUERIES

-- Create a sample table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);


INSERT INTO Employees VALUES (1, 'Alice', 'Smith', 'Sales', 40000);
INSERT INTO Employees VALUES (2, 'Bob', 'Johnson', 'Marketing', 50000);
INSERT INTO Employees VALUES (3, 'Charlie', 'Williams', 'Sales', 35000);
INSERT INTO Employees VALUES (4, 'David', 'Brown', 'HR', 45000);
INSERT INTO Employees VALUES (5, 'Eva', 'Jones', 'IT', 60000);

SELECT * FROM Employees;

-- 2. Select specific columns
SELECT first_name, last_name FROM Employees;

-- 3. Use WHERE clause to filter
SELECT * FROM Employees WHERE department = 'Sales';

-- 4. Use LIKE to filter names starting with 'A'
SELECT * FROM Employees WHERE first_name LIKE 'A%';

-- 5. Use BETWEEN to filter salaries between 35000 and 50000
SELECT * FROM Employees WHERE salary BETWEEN 35000 AND 50000;

-- 6. Use IN to find specific departments
SELECT * FROM Employees WHERE department IN ('Sales', 'IT');

-- 7. Use NOT EQUAL
SELECT * FROM Employees WHERE department != 'HR';

-- 8. ORDER BY salary ascending
SELECT * FROM Employees ORDER BY salary ASC;

-- 9. ORDER BY salary descending
SELECT * FROM Employees ORDER BY salary DESC;
