							SELECT 
		SpaltenA as A, Spalte B
		Mathe
		F(Spalte), F(Wert)	  , 
		'Text' , Zahl
		AGG (SUM, MIN, MAX, AVG, COUNT)

FROM Tabelle1 A JOIN (LEFT, RIGHT, INNER, CROSS) Tabelle2 B ON A.SP = B.SP
				JOIN VIEW v   ON  v.sp = a.sp
				JOIN Tabelle3 c on c.spx ?= b.spx
				JOIN VIEW2 v2 ON v2.spy = c.spy
				JOIN (select ...) t1 on t1.spz = v.spz
WHERE	Spalten
GROUP BY (alle Spalten des SELECTs ohne Alias , aber keine AGG)	 HAVING AGG ()  > < ...
ORDER BY



select * from (select * from custoemrs) sc join TabelleX x on x.sp = sc.sp
where sc.sp = 10



select * from [Sales by Category]	 c where c.



  Liste alle Kunden aus Austria auf und zeige daneben den MAX Frachtkosten wert an

  Fa X  13,7
  FA Y 18,0

  select top 3 * from customers

  select top 3 * from orders

  --Schritt 1: Tabellen Joinen um auf alle Spalten Zugriff zu haben
  --			und sie nebeneinander darstellen zu können

  select top 3 * from customers c inner join orders o on c.customerid = o.customerid

  --Schritt 2 : nur die notwendigen Spalten und Where
  SELECT	Companyname, freight--, Country
  from 
			customers c inner join orders o on c.customerid = o.customerid	
  where		
			country = 'AUSTRIA'  --AND OR


--Schritt 3: Aggregat errechnen
   SELECT	Companyname, max(freight) as MaxFreight --, Country
  from 
			customers c inner join orders o on c.customerid = o.customerid	
  where		
			country = 'AUSTRIA'  --AND OR
  group by 	Companyname
  order by 	MaxFreight desc

  --Welche 3 Produkte wurde gemessen an Stückzahl am meisten verkauft ?

  --Ergebnis
  ----Produktname |  Stückzahl
  -- CHAI            140
  -- Rössel          1200
  -- Semmelkn         500

  --Join zum Präsentieren der Daten

  select p.productname, od.quantity
  from  [order details]	od inner join products p on p.productid = od.productid
  order by productname

  --Nun die Berechnung: die Summe der Stückzahlen pro Produkt
  --und dann sortieren nach Stückzahlen und Top 3

  select top 3 p.productname, sum(od.quantity) as Anzahl
  from   [order details]	od inner join products p on p.productid = od.productid
  group by p.productname
  order by Anzahl desc




  --Gibt es Kunden, die nichts kauften


  select * from customers		--91

  select distinct customerid from orders	 --89


  --INNER JOIN



  select  c.customerid, o.customerid, o.orderid
  from customers c left join orders o on c.customerid = o.customerid
  where orderid is null
  order by orderid 


  
    select  c.customerid, o.customerid, o.orderid
  from orders o right join customers c  on c.customerid = o.customerid
  where orderid is null
  order by orderid 

  --Gibt es Bestellungen, die keinen Kunden haben
  
  select
		c.customerid, o.customerid, o.orderid 
  from 
		customers c right join orders o on c.customerid = o.customerid
  where c.customerid is null

    select
		c.customerid, o.customerid, o.orderid 
  from 
				orders o	left join customers c   on c.customerid = o.customerid
  where c.customerid is null


  


