															drop table slf
drop view vdemo2

create table slf (id int, Stadt int, land int)

create view vdemo2 	with schemabinding
as
select id, stadt , land from dbo.slf

select * from vdemo2


insert into slf
select 1,10,100
UNION
select 2,20,200
UNION
select 3,30,300


alter table slf drop column land

alter table slf add fluss int

update slf set fluss = id *1000
