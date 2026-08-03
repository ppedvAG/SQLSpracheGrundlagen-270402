select 
	SPALTEN, * -- alle Spalten
	MATHE --Spalte mal Spalte zb
	f(spalte)
from
		Tabelle



select * from customers



select    companyname
		, city
		, country
from    
		customers


--lass dir aus Tabelle Orders:
-- Frachtkosten , Bestellnr, Kundennr, bestelldatum

--Erst mal Überblick verschaffen
select 	* from orders


select 	Orderid, freight, customerid, orderdate from orders

select o.OrderID, o.Freight	from orders	o


 --Zeige die Bestellnummern an, sowie Frachtkosten und Frachtkosten in Brutto (dt MwST)


 select 
		o.OrderID
		, freight
		, freight * 1.19
		, (freight *1.19) - freight
		, 'Ach gu´ggg der Tobias'
		, 100

 from 
		orders o --830


---




		