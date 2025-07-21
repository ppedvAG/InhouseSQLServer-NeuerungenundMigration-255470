														use Graphdb

drop table if exists maedels
drop table if exists distance
GO

create table Maedels
	(
	ID INTEGER PRIMARY KEY,
	name VARCHAR(100) ,
	Skala int
	) AS NODE;


create table Distance (km int) as Edge

 INSERT INTO Maedels(ID, name, Skala)
			   SELECT 1, 'Hans',0
         UNION SELECT 2, 'Susi',7
         UNION SELECT 3, 'Gabi',5
         UNION SELECT 4, 'Evi',9
         UNION SELECT 5, 'Elli', 5
		 UNION SELECT 6,'Petra', 7
		 UNION SELECT 7,'Eva',8
		 UNION SELECT 8,'Nicole',6
		 UNION SELECT 9,'Diana',8
		 UNION SELECT 10,'Rosi',2
		 UNION SELECT 11,'Anna',5
		 UNION SELECT 12,'Elena',7
		 UNION SELECT 13,'Birgit',3
		 UNION SELECT 14,'Jasmin',8
		 UNION SELECT 15,'Tina',10

INSERT INTO Distance
    VALUES ((SELECT $node_id FROM Maedels WHERE ID = 1), (SELECT $node_id FROM Maedels WHERE ID = 2), 16)
         , ((SELECT $node_id FROM Maedels WHERE ID = 1), (SELECT $node_id FROM Maedels WHERE ID = 5), 12)
         , ((SELECT $node_id FROM Maedels WHERE ID = 1), (SELECT $node_id FROM Maedels WHERE ID = 7), 8)
         , ((SELECT $node_id FROM Maedels WHERE ID = 1), (SELECT $node_id FROM Maedels WHERE ID = 10), 7)
         , ((SELECT $node_id FROM Maedels WHERE ID = 1), (SELECT $node_id FROM Maedels WHERE ID = 13), 3)
		 , ((SELECT $node_id FROM Maedels WHERE ID = 2), (SELECT $node_id FROM Maedels WHERE ID = 3), 4)
         , ((SELECT $node_id FROM Maedels WHERE ID = 3), (SELECT $node_id FROM Maedels WHERE ID = 4), 5)
         , ((SELECT $node_id FROM Maedels WHERE ID = 4), (SELECT $node_id FROM Maedels WHERE ID = 5), 1)
         , ((SELECT $node_id FROM Maedels WHERE ID = 5), (SELECT $node_id FROM Maedels WHERE ID = 6), 10)
		 , ((SELECT $node_id FROM Maedels WHERE ID = 7), (SELECT $node_id FROM Maedels WHERE ID = 8), 10)
         , ((SELECT $node_id FROM Maedels WHERE ID = 8), (SELECT $node_id FROM Maedels WHERE ID = 9), 5)
         , ((SELECT $node_id FROM Maedels WHERE ID = 10), (SELECT $node_id FROM Maedels WHERE ID = 11), 11)
         , ((SELECT $node_id FROM Maedels WHERE ID = 11), (SELECT $node_id FROM Maedels WHERE ID = 12), 2)
		 , ((SELECT $node_id FROM Maedels WHERE ID = 13), (SELECT $node_id FROM Maedels WHERE ID = 14), 8)
         , ((SELECT $node_id FROM Maedels WHERE ID = 12), (SELECT $node_id FROM Maedels WHERE ID = 9), 3)
         , ((SELECT $node_id FROM Maedels WHERE ID = 14), (SELECT $node_id FROM Maedels WHERE ID = 15), 17)
         , ((SELECT $node_id FROM Maedels WHERE ID = 9), (SELECT $node_id FROM Maedels WHERE ID = 15), 1)






 Select 
	m1.name
	, string_agg(m2.name, '->') WITHIN GROUP (GRAPH PATH) AS  Maedel
	, sum(km) within group (GRAPH PATH)
 from 
	maedels m1	,
	distance	FOR PATH as d,
	maedels	FOR PATH as m2 
 where
		match (SHORTEST_PATH(m1(-(d)->m2)+))
	and 
		m1.name = 'HANS'




   WITH LadyChecker 
  as
  (
          SELECT   distinct
                   m1.Name AS Start
               ,   SUM(D.km)                WITHIN GROUP (GRAPH PATH)    AS EntfernungKm  
               ,   last_Value(m2.name)      within Group (GRAPH PATH)    as toCheck 
               ,   LAST_VALUE(m2.Skala)     WITHIN GROUP (GRAPH PATH)    as SolidexPlus
               ,  string_agg(m2.name,'-->') WITHIN GROUP (GRAPH PATH)    as waytoHeaven
               ,  (SUM(D.km)                WITHIN GROUP (GRAPH PATH) 
               +  LAST_VALUE(m2.Skala)      WITHIN GROUP (GRAPH PATH))   as CheckQuote
 
        FROM 
                    Maedels AS m1
                ,   maedels m3  ,
                    Distance    FOR PATH AS D,
                    Maedels     FOR PATH AS m2
        WHERE 
                MATCH(
                        SHORTEST_PATH(
                                        m1(-(D)->m2)+
                                      )
                      )
        AND
                m1.Name = 'Hans'
 )
select * from ladychecker  where Solidexplus >=8 order by Checkquote asc


--Alle Möglichkeiten
select m1.name 
            , string_agg(m2.name, '-->')  within Group (GRAPH PATH)
            , sum(d.km) within group (graph path)
from  maedels   as m1,
      distance for path as d,
      maedels for path as m2
where
        MATCH(SHORTEST_PATH(m1(-(d)->m2)+))

select m1.name 
            , string_agg(m2.name, '-->')  within Group (GRAPH PATH)
            , sum(d.km) within group (graph path)
from  maedels   as m1,
      distance for path as d,
      maedels for path as m2
where
        MATCH(SHORTEST_PATH(m1(-(d)->m2)+))


select m1.name, m2.name 
            , string_agg(m2.name, '-->')  within Group (GRAPH PATH)
            --, sum(d.km) within group (graph path)
from  maedels   as m1,
      distance  d,
      maedels for path as m2,
      distance  d2,
      maedels  m3  
    
where
        MATCH(m1-(d)->m2-(d2)->m3) 
														

 WITH LadyChecker 
  as
  (
          SELECT   distinct
                   m1.Name AS Start
               ,   SUM(D.km)                WITHIN GROUP (GRAPH PATH)    AS EntfernungKm  
               ,   last_Value(m2.name)      within Group (GRAPH PATH)    as toCheck 
               ,   LAST_VALUE(m2.Skala)     WITHIN GROUP (GRAPH PATH)    as SolidexPlus
               ,  string_agg(m2.name,'-->') WITHIN GROUP (GRAPH PATH)    as waytoHeaven
               ,  (SUM(D.km)                WITHIN GROUP (GRAPH PATH) 
               +  LAST_VALUE(m2.Skala)      WITHIN GROUP (GRAPH PATH))   as CheckQuote
 
        FROM 
                    Maedels AS m1
                ,   maedels m3  ,
                    Distance    FOR PATH AS D,
                    Maedels     FOR PATH AS m2
        WHERE 
                MATCH(
                        SHORTEST_PATH(
                                        m1(-(D)->m2)+
                                      )
                      )
        AND
                m1.Name = 'Hans'
 )
select * from ladychecker  where Solidexplus >=8 order by Checkquote asc



SELECT 
    m1.Name AS Start,
    SUM(D.km) WITHIN GROUP (GRAPH PATH) AS EntfernungKm,
    LAST_VALUE(m2.Skala) WITHIN GROUP (GRAPH PATH) ,

FROM Maedels AS m1,
     Distance FOR PATH AS D,
     Maedels FOR PATH AS m2
WHERE MATCH(SHORTEST_PATH(m1(-(D)->m2)+))
  AND m1.Name = 'Hans';



