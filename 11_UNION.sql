/*

UNION

Der UNION Operator wird verwendet, um die Ergebnisse von zwei oder mehr SELECT-Anweisungen zu kombinieren.

Der UNION Operator entfernt standardmäßig doppelte Datensätze. Wenn Sie doppelte Datensätze beibehalten möchten
, verwenden Sie UNION ALL.

Der UNION Operator erfordert, dass jede SELECT-Anweisung die gleiche Anzahl von Spalten hat und dass 
die entsprechenden Spalten ähnliche Datentypen haben.

Der UNION Operator sortiert die Ergebnisse standardmäßig in aufsteigender Reihenfolge. 
Wenn Sie die Sortierreihenfolge ändern möchten, dann können Sie die ORDER BY-Klausel 
am Ende der letzten SELECT-Anweisung verwenden.

*/

select * from orders
--wenn Freight < 100 dan ist A Kunde
--wenn Fracht > 500 dann ist C Kunde
--die dazwischn ist B Kunde

select customerid, freight,'A' as typ from orders where freight < 100 
select customerid, freight,'C' as typ from orders where freight > 500
select customerid, freight,'B' as typ from orders where freight between 100 and 500

--Wenn Zeilen aus verschiedene Abfragen  untereinander in einer tabelle kombiniert werden sollen:
--dann: UNION

--der UNION ist am Ende 1!!! SELECT 

select 100
UNION
select 200
UNION
select 300
UNION	  --UNION macht automatisch distinct
select 100


select 100
UNION
select 200
UNION
select 300
UNION	ALL  --UNION macht automatisch distinct
select 100



 select customerid, freight,'A' as typ from orders where freight < 100 
 UNION
select customerid, freight,'C' as typ from orders where freight > 500
UNION
select customerid, freight,'B' as typ from orders where freight between 100 and 500










	--als eine Tabelle


select	TOP 1
		customerid , sum(freight) as SummeFracht , 'Mieseste Kunde'	 as Typ
		
from orders
group by customerid
order by 	SummeFracht	   desc
UNION
select	TOP 1
		customerid , sum(freight) as SummeFracht , 'bester Kunde'   as Typ
from orders
group by customerid
order by 	SummeFracht	   asc


select * from #t1
UNION
select * from #t2

 SELECT * from (
				select	TOP 1
						customerid , sum(freight) as SummeFracht , 'Mieseste Kunde' as Typ
		
				from orders
				group by customerid
				order by 	SummeFracht	   desc	 
				) T1
UNION
	select * from 		(
						select	TOP 1
								customerid , sum(freight) as SummeFracht , 'bester Kunde' as Typ
		
						from orders
						group by customerid
						order by 	SummeFracht	   asc 
			) t2


select * from v1 
UNION
select * from v2