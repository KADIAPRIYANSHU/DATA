create table department
(
d_id int identity(1,1) primary key,
d_name varchar(10) not null
)
select * from sys.tables
select * from INFORMATION_SCHEMA.TABLES

select * from sys.all_columns
select * from INFORMATION_SCHEMA.COLUMNS

create table employee
(
e_id int primary key identity(1,1),
e_name varchar(20) not null,
e_mail varchar(100) unique,
e_salary numeric(5) check(e_salary >= 10000),
e_dob date,
e_mob numeric(10) unique,
e_state varchar(10) default ('Gujarat'),
department_id int foreign key references department(d_id)
)

select * from employee

insert into employee values('it'),('sales'),('finance'),('hr')

select * from department

insert into employee
values('abc','abc@gmail.com',15000,'12/31/2000',9876543210,'gujarat',1)

select * from employee

--yyyy-mm-dd
--mm-dd-yyyy

insert into employee
values('xyz','xyz@gmail.com',15000,'12/31/2000',9876543211,'gujarat',2)

insert into employee
values('pqr','pqr@gmail.com',15000,'12/31/2000',9876543213,'gujarat',2)

select * from employee

set identity_insert employee on
insert into employee(e_id,e_name,e_mail,e_salary,e_dob,e_mob,e_state,department_id)
values(5,'mno','mno@gmail.com',15000,'12/31/2000',9876543214,'gujarat',2)

select * from employee

insert into employee(e_id,e_name,e_mail,e_salary,e_dob,e_mob,e_state,department_id)
values(7,'tyu','tyu@gmail.com',18000,'12/31/2000',9876543216,'gujarat',2)
,(6,'lkj','lkj@gmail.com',25000,'12/31/2000',9876543219,'gujarat',2)

set identity_insert employee off


insert into employee
values('ert','ert@gmail.com',15000,'12/31/2000',9876543222,'gujarat',2)

select * from employee

select * from department

delete from department where d_id = 3

select * from department


select * into employee_bkp from employee

select * from employee_bkp

select * from employee_bkp where e_salary > 15000

select * from employee_bkp where e_salary between 23000 and 25000
select * from employee_bkp where department_id = NULL
select * from employee_bkp where department_id = ''
-- we can't compare null values
select * from employee_bkp where department_id = 'NULL'--Wrong

select * from employee_bkp where department_id is null
select * from employee_bkp where department_id is not null

select * from employee_bkp where e_name = 'abc'
select * from employee_bkp where e_name != 'abc'

select * from employee_bkp where e_salary = 15000 and department_id = 2
select * from employee_bkp where e_salary = 25000 or department_id = 2
select * from employee_bkp where e_salary = 20000 and department_id = 2

select * from employee_bkp where e_name in ('abc','mno')
select * from employee_bkp where e_name = 'abc' or e_name = 'mno'

select * from employee_bkp where e_name not in ('abc','mno')

select * from department
select * from emp

select * from emp where name like 'a%'
select * from emp where name like '_y%'

select e.name,d.d_name
from emp e
join department d
on d.d_id = e.id

select * from department
select * from employee

select e.e_name,d.d_name
from employee e
join department d
on d.d_id = e.department_id

select e.e_name,d.d_name
from employee e
right join department d
on d.d_id = e.department_id

select e.*,d.*
from employee e
cross join department d

select * from employee order by e_name asc
select * from employee order by e_name desc
select * from employee order by 2

select * from employee
select distinct e_salary from employee
select distinct e_salary,e_id from employee

select top 3 * from employee order by department_id desc

select *,'hello' a from employee

select e_name name from employee

select *,
rank() over(order by e_salary desc) [rank],
dense_rank() over(order by e_salary desc) [dense rank],
row_number() over(order by e_name desc) [row_number],
ntile(2) over(order by e_name desc) [ntile]
from employee

select *,
LEAD(e_salary,3) over(order by e_id)
from employee

select *,
lag(e_salary,3) over(order by e_id)
from employee

select *,
first_value(e_salary) over(order by e_id desc)
from employee

select *,
last_value(e_salary) over(order by e_name desc)
from employee

select ascii('Abfasdasd'),ascii('Z'),ascii('a'),ascii('z')

select *,ascii(e_name) from employee

select char(100)

select left('priyanshu',4)


select charindex('s','suresh',2)

select patindex('%sur%','suresh')

select replicate('abc',3)

select stuff('priyanshu',1,3,'*')


select concat('abc','pqr','xyz')
select concat('abc','pqr',5)
select concat(5,4,5)


select QUOTENAME('hello','')
select QUOTENAME('hello','}')

select abs(-6.5)
select abs(6.5)

select ceiling(123.45)
select ceiling(123.0)

select floor(123.0)
select floor(123.5)

select rand()

select SQUARE(2)
select SQUARE('a')

select round(123.55,1),round(123.45,1),round(123.0,1),round(123.554,1)
select round(123.55,2),round(123.45,2),round(123.0,2),round(123.555,2)



--date-time functions : CURRENT_TIMESTAMP,getdate,sysdatetime,DATEADD,datediff,
--DATEFROMPARTS,DATENAME,DATEPART,day,month,year,getutcdate,ISDATE

select getdate(),CURRENT_TIMESTAMP,SYSDATETIME(),GETUTCDATE()
/*
2022-03-10 15:21:36.767	
2022-03-10 15:21:36.767	
2022-03-10 15:21:36.7677150	
2022-03-10 09:51:36.767
*/

select DATEADD(day,2,'2022/02/02')
select DATEADD(day,-2,'2022/02/01')
select DATEADD(month,2,'2022/02/02')

select DATEPART(year,'2022/02/02')
select year('2022/02/02')
