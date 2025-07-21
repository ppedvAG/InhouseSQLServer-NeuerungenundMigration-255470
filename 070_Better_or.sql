use nwind

set statistics io, time on
select * into o1 from orders
--korrekte INdizes erstellen

 set statistics io , time on

select orderid, customerid 
from o1
where freight < 2 or employeeid < 10


create nonclustered Index nix1 on o1 (freight) 	include (orderid, customerid )

create nonclustered Index nix2 on o1 (employeeid) 	include (orderid, customerid )

 dbcc freeproccache
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