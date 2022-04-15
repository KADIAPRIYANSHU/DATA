select top 0 * from Sales.SalesOrderHeader
select top 0 * from Sales.SalesTerritory
select top 10 * from Sales.SalesOrderDetail 
select top 0 * from Sales.SalesPerson

select st.TerritoryID,sod.SalesOrderID 
from Sales.SalesOrderHeader as so
join Sales.SalesTerritory as st
on so.TerritoryID=st.TerritoryID
join Sales.SalesOrderDetail as sod
on so.SalesOrderID=sod.SalesOrderID
join Sales.SalesPerson as sp
on st.TerritoryID=sp.TerritoryID

select top 0 * from Production.ProductCostHistory
select top 0 * from Production.Product
select top 0 * from Production.ProductSubcategory
select top 0 * from Production.ProductCategory

select p.ProductModelID,psc.Name 
from Production.ProductCostHistory as pch
join Production.Product as p
on pch.ProductID=p.ProductID
join Production.ProductSubcategory as psc
on psc.ProductSubcategoryID=p.ProductSubcategoryID
join Production.ProductCategory as pc
on pc.ProductCategoryID=psc.ProductCategoryID

select top 0 * from Person.CountryRegion
select top 0 * from Person.Address
select top 0 * from Person.StateProvince
select top 0 * from Person.Person
select top 0 * from HumanResources.Employee

select sp.ModifiedDate
from Person.CountryRegion as cr
join Person.StateProvince as sp
on sp.CountryRegionCode=cr.CountryRegionCode
join Person.Address as a
on a.StateProvinceID= sp.StateProvinceID

select top 0 * 
from HumanResources.Employee as hm
join Person.Person as p
on p.BusinessEntityID=hm.BusinessEntityID


select st.TerritoryID,sod.SalesOrderID 
from Sales.SalesOrderHeader as so
join Sales.SalesTerritory as st
on so.TerritoryID=st.TerritoryID
join Sales.SalesOrderDetail as sod
on so.SalesOrderID=sod.SalesOrderID
join Production.ProductCostHistory as pch
on sod.ProductID=pch.ProductID


select 
from Production.Product as p
join Production.ProductCostHistory




select top 0 * from Sales.SalesOrderHeader
select top 0 * from Sales.SalesOrderHeader
select top 0 * from Sales.SalesOrderHeader