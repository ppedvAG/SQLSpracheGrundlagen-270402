/*  temporäre Tabellen

Es gibt 2 Arten von temporären Tabellen:
1. Lokale temporäre Tabellen: #tabelle
2. Globale temporäre Tabellen: ##tabelle

Eine lokale temporäre Tabelle ist nur in der Session sichtbar, in der sie erstellt wurde.
Eine globale temporäre Tabelle ist in allen Sessions sichtbar, bis die Session, die sie erstellt hat, beendet wird.
Man kann eine temporäre Tabelle mit dem Befehl "select * into #tabelle from tabelle" erstellen. 
Die temporäre Tabelle wird automatisch gelöscht, wenn die Session beendet wird.

Man verwendet temporäre Tabellen, wenn man Daten zwischenspeichern möchte, 
die nur für die Dauer einer Session benötigt werden.





*/




select * from orders

VINET	 32,38
CENTC	  3,25

--Summe der Frachtkosten pro Kunde (Firmenname)

--Liste mit den besten Kunden (geringsten Frachtkosten)
--und Kunde mit in Summe höchsten Frachkosten

--als eine Tabelle


select	TOP 1
		customerid , sum(freight) as SummeFracht , 'Mieseste Kunde'
		
from orders
group by customerid
order by 	SummeFracht	   desc


select	TOP 1
		customerid , sum(freight) as SummeFracht , 'bester Kunde'
		
from orders
group by customerid
order by 	SummeFracht	   asc


select 'ein Wert steht' from Tabellenartiges

select * from 
(
select * from customers where country = 'UK'
)  as T1



 SELECT * from (
				select	TOP 1
						customerid , sum(freight) as SummeFracht , 'Mieseste Kunde' as Typ
		
				from orders
				group by customerid
				order by 	SummeFracht	   desc	 
				) T1
CROSS JOIN
			(
			select	TOP 1
					customerid , sum(freight) as SummeFracht , 'bester Kunde' as Typ
		
			from orders
			group by customerid
			order by 	SummeFracht	   asc 
			) t2


 --temporäre Tabellen

 --haben immer den Namen #tabelle  , ##tabellen

 --#Tab: lokale temporäre Tabelle: Existiert nur in der Session, in der sie erstellt wurde.
  --wird die Session geschlossen ist tempor. tabelle autom weg


 select *  into #t from orders
 select * from #t


 select	TOP 1
		customerid , sum(freight) as SummeFracht , 'Mieseste Kunde'	 as Typ
into #t1		
from orders
group by customerid
order by 	SummeFracht	   desc


select	TOP 1
		customerid , sum(freight) as SummeFracht , 'bester Kunde'  as typ
into #t2		
from orders
group by customerid
order by 	SummeFracht	   asc

select * from #t1 cross join #t2




 --Tabelle Customers hat 1 MIO Zeilen
--Wieviele Kunden gibt es pro Land


select country, count(*) from customers group by country

--Wieviele Kunden gibt es pro Stadt

select City, count(*) from customers group by city

--Wieviel Kunden gibts?

select count(*) from customers

select * from customers

 select country, city, count(*) as Anzahl 
 into #ergebnis
 from customers 
 group by country, city	  with rollup
 order by country, city

 select * from #ergebnis  where city is  null	and country is null


exec msdb..sp_send_dbmail  'GMX'



--Temporäre Tabelle #t ##t globale Tabellen

select 'XY'as SP into #r
select 'XY'as SP into ##r

select * from #r
select * from ##r

drop table #r
drop view Sichtname











--Im Having stehen immer nur aggregate

select country, city, count(*) as anzahl from customers
--where anzahl > 5
group by country, city having count(*) > 5

 --welche Angestellten haben in Summe Frachtkosten über 5000
select employeeid, sum(freight) as Summe from orders

group by employeeid		having 	sum(freight) > 5000









