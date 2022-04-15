use [Priyanshu.Kadia]

create table department1(
dept_id int identity(1,1) primary key,
dept_name varchar(20)
)

create table emp1(
e_id int identity(1,1) primary key,
e_name varchar(20),
e_salary numeric(5) check(e_salary>=20000),
d_id int foreign key references department1(dept_id)
)

insert into department1(dept_name) values('IT'),('SALES'),('MARKETING'),('ACCOUNTING')
select * from department1
select * from emp1

insert into emp1 values('viren',20000,1)
insert into emp1 values('gaurav',30000,2),('bhautik',25000,3),('rajesh',35000,4),('ram',22000,1)
select * from emp1

insert into emp1 values('priyanshu',35000,1)
insert into emp1 values('jay',40000,1)
update emp1 set e_salary=50000 where e_id=1

--1)	display the data of employee with the same salary

SELECT e_name,e_salary
FROM emp1 
WHERE e_salary IN (
    SELECT e_salary
    FROM emp1
    GROUP BY e_salary
    HAVING COUNT(*) > 1
)

--2)	display the 5th highest salary using aggregate or subquery.

SELECT
	e_name,e_salary,
	RANK () OVER ( 
		ORDER BY e_salary desc 
	) rank_no 
FROM
	emp1;

--***************************************
with e_salary
as
(
	select e_name,e_salary,Row_number() over(order by e_salary) dup from emp1 
)
select * from e_salary where dup=6

--***************************************
--SELECT  TOP 6 * FROM emp1 ORDER BY e_salary

SELECT TOP 1 * 
FROM 
( SELECT  TOP 3 * FROM emp1 ORDER BY e_salary) 
AS temp order by e_salary desc

--4)	the employees who earn more than the average salary in department id 1.
--select avg(e_salary) from emp1 where d_id=1

select * from department1

declare @a int
set @a=(select avg(e_salary) from emp1)
select * from emp1 where e_salary>@a and d_id=1

declare @c int
set @c=(select avg(e_salary) from emp1 where d_id=1)
select * from emp1 where e_salary>@c and d_id=1

--6)-	retrieve all employees who earn more than employee id 3 and work at the same department as employee id 1, not including employee id 1.


select * from emp1
select * from department1

declare @b int
set @b=(select e_salary from emp1 where d_id=3)
SELECT d_id,dept_id,e_salary,e_name,dept_name
FROM emp1 
join department1
on d_id=dept_id
WHERE e_salary>@b and d_id=1 and e_id <> 1
group by dept_id,d_id,e_name,e_salary,dept_name

--7)	display the average salary for each departments from employee. without display the department id.

SELECT distinct AVG(e_salary) OVER(PARTITION BY d_id) AS AvgSalaryAmount FROM emp1
