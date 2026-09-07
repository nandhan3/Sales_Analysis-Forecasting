SELECT
    CASE
        WHEN h.date IS NOT NULL THEN 'Holiday'
        ELSE 'Non-Holiday'
    END AS Holiday_Status,
    COUNT(*) AS Total_Records,
    SUM(s.sales) AS Total_Sales,
    AVG(s.sales) AS Average_Sales
FROM sales_data s
LEFT JOIN holidays h
    ON s.date = h.date
GROUP BY Holiday_Status;

#Holiday-wise Sales
SELECT
    h.description AS Holiday,
    COUNT(s.id) AS Total_Records,
    SUM(s.sales) AS Total_Sales,
    AVG(s.sales) AS Average_Sales
FROM sales_data s
INNER JOIN holidays h
    ON s.date = h.date
GROUP BY h.description
ORDER BY Total_Sales DESC LIMIT 10;

#Holiday vs Non-Holiday by Product Family
SELECT
    CASE
        WHEN h.date IS NOT NULL THEN 'Holiday'
        ELSE 'Non-Holiday'
    END AS Holiday_Status,
    s.family,
    SUM(s.sales) AS Total_Sales,
    AVG(s.sales) AS Average_Sales
FROM sales_data s
LEFT JOIN holidays h
    ON s.date = h.date
GROUP BY Holiday_Status, s.family
ORDER BY Holiday_Status, Total_Sales DESC;

#Holiday vs Non-Holiday by Store Performance
SELECT
    CASE
        WHEN h.date IS NOT NULL THEN 'Holiday'
        ELSE 'Non-Holiday'
    END AS Holiday_Status,
    s.store_nbr,
    SUM(s.sales) AS Total_Sales,
    AVG(s.sales) AS Average_Sales
FROM sales_data s
LEFT JOIN holidays h
    ON s.date = h.date
GROUP BY Holiday_Status, s.store_nbr
ORDER BY Holiday_Status, Total_Sales DESC;