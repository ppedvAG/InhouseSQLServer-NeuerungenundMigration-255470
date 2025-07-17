# InhouseSQLServer-NeuerungenundMigration-255470
KursRepository zu Kurs Inhouse: SQL Server - Neuerungen und Migration der ppedv AG



1.	DB Design 
Warum Normalisierung nicht alles ist
Physikalisches Design: Bedeutung der Datentypen / Seiten/ Bl�cke
Auslastung der Seiten messen

	
2.	Prinzipielles Messen (20min)
Pl�ne verstehen (gesch�tzter, tats�chlicher und Liveplan)
Set statistics io, time on
QueryStore Aktivierung
	
3.	Indizes (0,5T+)
Aufbau der Indizes (wie wird ein IX eigtl aufgebaut)
Varianten von Indizes und deren Einsatzgebiet
T�gliche toDos bei Indizes
Bedeutung der Statistiken f�r Abfragen und Indizes
Columnstore Index � der WunderIndex?
�Wundersame� Effekte durch Indizes

4.	Fakten: Ad-hoc Queries vs Views vs F() vs Prozeduren im Vergleich (1h)
	a.	Bad Views
	b.	Bad functions
	c.	Bad Procedures
	d.	Bad parameter sniffing
Fragen: 
Warum schneiden Prozeduren manchmal so extrem schlecht ab?
Warum l�gt der SQL Server uns bei den Pl�nen an?
Was sind IQPs? Und wann helfen sie undwas lernen wir davon?

5.	Verarbeitungshinweise (0,5h)
OPTION MAXDOP / 

6.	QueryStore Analyse (0,5h)
Wie hilft mir der QueryStore? Analyse von Abfragen

7.	TSQL Tipps  (0,5h)
	a.	Where AND und OR Kombis
	b.	Where OR Optimieren

8.	Security (max 15min)
Neue Serverrollen

9.	Transactions (45min)
Was sollte man bei TX beachten?
Locks und Locks umgehen
Bedeutung von Virtual Logfiles

10.	Temporale Tabellen (30min Demo)
System-Versionierung von Datens�tzen

11.	Graph Tabellen (20min Demo)

12.	Filestreaming und Filetable (20min � Demo)
Demo: wie k�nnte man alternativ Dateien im SQL Server ablegen

13.	Sonstiges
Woher weiss ich, welches TSQL in kommenden Genrationen nicht mehr funktionieren wird?
Wie kann ich SQL Server fragen, wo der Schuh dr�ckt (Wait_Stats)
Featurevergleich SQL Express vs Std / Ent

14. Windowfunctions



