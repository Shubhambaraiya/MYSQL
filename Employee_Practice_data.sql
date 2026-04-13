create table Employee (
id int primary key,
name varchar(50),
department varchar(50),
salary int,
manager_id int
);
INSERT INTO Employee (id, name, department, salary, manager_id)
VALUES
(1,'Aditi','HR',30000,5),
(2,'Rahul','IT',50000,6),
(3,'Neha','IT',60000,6),
(4,'Aman','Sales',40000,7),
(5,'Kiran','HR',70000,NULL),
(6,'Mohit','IT',80000,NULL),
(7,'Suresh','Sales',65000,NULL),
(8,'Pooja','HR',30000,5);

select * from Employee;

-- Find Average Salary per department --
select department, round(avg(salary),2) as Average_Salary
from Employee
group by department;

-- Find Employees earning above department average --
select name,department,salary from
(select *, avg(salary) over(partition by department)
as dept_Avg from Employee) t
where salary>dept_Avg;

-- find highest salary in each department --
select department,max(salary) from Employee
group by department;

select * from
(select *,max(salary) over(partition by department) as Highest_Salary from employee) t
where salary = Highest_Salary;

-- Find Employeee who earn more than their manager -- 
select e.name from
Employee e
join employee m on e.manager_id = m.manager_id
where e.salary>m.salary;

-- Find Department with more than 2 Employees --
 select department, count(*) as Total
 from employee
 group by department
 having Total>2
 ;
 
 -- Find Second highest Salary --
 select max(salary) from Employee
 where salary < (select max(salary) from Employee);
 
 -- Find Employee Without Manager --
 select name,manager_id from employee
 where manager_id is null;
 

-- Rank Employee by salary --
 select *,rank() over(order by salary desc) as ranked from Employee ;
 
 -- Find duplicate Salaries --
 select department,salary, count(*) as Total_count from employee
 group by salary,department
 having count(*)>1
 ;

-- Top 2 highest Salaries --
select salary from employee 
order by salary desc
limit 2;