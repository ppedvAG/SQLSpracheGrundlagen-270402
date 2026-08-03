--WHERE  -- die wo ...

select *
from tabelle
where


Spalte =  --der Wert wird exakt verglichen
Spalte > < >= <=  != 
Spalte * 10 < 100
SpalteA > Spalte B
SpalgteA > SpalteB *1000




select * from orders
where 
freight = 58.17


select * from orders
where 
freight < 58.17

select * from orders
where 
freight <= 58.17    --kleiner oder gleich wie


select * from orders
where 
freight > 58.17		--kleiner als 



select * from orders
where 
freight >= 58.17   --größer oder gleich als


select * from orders
where 
freight != 58.17  --soll es nicht sein

--es läßt sich alles mit < > usw suchen, was sortierbar ist

select * from customers
where 
       customerid < 'D'


--Suche alle Kunden aus den USA
--und aus POrtland

--Where Bdeingeun können mit AND kombiniert werden


select * from customers
where
        country = 'USA'
        AND
        CITY = 'Portland'


--Ich suche alle Kunden aus USA UND UK
select * from customers
where
    country = 'USA'
    OR
    country = 'UK'

    --Identische Spalten müssen wiederholend in der where verwendet werden


--Validieren.. stimmt das Ergebnis

select country, * from customers
where
    country = 'USA'
    OR
    country = 'UK'


--Suche alle Bestellungen, deren Frachtkosten kleiner als 50 sind und vom AngID Nr 3 stammen
--Employeeid


select * from orders
where
        freight    < 50
        AND
        Employeeid = 3


--Die Freight Splate in Order ist ein Netto Wert.
--Wir wollen alle DS der orders, bei denen der Bruttowert der Frachtkosten unter oder gleich 100 ist


 --immer validieren
 select freight, freight *1.19 , * from orders
 where
    freight * 1.19 <= 100


select * from employees

--Gib zusätzlich das Later des Ang aus...     datediff ?

select datediff(yy, '1.1.2020', getdate())  =-- = +6


select datediff(yy,Birthdate, getdate()), * from employees



select  * from employees
where
         datediff(yy,Birthdate, getdate())>= 67


--Man kann auch AND und OR kombinieren


--ich brauche alle Bestellungen , die 
--aus Shipcountry USA oder UK verschifft wurden und weniger als 30 FRachtkosten hatten

select shipcountry, freight, * from orders
where
        shipcountry = 'UK'
        OR 
        SHIPCOUNTRY = 'USA'
        AND     --AND wird immer zuerst kombiniert
        freight    < 30

--ich wollte aber, dass alle unter 30 Freight haben--> schreib Klammern


select shipcountry, freight, * from orders
where
        (shipcountry = 'UK'
        OR 
        SHIPCOUNTRY = 'USA' )
        AND     --AND wird immer zuerst kombiniert
        freight    < 30


--ohnen KLammern passiert das ...
select shipcountry, freight, * from orders
where
        shipcountry = 'UK'
        OR 
        (SHIPCOUNTRY = 'USA' 
        AND     --AND wird immer zuerst kombiniert
        freight    < 30 )


select * from products


--Von welchen Produkten haben wir nur noch weniger als 10 auf lager aus der Cat 1 und 2


 select * from products
 where
         UnitsInStock < 10
         AND
         (CategoryID =1   OR CategoryID =2 )



--was wäre wenn.. alle Produkte aus der Kategorie: 1,3,5,7,8


--Das IN entspricht Spalte = Wert or Spalte = Wert OR Spalet = Wert..
-- where spalte in (Wert, Wert, wert, wert,...)


select * from products
where
        CategoryID IN (1,2,5,6,7)


--statt 
CategoryID = 1 or CategoryID = 2 or CategoryID = 3 or CategoryID = 5 or CategoryID =6



--Wir brauchen alle Kunden aus Italy, France, Germany, Austria
--Customers

--DAS IN ist dann nützlich wenn wir im Where eine bestimmter Spalte mit OR SP = 
--für viele Werte filtern müssen


select * from customers
where 
        country  in ('Italy', 'France', 'Germany', 'Austria')


--alle Bestellungen (orderdate) aus dem Jahr 1996
select * from orders


--immer korrekt
select year(orderdate),  * from orders  
where
        year(orderdate) = 1996


--Wenn ein beliebiger Zeitraum

select * from orders
where
    orderdate >= '20.7.1996'  and orderdate <= '20.9.1996'

--schneller gehts mit Between  (Grenzen sind immer inklusive bei Between)

select * from orders
where
        orderdate between '20.7.1996' and '20.9.1996'


--Text ist sortierbar, also auch Text > oder Text <


--aus tabelle Customers

--alle Kunden (customerid) , die mit A, B , C , D oder E beginnen
--mit between

--A-----B------C------D------E------F Fa-----------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxx

select * from customers
where
         customerid between 'A' and 'F'


select * from customers
where
        customerid >= 'A' and Customerid < 'F'


 --WILDCARDS

 -- soll mit A beginnen
 -- soll mit L enden
 -- es soll chinese irgendow im Namen stehen

 --funktioneren nur mit LIKE!!

 where spalte like ....

 -- % = beliebig viele Zeichen , sind auch 0 Zeichen sein
 -- _ = genau ein Zeichen



 where spalte like '%y%'    --irgendwo ein y
 where spalte like '_y%'    --zweites Zeichen ist ein y
 
 where spalte like 'y%'     --muss mit y beginnen


 where spalte like '%y'     --muss mit y enden


 --Gibt es Firmenname, die ein y im Namen haben


 select companyname as Firma from customers
 where 
         companyname like '%y%'


--Es gab doch da ein Produkt , das irgendwie sauerkraut hieß---
--wie war da gleich nochmal die Produktnummer


select p.ProductName, p.ProductID
from products p
where 
       p.ProductName like '%sauerkraut%' 


als vorletzten Buchstaben ein L im Firmennamen haben
und mit B beginnen


select c.CompanyName from customers   c
where
       c.CompanyName  like 'B%L_'



'01_3__543_3_1'


--Zeige mir alle Kunden, die mit A , b , c beginnen
--und mit l, m, n enden
--

--und dazwischen ein a oder e oder i

 where spalte like < 'd'


 --Bereiche könne mit [ ] definiert werden
 -- eine [] steht für genau 1 Zeichen

 -- [efgh]  also e oder f oder g oder h
 -- [e-h]
 -- geht auch mit Zahlen [0-9]

 where spalte like '[abc]%[aei]%[lmn]'


 where spalte not like '[amosz]'


 --PIN über Website möglich

 -- A07B


 --wie finde ich alle , die keine ordentliche PIN haben
 -- wie finde ich alle die eine korrekte PIN haben


 where PIN not like '[0-9][0-9][0-9][0-9]'

 where PIN < 10000

 0043


--Suche alle Firmenname, die ein ' im Namen haben

select * from customers
where 
        companyname like  '%''%'   --suche nach '

--suche nach allen Firmen, wo ein Prozentzeichen vorkommt

select * from customers
where CompanyName like '%[%]%'

--seit SQL 2025 gibt es RegEx



^[A-Za-z0-9.!#$%&'*+/=?^_`{|}~-]+@[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?(?:\.[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?)+$


















