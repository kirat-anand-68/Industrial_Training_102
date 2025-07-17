SELECT department_id, COUNT(*) 
FROM employees 
GROUP BY department_id;
***************************************
SELECT department_id, COUNT(*) 
FROM employees 
GROUP BY department_id 
HAVING COUNT(*) > 5;
****************************************
SELECT first_name AS Name, salary AS "Employee Salary"
FROM employees;

SELECT e.name, d.name 
FROM employees AS e 
JOIN departments AS d 
ON e.department_id = d.department_id;
**********************************************
