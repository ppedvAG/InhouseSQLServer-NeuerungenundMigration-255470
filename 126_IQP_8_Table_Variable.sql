/*
Der Optimierer schätzte immer, dass eine Tabellenvariable genau 1 Zeile enthält – egal, wie viele tatsächlich drin sind.
Dadurch wurden häufig falsche Join-Strategien, fehlende Indexnutzung und schlechte Pläne erzeugt.
Besonders schlimm bei größeren Datenmengen in Prozeduren oder Batch-Verarbeitung
 
Ab SQL Server 2019 (Kompatibilitätslevel 150) aktiviert IQP die sogenannte:

Deferred Compilation for Table Variables
 
 Kennt der Optimierer die echte Zeilenanzahl der Tabellenvariable bei der Kompilierung.

SQL Server generiert einen deutlich besseren Plan, z. B. Hash Join statt Nested Loop, passende Parallelität etc.
 */

ALTER DATABASE NWIND SET COMPATIBILITY_LEVEL = 120;  --1
ALTER DATABASE NWIND SET COMPATIBILITY_LEVEL = 130; --1
ALTER DATABASE NWIND SET COMPATIBILITY_LEVEL = 140; --1
ALTER DATABASE NWIND SET COMPATIBILITY_LEVEL = 160;
GO

set statistics io, time on

DECLARE @OrderDet TABLE
	([Orderid] BIGINT NOT NULL,
	 Quantity INT NOT NULL
	);
	INSERT @OrderDet
	SELECT [Orderid], [Quantity]
	FROM [Order Details]
	WHERE  [Quantity] > 99;


-- Look at estimated rows, speed, join algorithm
SELECT oh.orderid, oh.orderdate,
   oh.freight
FROM orders AS oh
INNER JOIN @OrderDet AS o 	ON o.orderid = oh.orderid
WHERE oh.freight < 10.10
ORDER BY oh.freight DESC;
GO


