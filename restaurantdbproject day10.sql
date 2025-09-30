🍽️ Restaurant Database SQL Project
📌 Project Overview

This project is based on a sample database called restaurant_db. It contains a table menu_items that stores details of different dishes served in the restaurant. Using SQL queries, we perform data exploration and analysis to answer common business questions.

The goal is to demonstrate how SQL can be used for:

Retrieving data

Filtering records

Sorting results

Aggregating (sum, avg, min, max)


| Column Name | Description                                           |
| ----------- | ----------------------------------------------------- |
| `item_id`   | Unique ID for each menu item                          |
| `item_name` | Name of the dish                                      |
| `category`  | Category (e.g., Italian, Chinese, Dessert, Beverages) |
| `price`     | Price of the dish                                     |


use restaurant_db;
1. View all items

select * from menu_items;

2. Count total menu items
select count(*) from menu_items;

3. Find maximum and minimum priced items
select 
max(price) as Max_price,
min(price) as Min_price
from menu_items;

4. Count Italian items
select count(category) as Italian_item
from menu_items
where category= 'Italian';


5. List Italian items sorted by price
select * from menu_items
where category ='Italian'
order by price;

select * from menu_items
where category ='Italian'
order by price desc;
  
-- how many disheds in each ctegory
select * from menu_items;
select category,count(item_name) as No_of_dishes
from menu_items
group by  category;

-- average dishes price in each category
select category,avg(price) as No_of_dishes
from menu_items
group by  category



select * from order_details;

-- what is the data range of the table
select Max(order_date), min(order_date) from order_details;
-- how many orders were made within this range
select count(distinct order_id) from order_details; 
-- how many items were order with in  this range
select count(*) from order_details;
select 
order_id, 
count(item_id) as Num_items
from order_details
group by order_id
order by Num_items desc;

-- how many orders has more than 12 items
select count(*) from
(select 
order_id, 
count(item_id) as Num_items
from order_details
group by order_id
having Num_items > 12) as Num_orders


select * from menu_items;
select * from order_details;

select * from order_details od left join menu_items mi
on od.item_id= mi.menu_item_id;
-- i want to keep the all the transactions so that i have to mek the join as the left join
select item_name, category,count(order_details_id) as num_purchases
from order_details od left join menu_items mi
on od.item_id= mi.menu_item_id
group by item_name , category
order by num_purchases;
-- top 5 order that spent the most money
select order_id,
sum(price) as Total_spend
from order_details od left join menu_items mi
on od.item_id= mi.menu_item_id
group by order_id 
order by Total_spend desc
limit 5

