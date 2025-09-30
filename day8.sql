SELECT salesRepEmployeeNumber, COUNT(customerNumber) AS customerCount
FROM customers
GROUP BY salesRepEmployeeNumber
ORDER BY customerCount DESC;

select country,state ,
sum(creditLimit)
from customers 
group by country, state 
order by country;

select orderNumber, 
sum(QuantityOrdered) as Quantity
from orderdetails
group by orderNumber;

select orderNumber ,
sum(priceEach * QuantityOrdered) as Total
from orderDetails
group by orderNumber;
-- Data Filter

select country,sum(creditLimit)
from customers
group by country
having sum(creditLimit) > 150000;
-- aggregate function of filter krna hot haa to hum having use krte haa.
-- count,min,max,avg,sum,std
select * from Employees;
-- column filter where and the aggregate filter on the having.
select * from Employees
where email like 'abow%';
select count(*) from Employees;
select  officeCode ,count(employeeNumber)
from Employees
group by officeCode;

