SELECT 
	  SpalteA, SpalteB,
	  Mathe,
	  f(Spalte),
	  'text',
	  t.sp
FROM 
		TABELLE t
WHERE
		t.Spalte = > < >= <= != Wert | 'TEXT'
		AND | OR
		t-SpalteB < > <= >= != WERT
		--bei Mix von AND und OR Klammern setzen
		OR
		t.Sp IN (Wert1, Wert2, Wert3....) --tSp = Wert OR t.SP = Wert ..
		OR
		t.Sp BETWEEN Wert1 AND Wert2 --t.Sp >= Wert1 AND t.Sp <= Wert2
ORDER BY t.spA asc (= default) | desc


select * from orders
order by customerid


--sortiere nach Frachtkosten , so dass die höchsten zuerst kommen

select * from orders
order by Freight desc 


--Kann man auch nach Spalten sortieren, die nicht ausgegebn werden
 --ja

select city, country from customers
order by country


--kann man mehrfach sortieren wie Telefonbuch

select * from customers
order by country , city



select  * from customers
order by country asc , city desc

--ey geht auch mit der Spaltenpostion
--die 4te 
select 100,* from customers
order by 4, 2 desc

--ALIAS
select    freight		as Nettofracht
		, freight *1.19 as Bruttofracht
		, orderid
		, orderdate 
from orders	o
order by Bruttofracht desc




select o.OrderID, freight as Nettofracht, o.EmployeeID
from orders	o
where
	o.Freight < 10
order by o.freight


select o.OrderID, freight as Nettofracht, o.EmployeeID
from orders	o
where
	nettofracht < 10
order by nettofracht


--Ein Spaltenalias ist nur im SELECT und im ORDER BY möglich

--> FROM  -- JOIN --WHERE -- SELECT --> order by --> Ausgabe















