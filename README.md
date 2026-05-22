
# E-Commerce Sales Performance & Fulfillment Analytics (SQL)
## DecodeLabs Internship — Advanced SQL Case Study

---

## 1. Business & Technical Objective
The goal of this project was to transition raw e-commerce transactional data into a relational database system (Microsoft SQL Server) and leverage structured query logic to extract operational performance metrics. 

By filtering out pending or cancelled transactions, this query isolates completed fulfillment cycles (`OrderStatus = 'Delivered'`) to identify high-velocity sales dates, track order volume, and rank real-time revenue performance.

---

## 2. The Production Script
This query leverages temporal grouping, record filtering, and explicit data type casting to provide clear, high-precision aggregation data. 

*The raw script can be accessed directly in the repository at:* `scripts/sales_performance_analysis.sql`

```sql
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
```
## 3. Technical Execution Breakdown
* **Financial Precision Hardening:** The query uses `CAST(... AS DECIMAL(10,2))` on the aggregated `TotalPrice` metric. This strips away default floating-point variations in SQL Server, forcing financial revenue data into a clean, enterprise-standard decimal format.
* **Optimized Execution Filtering:** By applying the filtering predicate (`WHERE OrderStatus = 'Delivered'`) *before* the grouping phase, the SQL engine skips computing calculations on pending, cancelled, or returned records, maximizing query efficiency.
* **Granular Deterministic Grouping:** Grouping by both `Date` and `OrderStatus` explicitly aligns categorical fields, preparing the output for seamless consumption by downstream business intelligence tools.
---
## 4. Query Execution Results & Executive Insights
The query executed successfully across **1,409 transactional records**. Below are the top historical revenue-generating performance metrics:

| Rank | Fulfillment Date | Order Status | Total Orders | Realized Revenue ($) |
| :--- | :--- | :--- | :--- | :--- |
| **1** | 2024-06-29 | Delivered | 2 | $4,564.00 |
| **2** | 2023-07-06 | Delivered | 2 | $3,548.00 |
| **3** | 2023-08-17 | Delivered | 1 | $3,456.00 |
| **4** | 2023-05-02 | Delivered | 1 | $3,391.00 |
| **5** | 2023-05-01 | Delivered | 2 | $3,361.00 |

###  Executive Takeaways
* **High-Ticket Concentration:** Single-order days like `2023-08-17` generated **$3,456.00**—almost neck-and-neck with multi-order days. This reveals a clear presence of **High-Value Orders (HVO)** driving top-line revenue, suggesting a product mix with premium items.
* **Volume Stability:** Peak performance days consistently show low order counts (1 or 2 orders) yielding thousands in revenue. This highlights that the store relies heavily on premium basket sizes rather than low-margin bulk volume.
---
## 5. Environment & Tools Used
* **RDBMS:** Microsoft SQL Server (SSMS)
* **SQL Techniques:** Aggregations (`SUM`, `COUNT`), Grouping (`GROUP BY`), Conditional Filtering (`WHERE`), Explicit Data Type Casting (`CAST`), and Sorting (`ORDER BY`).
