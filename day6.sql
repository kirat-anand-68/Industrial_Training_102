In SQL, constraints are rules enforced on data in tables to maintain data accuracy, integrity, and reliability.
They ensure that only valid data is inserted into the database and prevent accidental data corruption.

Constraints are applied either at the column level (on a single column) or at the table level (on multiple columns).

Types of SQL Constraints

SQL provides several types of constraints, including:

NOT NULL Constraint

UNIQUE Constraint

PRIMARY KEY Constraint

FOREIGN KEY Constraint

CHECK Constraint

DEFAULT Constraint

CREATE ASSERTION (less common, used for complex validation)

NOT NULL Constraint
🔹 Definition:

The NOT NULL constraint ensures that a column cannot have NULL (empty) values.
It is used when a column must always contain a valid value.

CREATE TABLE Students (
    StudentID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Age INT
);


UNIQUE Constraint
🔹 Definition:

The UNIQUE constraint ensures that all values in a column are different.
It helps maintain data uniqueness.

CREATE TABLE Employees (
    EmpID INT UNIQUE,
    Email VARCHAR(100) UNIQUE,
    Name VARCHAR(50)
);

INSERT INTO Employees VALUES (1, 'john@example.com', 'John');
INSERT INTO Employees VALUES (2, 'john@example.com', 'Mike'); 


PRIMARY KEY Constraint
🔹 Definition:

The PRIMARY KEY uniquely identifies each record in a table.
It combines the properties of NOT NULL and UNIQUE.

🔹 Rules:

Each table can have only one primary key.

The primary key column cannot contain NULL or duplicate values.
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

INSERT INTO Departments VALUES (1, 'HR');
INSERT INTO Departments VALUES (1, 'Finance'); 


FOREIGN KEY Constraint
🔹 Definition:

The FOREIGN KEY constraint ensures referential integrity between two tables.
It establishes a link between a column in one table and the primary key of another table.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers VALUES (1, 'Alice');
INSERT INTO Orders VALUES (101, 1); 
INSERT INTO Orders VALUES (102, 5);  

CASCADE → Automatically delete/update related rows

SET NULL → Sets foreign key column to NULL when parent is deleted

RESTRICT / NO ACTION → Prevent deletion/update of parent if child exists

CHECK Constraint
🔹 Definition:

The CHECK constraint ensures that values in a column satisfy a specific condition

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Price DECIMAL(10,2) CHECK (Price > 0),
    Quantity INT CHECK (Quantity >= 0)
);

INSERT INTO Products VALUES (1, -200, 5); -- ❌ Error! Price must be positive

DEFAULT Constraint
🔹 Definition:

The DEFAULT constraint assigns a default value to a column when no value is specified.

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50) DEFAULT 'Unknown'
);

INSERT INTO Students (StudentID, Name) VALUES (1, 'Riya');
-- City will automatically be 'Unknown'

CREATE ASSERTION (Advanced)
🔹 Definition:

CREATE ASSERTION defines a table-level constraint involving multiple tables.
(Not supported in all SQL databases.)

CREATE ASSERTION salary_check
CHECK (
    NOT EXISTS (
        SELECT * FROM Employees
        WHERE Salary < 0
    )
);
