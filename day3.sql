SELECT * FROM employees
WHERE department = 'HR' AND salary > 50000;
**********************************************
SELECT * FROM products
WHERE price BETWEEN 100 AND 500;
*******************************************
SELECT * FROM employees
WHERE department IN ('IT', 'HR', 'Sales');
*******************************************
SELECT * FROM customers
WHERE name LIKE 'S%'; -- starts with S
**********************************************
SELECT * FROM orders
WHERE delivery_date IS NULL;
******************************************
SELECT * FROM employees
ORDER BY salary DESC;
