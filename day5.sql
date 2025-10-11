Introduction

In SQL, set operations are used to combine the results of two or more SELECT queries.
These operations treat the results of each query as a set of rows, then apply mathematical set operations such as union, intersection, or difference.

The output of all participating queries must:

Have the same number of columns

Have similar data types

| Operation          | Description                                                              |
| ------------------ | ------------------------------------------------------------------------ |
| **UNION**          | Combines results of two queries and removes duplicates                   |
| **UNION ALL**      | Combines results of two queries and keeps duplicates                     |
| **INTERSECT**      | Returns only rows that appear in both queries                            |
| **MINUS / EXCEPT** | Returns rows from the first query that are **not** present in the second |

UNION
🔹 Definition:

The UNION operator combines the results of two or more SELECT queries and removes duplicate rows.
SELECT column_list FROM table1
UNION
SELECT column_list FROM table2;

SELECT City FROM Customers
UNION
SELECT City FROM Suppliers;

Explanation:

Returns a distinct list of all cities from both Customers and Suppliers.

Duplicate city names will appear only once in the final result.

 Notes:

Columns and data types must match.

The result is automatically sorted in ascending order by default (depends on the DBMS).

UNION ALL
Definition:

The UNION ALL operator combines the results of two or more queries without removing duplicates.
SELECT column_list FROM table1
UNION ALL
SELECT column_list FROM table2;

SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers;


INTERSECT
🔹 Definition:

The INTERSECT operator returns common records that appear in both SELECT queries.
SELECT column_list FROM table1
INTERSECT
SELECT column_list FROM table2;

SELECT City FROM Customers
INTERSECT
SELECT City FROM Suppliers;

MINUS / EXCEPT
🔹 Definition:

The MINUS (or EXCEPT in SQL Server/PostgreSQL) operator returns records from the first query that do not exist in the second query.

SELECT column_list FROM table1
MINUS
SELECT column_list FROM table2;

SELECT column_list FROM table1
EXCEPT
SELECT column_list FROM table2;

