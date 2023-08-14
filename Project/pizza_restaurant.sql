.open restaurant.db
Create table IF NOT exists customers (
    customerId int uniqe,
    cusName text,
    cuscountry text
);
insert into customers values
  (1, "Tim", "USA"), 
  (2, "Kanoon", "UK"), 
  (3, "John", "USA"), 
  (4, "Preaw", "Australia"),
  (5, "Turbo", "Australia");
Create table if not exists orders (
  	orderId int unique,
	orderDate text,
  	menuId int,
  	cusId int,
  	quatity int
);
Insert into orders values
  (1, "2022-12-28", 5, 5, 2),
  (2, "2022-12-29", 2, 3, 1),
  (3, "2022-12-30", 4, 1, 4),
  (4, "2023-01-11", 2, 5, 6),
  (5, "2023-01-28", 1, 2, 1),
  (6, "2023-01-29", 3, 4, 4);
create table if not exists menus (
  menuId int unique,
  menuName text,
  menuPrice real
);
insert into menus values
  (1, "Steak", 199.99),
  (2, "Pizza", 129.99),
  (3, "Burgers", 149.49),
  (4, "Burrito bowl", 399.19),
  (5, "Fish&chips", 219.59);

-- list tables in the db
.table
-- change how we display data in terminal/ shell
.mode column
--subquery
SELECT *
FROM (
  select * from customers
  where cusCountry = "USA");
  
select *
FROM (
  SELECT * from orders
  where strftime("%Y", orderdate) = "2022");


--WITH clause,JOIN 
WITH sub1 AS (
	select * from customers
	where cusCountry = "USA"),
    sub2 AS (
	SELECT * from orders
  	where strftime("%Y", orderdate) = "2022"),
    sub3 AS (SELECT * from menus)
SELECT
		sub1.cusName Customer_name,
    sub1.cuscountry Country,
    sub2.orderdate Date,
    sub3.menuname Menu,
		sub2.quatity * sub3.menuprice Total_price
FROM sub1
JOIN sub2
on sub1.customerid = sub2.cusid
join sub3
on sub2.menuId = sub3.menuid
;
