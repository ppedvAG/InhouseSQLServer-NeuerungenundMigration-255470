 SELECT *
FROM sys.dm_exec_cached_plans AS cp
CROSS APPLY sys.dm_exec_sql_text(plan_handle) AS st
CROSS APPLY sys.dm_exec_query_plan_stats(plan_handle) AS qps
where st.dbid like db_id()	 and 
(text like '%customers%' or text like '%orders%'   )
;
GO


SELECT *
FROM sys.dm_exec_cached_plans
CROSS APPLY sys.dm_exec_query_plan_stats(plan_handle)
WHERE objtype ='Trigger';
GO

dbcc freeproccache

select customerid from Customers where customerid= 'ALFKI'

 select customerid from Customers 
 where customerid= 'ALFKI'


 select customerid from customers 
 where 
	customerid= 'ALFKI'

select * from orders where orderid = 1

select * from orders where orderid =300

select * from orders where orderid=100000