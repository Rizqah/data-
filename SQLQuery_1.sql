SELECT *  
from [HumanResources].[Employee]
ORDER BY (JobTitle) asc;

select * from [Person].[Person]
order by (LastName) asc;


SELECT FirstName, LastName, BusinessEntityID as employee_id
FROM[Person].[Person] as e
order by LastName;

SELECT * from [Production].[Product]

SELECT ProductID, Name, ProductNumber from [Production].[Product]
WHERE SellStartDate IS NOT NULL

ORDER by (Name);
SELECT * FROM [Sales].[SalesOrderHeader]

 select JobTitle from [HumanResources].[Employee] 
 order by (JobTitle)asc;
 
select CustomerID, SUM(Freight) as Total_freight 
from [Sales].[SalesOrderHeader]
GROUP by CustomerID
order by CustomerID asc;

SELECT CustomerID, AVG(SubTotal) as avg_subtotal, SUM(SubTotal) as Sum_subtotal
from [Sales].[SalesOrderHeader]
Group by CustomerID
Order by CustomerID desc;

SELECT ProductId , SUM(Quantity) as Total_quantity
from [Production].[ProductInventory]
where Shelf in ('A','H','C')

GROUP BY ProductID 
HAVING SUM(Quantity) >500
ORDER by ProductID asc;

SELECT SUM(Quantity) as Total_quantity
from [Production].[ProductInventory]
GROUP by (LocationID*10)

select p.BusinessEntityID, FirstName, LastName, PhoneNumber as Person_Phone
from [Person].[Person] as p
INNER JOIN [Person].[PersonPhone] as ph
on p.BusinessEntityID = ph.BusinessEntityID
WHERE LastName  Like 'L%'
ORDER by FirstName, LastName

SELECT SalesPersonID, CustomerID, SUM(SubTotal) as Sum_Subtotal from [Sales].[SalesOrderHeader] s
GROUP by rollup (SalesPersonID, CustomerID);

SELECT LocationID, Shelf, SUM(Quantity) as Total_quantity
from [Production].[ProductInventory]
GROUP by cube (LocationID, Shelf)


select a.City, COUNT(b.AddressID) Noofemployees
from [Person].[BusinessEntityAddress] as b
inner JOIN [Person].[Address] as a 
on b.AddressID = a.AddressID
 GROUP by a.City
 order by a.City;

select Year (OrderDate) as YearofOrderDate, SUM(TotalDue) as TotalDueOrder
from Sales.SalesOrderHeader
WHERE Year (OrderDate) <= '2016'
GROUP by Year (OrderDate)
ORDER by Year (OrderDate) asc;

SELECT  Name, ContactTypeID
FROM [Person].[ContactType]
 where Name Like '%Manager%'

SELECT *from [Person].[BusinessEntityContact]

select * from [Person].[ContactType]
 SELECT * from [Person].[Person]

SELECT a.BusinessEntityID, FirstName, LastName
from [Person].[BusinessEntityContact] as a 
inner JOIN [Person].[ContactType] as b 
on a.ContactTypeID = b.ContactTypeID
Inner Join [Person].[Person] as c 
 on c.BusinessEntityID = a.PersonID
  where b.Name LIKE '%Purchasing Manager%'
  order by FirstName, LastName;

  SELECT *
  from [Person].[ContactType]
  where Name Like '%Manager%'
  GROUP by Name
  order by Name desc;

SELECT * FROM[Person].[BusinessEntityContact]


  select ROW_NUMBER()OVER (PARTITION BY PostalCode ORDER BY SalesYTD DESC) AS "Row Number", b.LastName, a.SalesYTD,c. PostalCode
  from [Sales].[SalesPerson] as A 
  inner JOIN [Person].[Person] as B 
  on a.BusinessEntityID = b.BusinessEntityID
  inner join [Person].[Address] as c 
  on c.AddressID = a.BusinessEntityID
  WHERE TerritoryID IS NOT NULL
    AND SalesYTD <> 0
 
  Order by PostalCode asc;

  

  select * from [Person].[BusinessEntityContact]

  
 SELECT * FROM [Person].[ContactType]

 SELECT b.ContactTypeID, a.Name as ContactTypeName, count(*) as NoofContacts
 from  [Person].[BusinessEntityContact] as B 
 inner join [Person].[ContactType] as A 
 on a.ContactTypeID = b.ContactTypeID
 GROUP by b.ContactTypeID, a.Name
 HAVING Count(*) <= 100
 order by COUNT(*) desc;

select CAST(B.RateChangeDate as VARCHAR(12)) AS Date_,
 CONCAT(FirstName, ' ', MiddleName, ' ', LastName) as FullName, 
 (40 * B.Rate) as SalaryWeek
from Person.Person as A 
Inner Join [HumanResources].[EmployeePayHistory] as B 
on B.BusinessEntityID = A.BusinessEntityID
ORDER by FullName;



select SalesOrderID, ProductID, OrderQty, 
COUNT(OrderQty) over (PARTITION by SalesOrderID ) as Total_quantity, 
AVG(OrderQty) over (PARTITION by SalesOrderID ) as AverageQty, 
MIN(OrderQty)over (PARTITION by SalesOrderID ) as MinQty, 
MAX(OrderQty)over (PARTITION by SalesOrderID )
from [Sales].[SalesOrderDetail]
where SalesOrderID in (43659, 43664)

select SalesOrderID, SUM(OrderQty* UnitPrice)as TotalCost
from [Sales].[SalesOrderDetail]
GROUP by SalesOrderID
HAVING SUM(OrderQty* UnitPrice) <= 100000
ORDER by SalesOrderID;

