-- Counts the number of rows in each table, placing the results in a temporary user table.
-- Note: The sp_MSForEachTable stored procedure is not documented and may be removed from SQL Server in future versions without any heads up.

CREATE TABLE #table_rows
(
    table_name varchar(255),
    row_count int
)
EXEC sp_MSForEachTable @command1 = 'INSERT #table_rows (table_name, row_count) SELECT ''?'', COUNT(*) FROM ?'
SELECT 
	table_name, row_count
FROM 
	#table_rows 
ORDER BY
	table_name, row_count
DESC
DROP TABLE #table_rows
