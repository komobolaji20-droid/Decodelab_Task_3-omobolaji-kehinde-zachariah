/* ===================================================================
PROJECT: DecodeLabs E-Commerce Analytics
OBJECTIVE: Temporal Aggregation, Fulfillment Filtering, & Revenue Ranking
AUTHOR: OMOBOLAJI KEHINDE ZACHARIAH
===================================================================
*/

SELECT 
    Date,
    OrderStatus,
    COUNT(OrderID) AS total_order,
    CAST(SUM(TotalPrice) AS DECIMAL(10,2)) AS Revenue
FROM 
    [Dataset for Data Analytics (1)]
WHERE 
    OrderStatus = 'Delivered'
GROUP BY 
    Date, 
    OrderStatus
ORDER BY 
    Revenue DESC;
