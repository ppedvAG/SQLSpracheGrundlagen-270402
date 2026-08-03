select * from customers

select * from orders where customerid = 'ALFKI'


select 
		c.companyname, c.customerid, c.country, c.city

from customers c   JOIN  Orders o  on c.CustomerID =o.CustomerID



select * from 
customers c	left join orders o on c.CustomerID = o.customerID




--alle Infos zu einer Bestllung nr 10248

select * 
from 
		orders o inner join [Order Details] od on o.OrderID=od.orderid


select * from employees

-- erstelle eine Liste der Bestellnummern aus orders
-- in der der Lastname des Angestellten mitausgegeben wird


select o.OrderID, e.LastName 
from
	 orders o  inner join employees e on o.EmployeeID = e.EmployeeID



select * from [Order Details]

select * from products


--alle Spalten von order details und Prodúktname
select od.*, p.productname 
	from [Order Details] od inner join products p on od.productid = p.productid	


select od.*, p.ProductName 
	from products p  inner join [Order Details] od on  p.productid	= od.productid 
 where
 order by

