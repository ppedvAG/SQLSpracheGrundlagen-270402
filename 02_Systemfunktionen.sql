--Datumsfuntkionen

select 	'3.8.2026 10:31:10.872'

--der Teil eines Datums
select datepart(yy,'3.8.2026 10:31:10.872')

--oder einfacher mit YEAR()
select 	year('3.8.2026 10:31:10.872' )

select 	Month('3.8.2026 10:31:10.872' )

--Kalenderwoche??
--Datumsfuntkionen

select 	'3.8.2026 10:31:10.872'

--der Teil eines Datums
select datepart(hh,'3.8.2026 10:31:10.872')


select month(orderdate) from orders
where year(orderdate)= 1996


--Welches Datum ist in 57 Tage

select dateadd(dd,57, '3.8.2026')


select dateadd(dd,57, getdate()	 )

select getdate()  --geht auf ms genau

--vor 33 Tage

select dateadd(dd, -33, getdate())

--Kann nman auch Datumsdifferenzen errechne

select datediff(dd,'3.8.2026', '1.7.2026')	  -- -33 

select datediff(dd, '1.7.2026','3.8.2026')	  -- +33


--tage oder Stunden seit Mondlandung
select datediff (hh,getdate(),'20.7.1969')	 --500000 Stunden


select datename(mm, getdate())

select datename(dd, getdate())

select datename(dw, '17.8.2026')   --dw für day of week





--Mathe


select 2+4

select  2*4

select '2' + '3'	--Text ! wird zusammengefügt

select '10' +2

--mit Spalten läßt sich auch rechnen
--Datentypen müsen passen
select UnitPrice*Quantity from [Order Details]

select   14
		,00 * 12 from [Order Details]

select 14.00 *12   from [Order Details]



--Textfunktionen

'otto                                   Maier'
--Datentypen:
--char(Zahl) .. ist immer fix (Zahl) lang

--Wie könnte ich Leerzeichen entfernen

--TRIM
select 'otto            '

select rtrim('otto            ')

--Ich möchte die Länge wissen...
--LEN   datanlength
select datalength('otto            ' )


select datalength(rtrim(' otto            '))

--SSIS



Select left('ottO',2)  , right ('ottO',2)

select substring('abcdefghij',10-1,2)

--Idee  LEN gibt uns die Länge zurück (10)

select LEN('abcdefghij')

 select substring('abcdefghij',LEN('abcdefghij')-1,2)


 --Ersetzt den markierten Teil durch Text
 --, der kann beliebig lang sein
 select stuff ('abcdefgh',3,2,'x')

 --Palindrome

 select reverse('abcdefgh')



 --TelNr: 08677-9889409 --> 08677-9889xxx



 --Versuche bei einee beliebigen NUmmer die letzten 3 Zeichen auszu x-en
 


 --reverse
 --stuff
 substring
 left 
 right
 


 select reverse(
				stuff(
						reverse('08677-9889653')
						,1
						,3
						,'XXX'
					  )
				)














