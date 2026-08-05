			   --Variablen 

declare @var as int = 500



select * from 
	orders where freight >	@var

	declare @var1 as varchar(50)
	set @var1 = 'QUICK'
	declare @jahr as int = 1996

   select * from customers where customerid = @var1
  select * from orders where customerid = @var1	 and year(orderdate) = @jahr


 declare @var2 as int = 10, 
		 @var3 as varchar(50) = 'Test'

 select @var2, @var3

 --Variablen existieren  nur zur Laufzeit während eine Batches
 --!! Achtung GO 


 --Variablen vereinfachden code

 --müssen deklariert werden

 declare @varname as Datentyp

 /*
 int ganze Zahl von  ca -2,1 Mrd --> + 2,1 Mrd
 Smallint 32000
 tinint	   255

 decimal(5,2)  5 Stellen insgesamt, 2 Nachkommastellen
 float --viele Nachkommastellen
 money -- 8 Nachkommastellen..keine Währung

 varchar(50) .. max 50 Zeichen 
 char(50)   fix 50 Zeichen 
 nchar(50)
 nvarchar(50)  n steht für UNICODE		--verdopplet die Menge

 datetime ms genau
 date
 time
 datetime2 100ns genau

 */


declare @var1 as date = '12.4.1996'
select @var1
GO
set @var1 = '15.5.2026'
select @var1

GO
--ist kein TSQL Befehl , sonderne eine Anweisung für den Editor
--Batchdelimiter


 select 100
 GO 5

--Wert aus der DB zuweisen
declare @var4 as money
select @var4= freight from orders where orderid = 10248

select freight from orders where orderid = 10248
select @var4


--Ist nicht erlaubt
select @var4= freight, freight from orders where orderid = 10248



--Erstelle eine Variable die den Durschnitt der Frachtkosten enthalten soll

declare @schnittfracht as money
select @schnittfracht = AVG(freight) from orders  where year(orderdate) = 1996
 select @schnittfracht



select * from orders where freight < @schnittfracht


--Wie hat sich der Schnitt der Frachtkosten von 1996 auf 1997 verändert?


declare		@schnittfracht96 as money 
		,   @schnittfracht97 as money


select @schnittfracht96= AVG(freight) from orders  where year(orderdate) = 1996
select @schnittfracht97= AVG(freight) from orders  where year(orderdate) = 1997

select @schnittfracht96 -@schnittfracht97, @schnittfracht96, @schnittfracht97















 */


