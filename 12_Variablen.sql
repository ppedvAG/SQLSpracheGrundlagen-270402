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

 --Variablen existieren  nur zur Laufzeit