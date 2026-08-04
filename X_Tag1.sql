--Funktionen

--Datum , Mathe, Text
--zu finden: 
--in jeder DB unter
-->Programmierbarkeit --> Funktionen--> Systemfunktionen


select fn(par1, par2) --> returns irgendwas


select fn(wert) from fn(wert) 
where fn(Spalte) > fn(wert)


--also super praktisch, aber technisch gesehen nicht so der Brüller

--Ich möchte alle Kunden finden, die mit A beginne

--Customers, customerid

 select * from customers  where customerid  like 'A%'


 select left(customerid,1),* from customers where left(customerid,1)= 'A' 


 SELECT 
		fn(SP), fn(Wert),
		SpalteA, SpalteB, SpalteC,
		Mathe as ALIAS	,
		'text' , Zahlen -- 0.91

 FROM
		TabelleA A	INNER JOIN TabelleB	ON A.SpalteXY = O.SpalteXY

WHERE
	   Spalte = > < >= <= !=  --keine Wildcards!!
	   AND | OR
	   Spalte LIKE --Wildcards: %  bekiebig viele Zeichen
							--: _ steht für genau ein unbekanntes Zeichen
							--: [] steht für ein beliebiges Zeichen aus der Menge
       NOT LIKE
	   IN : Spalte in (Wert, Wert, Wert)  
				-->Spalte = Wert or Spalter = Wert or Spalte = Wert
       BETWEEN : Spalte between 5 and 10
			    --> Spalte >= 5 and Spalte <= 10
ORDER BY : Spalte ASC | DESC, Spalte2 ASC | DESC


--Zeige alle Kunden aus Deutschland, deren Bestellunge zu spät ankam
select * from customers	--companyname
select * from orders


1. Zeige alle Kunden aus Deutschland und deren Bestellungen

SELECT *
FROM	CUSTOMERS C INNER JOIN ORDERS O on C.CustomerID=O.CustomerID
WHERE   C.Country = 'Germany'

2. Bestellung verzögert	   : 
--Gib das Requireddate und das Shippedddate und zeige zusätzlich
 --die Dauer in Tagen dazwischen an

select 	  
		  o.ShippedDate
		, o.RequiredDate
		, DATEDIFF(dd, o.ShippedDate, o.RequiredDate )
from	  
		  orders o

4. Nur die Verzögerten

 
select 	  
		  o.ShippedDate
		, o.RequiredDate
		, DATEDIFF(dd, o.ShippedDate, o.RequiredDate )
from	  
		  orders o
where
		--wenn kleiner 0 dann zu spät geliefert
		 DATEDIFF(dd, o.ShippedDate, o.RequiredDate )< 0


--5. Alle Teilschritte zusammen bringen


SELECT  c.CompanyName, c.Country, 
		o.orderid, o.RequiredDate, o.ShippedDate,
		DATEDIFF(dd, o.ShippedDate, o.RequiredDate ) as Verzögerung
FROM	CUSTOMERS C INNER JOIN ORDERS O on C.CustomerID=O.CustomerID
WHERE   
		C.Country = 'Germany'
		AND
		DATEDIFF(dd, o.ShippedDate, o.RequiredDate )< 0



 Select top 3 * from products
 select top 3 * from [Order Details]


 --Wir möchten alle Produkte mit Namen sehen, die 
 --mehr als 50 mal verkauft wurden in einer Bestellung
 --Ausgabe: Produktname, Menge und Bestellnummer

 --1 Schritt Join über die Tabellen (Order details und Products)

SELECT od.Quantity,od.orderid, p.ProductName
FROM   [Order Details] od  INNER JOIN  products p
       ON 
			p.ProductID = od.ProductID;

-- Schritt 2: Filtern

select * from [Order Details] where quantity > 50

--Schritt 3: Kombinieren
SELECT 
		od.Quantity,od.orderid,   --Bestellpositionen
		p.ProductName	   --Produktdaten
FROM   
	   [Order Details] od  INNER JOIN  products p
       ON 
	   p.ProductID = od.ProductID
where 
	   od.quantity > 50	  --Filter: nur die mehr 5ß Stück in Best hatten
order by Quantity desc;
