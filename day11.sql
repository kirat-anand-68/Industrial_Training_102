-- *********************************************************  SUBQUERY   ************************************************************

📘 SQL Theory Notes – Subqueries, Joins, and Set Operations
🔹 1. Subqueries

A subquery is a query inside another query, enclosed in parentheses.

It is used when we need a result from one query to use in another query.

Types of subqueries:

Single-row subquery → returns one value.

Multi-row subquery → returns multiple values.

Nested subquery → query inside another subquery



select * from customers
where creditLimit = (select max(creditLimit )from customers);

-- it give me the bill number.
select orderNumber,sum(total) from 
(select orderNumber,
QuantityOrdered * priceEach as total 
from orderdetails) as bill
group by orderNumber;
-- it give the output as the table.

select  distinct 
-- customerNumber,
-- customerName,country, 
salesRepEmployeeNumber
from customers;

-- subquery always in the brackets.
select * from employees
where employeeNumber in 
(select  distinct  
salesRepEmployeeNumber
from customers where country = 'USA');


use home;

create table cost (name varchar(255),costprice int);

insert into cost ( name ,costprice)
values('shirts',100),
('Jeans',200),
('Googles',300)
select * from cost;


create table sales(name varchar(255),sellingPrice int);

insert into sales(name,sellingprice)
values('shirts',300),
('Jeans',800),
('Googles',1000)

select * from sales;

update sales
set name='T_shirts'
where sellingprice=1000;
-- it is the join 
select * from  cost c join sales s on c.name=s.name;
select name from cost union all select name from sales order by name;

 
 select * from cost c right join sales s on c.name=s.name
 union
 select * from cost c left join sales s on c.name=s.name;

select * from customers c join employees e on c.salesRepEmployeeNumber=e.employeeNumber

select * from orders join customers on orders.customerNumber= customers.customerNumber
-- pehle table ki foreign key and dusre table ki primary key use krenge.
-- one to one matching.we have done so far

-- next is one to many and many to one.

E) One-to-One, One-to-Many, Many-to-One Relationships

One-to-One: Each row in table A relates to only one row in table B.

One-to-Many: One row in table A relates to multiple rows in table B (e.g., customers → orders).

Many-to-One: Multiple rows in table A relate to one row in table B.

Many-to-Many: Handled by a linking table (e.g., orderdetails links orders and products)

select * from orderdetails  o join products p on o.productCode = p.productCode
-- one to many -> detail 
-- normalized table ko jorna ha apas me.
