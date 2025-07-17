--Wann verwendet man Hinweise?

/*
Normalerweise nicht 

Aber hier zB:

Abfragen arbeiten mit verschiedenen Parametern mal  langsam , mal schnell
OPTION (RECOMPILE)
OPTION (OPTIMIZE FOR UNKNOWN)
OPTION (OPTIMIZE FOR (@param = <typischer Wert>))

Wenn der Optimierer wiederholt einen schlechten Plan wählt 
OPTION (LOOP JOIN) / HASH JOIN
OPTION (FORCE ORDER)   SQL kann sih die Reihenfolge der Joins nicht mehr aussuchen

Die Anzahl der Kerne suboptimal sind : hohe CPU Last, Deadlocks
OPTION (MAXDOP n)
*/

--UNKNOWN
update ku2 set country = 'Disneyland' where id = 2

dbcc freeproccache
declare @land as varchar(100) 
set @land = 'Disneyland'

select * from ku2 where country = @land
option (optimize for unknown)
 ---??
select * from ku2 where country = 'Disneyland'

--Angaben mit WITH

/*
Warum Locks, wenn man sie Vermeiden kann..
--evtl Snapshotisolation

 Tabellenhinweise

NOLOCK	Liest ohne Sperren – kann „dirty reads“ verursachen.
HOLDLOCK	Hält Sperren bis Transaktionsende (wie SERIALIZABLE).
UPDLOCK	Fordert gleich beim Lesen Update-Sperren an.
TABLOCK	Sperrt ganze Tabelle.
TABLOCKX	Exklusive Sperre auf ganzer Tabelle.
INDEX(indexname)	Erzwingt die Verwendung eines bestimmten Indexes.
FORCESCAN, FORCESEEK	Erzwingt Table Scan oder Index Seek.

*/