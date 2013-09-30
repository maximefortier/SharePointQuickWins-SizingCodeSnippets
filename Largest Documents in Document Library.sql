/****************************************************

	You have enabled large documents in your SharePoint
	Document Libraries and you want to know what is 
	happening: run this query. Those numbers will help
	you perform crazy maths and scale your SharePoint 
	environments.
	
****************************************************/	

-- This query displays the largest objects found in the Document Library.  
SELECT TOP(50)
--SELECT
	LeafName AS 'Filename' ,
	DirName AS 'Directory', 
	Size AS 'Size'
	--CAST((CAST(CAST(Size AS DECIMAL(10,2))/1024 AS DECIMAL(10,2))/1024) AS DECIMAL(10,2)) AS 'Size in MB'
--,*
FROM [WSS_Content].[dbo].[Docs]
WHERE 
	DirName Like 'Documents%'
	AND DirName <> 'Documents/Forms'
	AND Type = 0
ORDER BY Size DESC
