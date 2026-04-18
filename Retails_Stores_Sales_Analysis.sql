create table Sales (
order_id int primary key,
customer_name varchar(50),
city varchar(50),
product varchar(50),
category varchar(50),
quantity int,
price int,
order_date date,
payment_mode varchar(50)
);

insert into Sales values
(1,'Amit','Delhi','Laptop','Electronics',1,70000,'2023-01-01','UPI'),
(2,'Neha','Mumbai','Shoes','Fashion',2,2000,'2023-01-02','Card'),
(3,'Rahul','Bangalore','Mobile','Electronics',1,30000,'2023-01-03','Cash'),
(4,'Priya','Delhi','Watch','Fashion',1,5000,'2023-01-04','UPI'),
(5,'Arjun','Pune','Headphones','Electronics',2,3000,'2023-01-05','Card'),
(6,'Simran','Delhi','Laptop','Electronics',1,75000,'2023-01-06','UPI'),
(7,'Kiran','Mumbai','Shoes','Fashion',3,2500,'2023-01-07','Cash'),
(8,'Rohit','Bangalore','Mobile','Electronics',2,28000,'2023-01-08','Card'),
(9,'Meena','Pune','Watch','Fashion',1,4500,'2023-01-09','UPI'),
(10,'Aman','Delhi','Headphones','Electronics',1,3500,'2023-01-10','Cash'),

(11,'Aditi','Delhi','Laptop','Electronics',1,72000,'2023-01-11','Card'),
(12,'Pooja','Mumbai','Shoes','Fashion',2,2100,'2023-01-12','UPI'),
(13,'Vikas','Bangalore','Mobile','Electronics',1,31000,'2023-01-13','Cash'),
(14,'Sneha','Delhi','Watch','Fashion',2,4800,'2023-01-14','Card'),
(15,'Ankit','Pune','Headphones','Electronics',3,2800,'2023-01-15','UPI'),

(16,'Raj','Delhi','Laptop','Electronics',1,68000,'2023-01-16','Cash'),
(17,'Nikita','Mumbai','Shoes','Fashion',2,2200,'2023-01-17','Card'),
(18,'Deepak','Bangalore','Mobile','Electronics',1,29000,'2023-01-18','UPI'),
(19,'Riya','Delhi','Watch','Fashion',1,5200,'2023-01-19','Cash'),
(20,'Varun','Pune','Headphones','Electronics',2,3200,'2023-01-20','Card'),

(21,'Sonal','Delhi','Laptop','Electronics',1,71000,'2023-01-21','UPI'),
(22,'Mohit','Mumbai','Shoes','Fashion',1,2300,'2023-01-22','Cash'),
(23,'Kavya','Bangalore','Mobile','Electronics',2,27000,'2023-01-23','Card'),
(24,'Tarun','Delhi','Watch','Fashion',1,5000,'2023-01-24','UPI'),
(25,'Ramesh','Pune','Headphones','Electronics',1,3000,'2023-01-25','Cash'),

(26,'Alok','Delhi','Laptop','Electronics',1,69000,'2023-01-26','Card'),
(27,'Geeta','Mumbai','Shoes','Fashion',2,2400,'2023-01-27','UPI'),
(28,'Suresh','Bangalore','Mobile','Electronics',1,30500,'2023-01-28','Cash'),
(29,'Pallavi','Delhi','Watch','Fashion',1,5100,'2023-01-29','Card'),
(30,'Manish','Pune','Headphones','Electronics',2,3100,'2023-01-30','UPI'),

(31,'Ritu','Delhi','Laptop','Electronics',1,73000,'2023-02-01','Cash'),
(32,'Ajay','Mumbai','Shoes','Fashion',3,2600,'2023-02-02','Card'),
(33,'Preeti','Bangalore','Mobile','Electronics',1,29500,'2023-02-03','UPI'),
(34,'Naveen','Delhi','Watch','Fashion',2,4900,'2023-02-04','Cash'),
(35,'Komal','Pune','Headphones','Electronics',1,3300,'2023-02-05','Card'),

(36,'Sanjay','Delhi','Laptop','Electronics',1,74000,'2023-02-06','UPI'),
(37,'Megha','Mumbai','Shoes','Fashion',2,2100,'2023-02-07','Cash'),
(38,'Rakesh','Bangalore','Mobile','Electronics',1,31500,'2023-02-08','Card'),
(39,'Isha','Delhi','Watch','Fashion',1,5300,'2023-02-09','UPI'),
(40,'Kunal','Pune','Headphones','Electronics',2,3400,'2023-02-10','Cash'),

(41,'Anu','Delhi','Laptop','Electronics',1,76000,'2023-02-11','Card'),
(42,'Dev','Mumbai','Shoes','Fashion',2,2500,'2023-02-12','UPI'),
(43,'Tina','Bangalore','Mobile','Electronics',1,32000,'2023-02-13','Cash'),
(44,'Harsh','Delhi','Watch','Fashion',2,5000,'2023-02-14','Card'),
(45,'Nitin','Pune','Headphones','Electronics',1,3500,'2023-02-15','UPI'),

(46,'Pankaj','Delhi','Laptop','Electronics',1,78000,'2023-02-16','Cash'),
(47,'Rekha','Mumbai','Shoes','Fashion',2,2600,'2023-02-17','Card'),
(48,'Gaurav','Bangalore','Mobile','Electronics',1,30000,'2023-02-18','UPI'),
(49,'Shweta','Delhi','Watch','Fashion',1,5200,'2023-02-19','Cash'),
(50,'Yogesh','Pune','Headphones','Electronics',2,3600,'2023-02-20','Card');

 -- Basic Level --
-- Show all Data --
select * from Sales;

-- Total number of orders -- 
select count(order_id) as total_order from Sales;

-- Total Revenue --
select sum(quantity*price) as Revenue from Sales;

-- Orders from Delhi --
select * from Sales
where city = "Delhi";

-- Electronics Category orders -- 
select * from sales
where category="Electronics";

-- Intermediate Level -- 
-- Revenue by Category --
select category,sum(price*quantity) as Revenue from sales
group by category;

-- Revenue by Category -- 
select 
city , sum(quantity * price) as City_Biased_Revenue from Sales
group by city;

-- Average order value -- 
select 
	avg(quantity*price) as Avg_order_Value
    from sales ;
    
-- Most Sold Product --
select
   product,sum(quantity) as Total_Sold
   from Sales
   group by product
   order by Total_Sold desc;
   
-- Payment mode usage count --
select payment_mode,count(*) as Usage_Count
from Sales
group by payment_mode;

   -- Advannce Level --
-- Top 5 highest revenue orders --
select * from Sales
order by (quantity * price) desc limit 5;

-- Monthly Revenue trend --

select
       month(order_date) as month,
       sum(quantity * price) as revenue from sales
       group by month;

-- Rank customers by spending --
select customer_name,sum(quantity * price) as total_Spent,
    rank() over(order by sum(quantity * price) desc) as rnk
    from sales
    group by  customer_name;
    
-- Running total revenue --
select 
	   order_date,category,
       sum(quantity * price) over (partition by category order by order_date) as running_total
       from sales;
       
-- Highest Selling product per category --
select * 
    from (
    select
      category,
	  product,
      sum(quantity) as highest_selling,
      rank () over(partition by category order by sum(quantity) desc) as rnk
      from Sales
      group by category,product
      ) t 
      where rnk = 1;
      
      -- Customer who purchased more than 2 times --
      
      select customer_name,count(order_id) as orders
      from sales
      group by customer_name
      having  count(order_id)>2;
      
      -- Contribution % of each Category --
      select 
      category,sum(quantity*price) as revenue,
      sum(quantity*price)*100/sum(sum(quantity*price)) over()  as Contribution
      from sales
      group by category;
      -- Indentify peak sales day --
select 
	 order_date,sum(quantity * price) as revenue
	 from sales 
	 group by order_date
	 order by revenue desc
     limit 1;
     
     -- Find Repeat customer -- 
     select customer_name 
     from sales 
     group by customer_name
     having count(*) > 1;
     
     -- Find orders above average revenue --
     select   *  from sales
     where (quantity * price) >
     (select avg(quantity * price) from sales);
     
     -- Detect low - performing product --
     select 
            product ,sum(quantity) as Total_Quantity
            from sales 
            group by product
            order by Total_Quantity asc;
            
 -- City-wise ranking by revenue -- 
    select city,sum(quantity * price) as Revenue,
    rank() over(order by sum(quantity * price) desc) from sales 
    group by city;
    
    -- find top 3 product per category --
select * from 
   (select category,product,sum(quantity) as total_sold,
   rank() over(partition by category order by sum(quantity) desc) as rnk
   from sales group by category,product) as t
   where rnk<=3;
            
            
      
      
      
      
	
      
--
