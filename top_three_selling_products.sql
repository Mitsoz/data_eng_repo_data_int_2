-- calculating top three selling products
SELECT  ps.ProductID, p.ProductName, c.CategoryName, c.Description, ROUND(ps.total, 2) AS revenue 
FROM (
	SELECT ProductID, SUM(UnitPrice * Quantity * (1-Discount)) AS total
	FROM "Order Details"
	GROUP BY 1
) AS ps
JOIN Products p ON p.ProductID = ps.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY 5 DESC
LIMIT 3;
