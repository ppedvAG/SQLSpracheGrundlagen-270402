drop database Graphdb



USE	Northwind

--verbindet dich mit der DB.. immer gut zu wiessen auf der richtigen zu sein :-=)


--ab 2 Minuszeichen folgt eine KOmmentar bis zu Ende der Zeile
select getdate()  --gibt das aktuelle Datum und Uhrzeit aus

/*
alles dazwischen bleibt KOmmentar
auch hier nioch 

und da.. auch das folgende SELECT getdate()
select getdate()
*/


--Tipp... Formatiere!!!



select c.City,c.CompanyName c.CustomerID from customers c where c.Country = 'USA'


--Klickt man auf die roten Fehlermeldung doppelt, springt SQL Server 
--oft(nicht immer) zu der entsprechenden Zeile.
select  c.City,
		c.CompanyName
		c.CustomerID 
from    customers c 
where   c.Country = 'USA'


--Es ist elegant, wenn man die das KOmma vorne setzt
--statt hinten. Da man sofrot KOmmafehler erkennt
--und Zeilen auskommentieren kann 
select   c.City
		,c.CompanyName
		,c.CustomerID 
		--,c.country
from    customers c 
where   c.Country = 'USA'


--Formatiere so, 
--dass es übersichtlich bleibt  und nicht zu viel scollen




















