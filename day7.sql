
/* select customerNumber,
 customerName ,
 country, 
 creditLimit ,
 -- left(customerName,4) as shortName
 -- length (customerName)
-- right(customerName,4) as shortName
-- repeat(customerName,3)
from customers;*/
-- select 
 -- orderNumber,orderDate,shippedDate,status
-- year(orderDate) -- year function date me se yaer bhahar nukal deta haa.
-- month(orderDate)
-- day(orderDate)
-- dayname(orderDate)
-- datediff( shippedDate,orderDate) as Daydifference
-- (Daydifference / 30.436875E) as MonthDifference
-- timestampdiff(MONTH, shippedDate,orderDate) as Daydifference
-- where orderDate = '2004-09-11' ;
-- from orders ;

select *, row_number() over(  partition by orderNumber ) from orderdetails;
-- cif any item chanege then the counting restart
-- agar name same haa to numbering increase hoti jaegi agar nhi to 1 se start ho jaegi
-- row number is used to add the new row.
-- partion reset the code as restart from the 1

select *, row_number() over(  partition by productcode ) from orderdetails;
select * , dense_rank() over(order by ordernumber) from orderdetails;
-- ordernumber same ranking is same
-- order number change then the ranking change.
select *, rank() over(order by ordernumber) from orderdetails;
select *, rank() over(partition by orderNumber order by productCode) from orderDetails;
/*select *, 
min(priceEach) over(),
avg(priceEach) over()
from orderdetails;*/
-- select *, 
-- max(quantityOrdered) over( partition by ordernumber order by productCode) from orderdetails;
select customerNumber,contactFirstName,country, lead(contactFirstName) over() from customers;
select customerNumber,contactFirstName,country, lead(contactFirstName,2) over() from customers;
select customerNumber,contactFirstName,country, lag(contactFirstName) over() from customers;

/*1. What are Window Functions?

Window functions perform calculations across a set of rows that are related to the current row.

Unlike aggregate functions (SUM, AVG, etc.), they do not collapse rows into one. Instead, each row keeps its identity, and the function adds extra calculated value.

A) Ranking Functions

Used to assign ranks or numbers to rows.

ROW_NUMBER() → unique sequential number for each row.

RANK() → assigns rank but leaves gaps when ties occur.

DENSE_RANK() → assigns rank without gaps.

NTILE(N) → divides rows into N buckets as evenly as possible.

(B) Aggregate Window Functions

Apply aggregate functions, but without collapsing rows.

SUM() OVER(...) → running totals.

AVG() OVER(...) → moving averages.

COUNT() OVER(...) → counts within partitions.

MIN() / MAX() OVER(...).

(C) Value Functions

Look at values from other rows.

LEAD() → fetch value from next row.

LAG() → fetch value from previous row.

FIRST_VALUE() → first value in partition.

LAST_VALUE() → last value in partition.

🔹 4. Difference from GROUP BY

GROUP BY → compresses rows, one row per group.

Window functions → keep all rows, just add new calculated values.

Example:
If you want to show each employee’s salary and their department’s average salary → window functions are the right tool.

🔹 5. Use Cases

Ranking students based on marks.

Calculating running totals of sales.

Finding previous/next transaction date of a customer.

Getting percentage contribution of each row in total.

👉 In short:*/
