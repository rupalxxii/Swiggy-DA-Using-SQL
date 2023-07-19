create database swiggy;
use swiggy;
select * from orders;
select * from items;

-- question 1: Distinct Food Items Ordered
select count(distinct restaurant_name) from orders;                 -- 49  

 -- question 2: Group Vegetarion and meat item together
 select  is_veg, count(name) as items from items group by is_veg;
 
 -- question 3: count the number of unique orders
select distinct name from items;
select count(distinct name) from items;

 -- SELECT * FROM items 
--  where is_veg=2;

 -- question 4: show item containing chicken in there name
 select * from items where name like "%chicken%";
 
 -- question 5: find item name with parath
 select * from items where name like "%paratha%";
 
 
-- question 6: Average items per order
select count(name)/count(distinct order_id) as average_items from items;

-- question 7: items order the most number of times
SELECT name,count(*) FROM items
group by name
order by count(*) desc;


-- question 8: order during rainy times
SELECT distinct rain_mode FROM orders LIMIT 1000;


-- question 9: unique restaurant name
select distinct restaurant_name from orders;
SELECT count(distinct restaurant_name) FROM orders;

-- question 10: Restaurant with most orders
SELECT restaurant_name,count(*) FROM orders 
group by restaurant_name
order by count(*) desc;


-- question 11: order placed per month and year
-- SELECT date('%Y-%m',order_time),count(distinct order_id) FROM orders 
-- group by date('%Y-%m',order_time)
-- order by count(distinct order_id) desc;



-- question 12: revenue made by month
sELECT max(order_time) FROm orders;

--  question 13 average order values
SELECT sum(order_total)/count(distinct order_id) as aov
FROM orders; 

-- question 14: Yoy change in revenue using lag function and ranking the highest year
select yearorder,revenue,
rank() over (order by revenue desc) as ranking from final;

  -- question 16 : join orders and items table and find product combos uaing self join
  
  
SELECT a.name,a.is_veg,b.restaurant_name,b.order_id,b.order_time FROM items a
join orders b
on a.order_id=b.order_id;

SELECT a.order_id,a.name,b.name as name2,concat(a.name,"-",b.name) FROM items a
join items b
on a.order_id=b.order_id
where a.name!=b.name
and a.name<b.name







