use [Priyanshu.Kadia]

create table tmp
(
id int,
name varchar(20)
)

insert into tmp values(1,'kp')
insert into tmp values(2,'kj')

select * from tmp

update tmp 
set name='jk'
where id=2

select * from tmp

create table emp
(
id int primary key identity(1,1),
name varchar(20) not null,
gender varchar(10),
salary numeric(5) check(salary > 10000),
email varchar(100) unique
)

select * from emp

insert into emp
values('xyz','mel',25000,'xyz@gmail.com')

alter table emp
drop constraint [CK__emp__salary__267ABA7A]

insert into emp
values('abc','fssd',50,'abc@gmail.com')

select * from emp