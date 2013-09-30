/****************************************************

	You have enabled Versioning on your SharePoint
	Document Library and you want to know what is 
	happening, run this query. Average number of versions
	per document will help you perform crazy maths and
	scale your SharePoint environments. 
	
****************************************************/	

SELECT 
	DocVersions.Id,
	Docs.DirName,
	Docs.LeafName,
	COUNT(DocVersions.Id) AS 'Number of Versions'
FROM dbo.DocVersions
INNER JOIN Docs ON Docs.Id = DocVersions.Id
--WHERE DirName LIKE 'Documents%' -- If you need to sort on anything...
GROUP BY 
	DocVersions.Id,
	Docs.Id,
	Docs.DirName,
	Docs.LeafName
ORDER BY 'Number of Versions' DESC