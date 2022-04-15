use [Priyanshu.Kadia]

select * from sys.tables

create table product(
p_id int primary key identity (1,1),
p_name varchar(20),
p_qty numeric(10)
)

create table product_sell(
ps_id int primary key identity (1,1),
p_id varchar(20),
ps_qty numeric(10)
)

insert into product values('apple',25),('mango',100),('pinaple',80)

select * from product

create proc sp_account
as 
begin
	select * from product
end

alter proc sp_account
@a nvarchar(max)= null,
@b nvarchar(max)= null,
@c nvarchar(max)=null
as 
begin
	set @a=(select p_qty from product where p_id= @c)
	update product set p_qty = cast(@a as int)-cast(@b as int) where p_id = @c
	insert into product_sell(p_id,ps_qty) values(@c,@b)
end

exec sp_account @c=3,@b=5

select * from product
select * from product_sell

declare @d varchar(5)=1
declare @e varchar(max)
set @e = (select p_qty from product where p_id = @d)
print @e

/*update product 
	set p_qty = @a-@b
	where p_id = @c*/

Select * from product
Select * Into copy_table From product Where 1 = 2
Select * from copy_table


create table income(
i_id int primary key identity (1,1),
i_name varchar(20),
i_gender varchar(10),
salary numeric(10)
)

insert into income values('ram','male',25000),('jayram','male',22000),('kiran','female',21000),('ks','fmale',28000),('ksp','male',29000)
select * from income

update income set i_gender='female' where i_id=4

select * from income


with max_salary
as
(
	select *,ROW_NUMBER() over(partition by i_gender order by salary desc) dup from income 
)

select * from max_salary where dup=1