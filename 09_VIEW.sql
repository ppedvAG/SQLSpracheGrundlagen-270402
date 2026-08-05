--View oder SICHT

--gemerkte Abfrage, enthalten keine DAten, sie führen in dem Moment der abfrage 
-- das Stement mit aktuellen Daten aus
--VIEWS verhalten sich wie Tabellen: SEL , INS, UP, DEL

--Siuchten werden so erstelle

CREATE OR ALTER VIEW SICHTNAME
AS
..CODE darf nur aus 1!! SELECT bestehen

--alle Spaltejn müssen eindeutig sein und einen namen besitzten


select companyname, customerid from customers-- where country = 'UK'
where possumme < 10


create or alter view vUmsatz
as
select 
	c.CustomerID, c.CompanyName,c.city as KDStadt, c.country as KdLand,	--Kundenspalten
	o.orderid, o.freight,o.orderdate,od.Discount,									--Bestellkopf
	od.unitprice, od.quantity, (od.unitprice* od.quantity) as Possumme,	--BestDetails
	p.productname, p.UnitsInStock, p.productid,							--produktdaten
	e.EmployeeID, e.lastname, e.country as AngLand, e.city as AngStadt,	--Angestellter
	cat.CategoryID, cat.CategoryName									--Kategorien
from 
		customers c inner join orders o			  on c.customerid = o.CustomerID
					inner join [Order Details] od on o.orderid = od.orderid
					inner join products p		  on od.productid = p.productid
					inner join employees e		  on o.employeeid = e.employeeid
					inner join categories cat     on p.categoryid = cat.categoryid


select Possumme,* from vUmsatz  
where possumme < 10


where KdLand='USA' and CategoryID = 5



select companyname , sum(possumme) from vUmsatz
group by companyname


select * from 	vUmsatz		 [dbo].[Product Sales for 1997]

select count(*) from Customers

select count(customerid) from vUmsatz 

select * from vUmsatz