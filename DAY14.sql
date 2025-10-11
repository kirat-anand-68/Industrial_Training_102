Window Functions (Analytical SQL)
Explain the Concept:

Window functions allow performing aggregations without grouping — useful for analytics dashboards and ranking.
  -- Rank employees based on salary
SELECT 
    name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM Employees;

-- Running total (cumulative sum)
SELECT 
    customer_id,
    order_date,
    SUM(amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_total
FROM Orders;

opics to Mention:

RANK(), DENSE_RANK(), ROW_NUMBER()

NTILE() for quartiles/percentiles

LEAD() and LAG() for comparing previous or next row values

OVER() and PARTITION BY usage

CTE (Common Table Expressions) and Recursive Queries
🔹 Explain:

CTEs make complex queries readable and reusable.
  WITH DepartmentAverage AS (
    SELECT dept_id, AVG(salary) AS avg_sal
    FROM Employees
    GROUP BY dept_id
)
SELECT e.name, e.salary, d.avg_sal
FROM Employees e
JOIN DepartmentAverage d ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_sal;

Recursive Example (Hierarchy or Tree Structures):
  
WITH RECURSIVE EmployeeHierarchy AS (
    SELECT emp_id, name, manager_id, 1 AS level
    FROM Employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.emp_id, e.name, e.manager_id, h.level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy h ON e.manager_id = h.emp_id
)
SELECT * FROM EmployeeHierarchy;

Query Optimization and Indexing Concepts
🔹 Add Theory + Practice:

What is indexing?

Clustered vs Non-clustered indexes

Use of EXPLAIN PLAN or EXPLAIN keyword

Importance of query cost and performance tuning

CREATE INDEX idx_salary ON Employees(salary);

EXPLAIN SELECT * FROM Employees WHERE salary > 50000;

SQL Views and Materialized Views
CREATE VIEW ActiveCustomers AS
SELECT name, email, last_purchase_date
FROM Customers
WHERE status = 'Active';

