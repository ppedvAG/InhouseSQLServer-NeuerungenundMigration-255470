--Seiten und Blöcke


create table t1 (id int identity, spx char(4100));
GO

insert into t1 
select 'XY';
GO 20000 --22 Sek .. 17 Sek ..20 Sek.. 1 Sekunde


--1 DS hat ca 4kb--> 20000*4kb --> 80MB--> aber 160MB

--Prüfung
dbcc showcontig('t1')
--- Gescannte Seiten.............................: 20000
-- Mittlere Seitendichte (voll).....................: 50.79%


/*

Seiten haben Nummern  und werden einfach durchgezählt

WIr vernachlässigen aktuell: SGAM OGAM





Seite = Pages  :  8192 bytes
- 1 DS muss in Seite passen (hier zählen nur die Längen fixen Datentypen)
- 1 DS mit fixen Längen muss <) 8060 sein
- Die Nutzlast der Seite = 8072 bytes
- Maximala Anzahl der DS pro Seite = 700
- Seiten kommen 1:1 in RAM

--> jeder nicht genutze Platz in der Seite ist Verlust auf HDD und RAM

Blöcke = Extents


--Blöcke = 8 zusammenhängende  Seiten am Stück

--> uniform extents:Alle acht Seiten gehören demselben Objekt (z. B. einer Tabelle).
--> mixed extents:Die acht Seiten können zu verschiedenen Objekten gehören

SGAM (Shared Global Allocation Map)
SGAM-Seiten sind wie GAM-Seiten 8 KB groß.
Sie speichern für jedes Extent ein Bit, das anzeigt, ob das Extent ein Mixed Extent ist, das noch mindestens eine freie Seite enthält.
Ein gesetztes Bit (1) bedeutet: Mixed Extent mit mindestens einer freien Seite.
Ein nicht gesetztes Bit (0) bedeutet: Entweder kein Mixed Extent oder keine freie Seite mehr vorhanden.
SGAM-Seiten helfen SQL Server, freie Seiten für neue Datenzeilen effizient zu finden.

GAM (Global Allocation Map)
GAM-Seiten 
zeigen, ob ein Extent frei (Bit = 1) oder belegt (Bit = 0) ist.
Jede GAM-Seite verwaltet etwa 64.000 Extents (ca. 4 GB Daten).
GAM und SGAM-Seiten wechseln sich regelmäßig in der Datenbankdatei ab, jeweils für etwa 4 GB Daten.

IAM (Index Allocation Map)
IAM-Seiten zeigen, welche Extents zu einem bestimmten Objekt (z. B. einer Tabelle oder einem Index) gehören.

Jede IAM-Seite kann etwa 4 GB Speicher (eine sogenannte GAM-Interval) abdecken.

Für jedes Objekt gibt es eine eigene IAM-Kette, die alle zugehörigen Extents verfolgt



jeder nicht genutzte Patz in der Seite ist Verlust auf HDD und RAM

!! SQL Server holt immer komplette Seiten und Blöcke 1:1 in Speicher - ungeachtet wie hoch die Auslastung sein sollte


8 zusammenhängende Seiten werden Block genannt

engl: Page / Extent
*/

*/

create table t2 (id int, spx varchar(4100), spy char(4100))








