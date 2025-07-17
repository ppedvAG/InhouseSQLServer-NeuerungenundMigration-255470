create database HZG;
GO

USE HZG;
Go

create table t1 
	(
		id int identity,
		sp1 char(4100),
		so2 varchar(100)
	);
GO


insert into t1
select 'Hallo', 'Hallo'
GO 20000

--Spieltabelle verwenden

---Messen mit SET STATISTICS   :020_Messen.sql

select * into ku2 from ku;
Go

alter table ku2 add id int identity;
GO


set statistics io, time on

select * from ku2 where id = 1
dbcc showcontig('ku1')
 --Fragen?

set statistics io, time off

create nonclustered index NXI_CY  on KU2(country)








	 