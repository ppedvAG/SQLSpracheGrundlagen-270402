--AGGREGATE

--COUNT() : Anzahl
--SUM() : Summe
--MIN(): Minimum
--MAX(): Maximum
--AVG(): Durchschnitt



select 
	  avg(freight)	  as Schnitt
	, count(freight)  as Anzahl
	, max(freight)	  as Maximum
	, min(freight)    as Minimum
	, sum(freight)	  as Summe
from orders


--Wieviele Länder gibts in Tab Customers

select country, region from customers

select count(distinct country) from customers	--91	 aber sind doch nur 21 verschiedene

select count(*) from customers --wieviele Datensätze haben wir

--Wieso sind es bei Region deutlich weniger  als bei count(country) ?

select count(region) from customers --wieviele Datensätze haben wir mit Region
--	NULL ist Nicht , aber nicht 0 


select 1+0
select 1 + null


--Wieviele Kunden gibt es pro Land

select 
		country as Land, count(*)  as Anzahl
from customers
group by  country  


--Wieviele Kunden country, city, count(*)


select 
		country, city, count(*) as Anzahl
from customers
group by 
		  country, city
 order by 1,2



 --Liste alle customerid auf aus der Tabelle orders und zeige zusätzlich an 
 -- schnitt der frachtkosten und summe der frachtkosten


 select 
		    customerid as KdNr
		  , sum(freight) as Summe
		  , avg(freight) as Durchschnitt
		  , freight * 1.19 as Brutto
from orders
group by
		   customerid,freight * 1.19 


		  
		



