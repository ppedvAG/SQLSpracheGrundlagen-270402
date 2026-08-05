--DISTINCT filtert aus der Ergebnismenge die doppelten Zeilen


select distinct country from customers  --91 Kunden in 21 Länder

select distinct country, customerid from customers  --es wird keine doppelten geben



--TOP  filtert aus dem Ergebnis die ersten Zeilen aus
--	eigtl sollt emit einem TOP Befehl immer ein Order by mitanegeben werden,
--sonst ist es mehr oder weniger Zufall, was die ersten TOP n sind


select top 	5 * from customers

--die 5 teuersten Frachkosten bestellungen

select top 5* from orders order by  freight desc

--die 5 billigstenFrachkosten bestellungen

select top 5 * from orders order by  freight asc


--Zeige mal die ersten 13 Bestllungen an  
--sortiert nach frachtkosten aufsteigend

--falls der letzte Wert auch in nachfolgende DS vorkommen sollte, 
--kann mna mit Krawatte (with ties) diese zusätzlich ausgeben lasssen
select top 13 with ties freight as FR, * from orders order by freight 


select top 10 percent * from orders

 --auch kombination
select distinct top 3 country from customers	order by country






