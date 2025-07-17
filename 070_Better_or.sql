use nwind

select * into o1 from orders
--korrekte INdizes erstellen

 set statistics io , time on

select orderid, customerid 
from o1
where freight < 2 or employeeid < 10

select orderid, customerid 
from o1
where freight < 2
UNION 
select orderid, customerid 
from o1
where  employeeid < 10

drop table o1