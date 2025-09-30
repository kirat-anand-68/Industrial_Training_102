| **Aspect**      | **Fact Table**                                                           | **Dimension Table**                                                           |
| --------------- | ------------------------------------------------------------------------ | ----------------------------------------------------------------------------- |
| **Definition**  | Stores **quantitative data (measures/facts)** about the business.        | Stores **descriptive data (attributes)** that describe dimensions of facts.   |
| **Content**     | Contains numbers: sales amount, quantity, profit, cost, etc.             | Contains text/labels: product name, customer name, location, time, etc.       |
| **Granularity** | Very detailed & large (millions of rows).                                | Comparatively smaller.                                                        |
| **Primary Key** | Composite key (foreign keys referencing dimension tables).               | Single primary key (referenced in fact table).                                |
| **Nature**      | Dynamic → grows continuously as transactions happen.                     | Static → changes less frequently (e.g., product details, customer info).      |
| **Example**     | `SalesFact (SaleID, ProductID, CustomerID, DateID, Amount, Quantity)`    | `ProductDim (ProductID, ProductName, Category, Price)`                        |
| **Usage**       | For **calculations & analytics** (e.g., total sales, profit per region). | For **filtering, grouping, slicing** (e.g., sales by category, region, year). |


(A) IF EXISTS

Used to check if something exists before performing an action.
-- Drop a table only if it exists
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'SalesFact' AND type = 'U')
    DROP TABLE SalesFact;

(B) LIKE

Used for pattern matching in strings.
-- Find all employees whose name starts with 'A'
SELECT * 
FROM Employees
WHERE FirstName LIKE 'A%';

-- Find customers whose email ends with 'gmail.com'
SELECT * 
FROM Customers
WHERE Email LIKE '%@gmail.com';

(C) EXISTS

Checks if a subquery returns any rows (boolean test).
-- Find employees who have at least one order
SELECT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.EmployeeID = e.EmployeeID
);

(D) VIEW

A stored query that acts like a virtual table.

-- Create a view for Sales with Customer details
CREATE VIEW SalesWithCustomer AS
SELECT s.SaleID, s.Amount, s.Quantity, c.CustomerName, c.City
FROM SalesFact s
JOIN CustomerDim c
    ON s.CustomerID = c.CustomerID;

-- Use the view
SELECT * FROM SalesWithCustomer WHERE City = 'Delhi';
