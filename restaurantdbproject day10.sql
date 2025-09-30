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

