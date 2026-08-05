					  --Gespeicherte Prozeduren
--Stored Procedures


--SP ähnlich wie Batch Dateien unter Windows
--eine Prozedur kann zahlreiche SQL-Befehle enthalten, die zusammen ausgeführt werden können
-- Es können Befehle wie SELECT, INSERT, UPDATE, DELETE, CREATE TABLE, DROP TABLE usw. enthalten sein

--Daher enthält oft die kopplette Logik einer Anwendung in einer Prozedur, die dann von der Anwendung aufgerufen wird

--Prozeduren werden aufgerufen


exec Prozedurname

--Prozeduren werden so geschrieben


create procedure Prozedurname
as
--Code


create or alter proc ProcDemo
as
select * from customers where customerid = 'ALFKI'
select * into ##t from orders where orderid < 10251
select * from  ##t
drop table ##t


exec Procdemo


--Prozeduren können mit Variablen arbeiten = Parameter


create or alter proc Procdemo2 @par1 int, @par2 int
as
select @par1 +@par2
GO


exec Procdemo2 10, 	4




--Flexibel nach Jahr und Kunde und Frachtkosten bestellungen suchen




select * from orders where customerid = 'ALFKI' and year(orderdate) = 1996


exec gpSucheBestellung 'ALFKI', 1997


 create or alter proc  gpsucheBestellung    @kdnr varchar(5), @jahr int
 as
 select * from orders where customerid = @kdnr and year(orderdate) = @jahr
 GO



  exec gpsucheBestellung 'BLAUS', 1997

  select 'X'+'Y' as T

 exec gpSucheKunden 'AL'


 create or alter proc gpSucheKunden @Kdnr varchar(5) ='%'
 as
 select * from customers where customerid like @Kdnr+'%'
 go

 exec gpSucheKunden	'ANA'



 delete from customers where customerid = 'ALFKI'

 --Kunden löschen

 zuerst die Order details des Kunden löschen
 die Orders des Kunden löschen
 dann Kunden löschen


 exec gpDeleteKunden 'ALFKI'























