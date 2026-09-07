#Year-over-Year Sales
SELECT Year,
    SUM(sales) AS total_sales FROM sales_data
GROUP BY Year
ORDER BY Year;

#yoy growth sales
WITH yearly_sales AS (
    SELECT
        Year,
        SUM(sales) AS total_sales
    FROM sales_data
    GROUP BY Year
)
SELECT Year, total_sales,
    LAG(total_sales) OVER (ORDER BY Year) AS previous_year_sales,
    ROUND(
        ((total_sales - LAG(total_sales) OVER (ORDER BY Year))
        / NULLIF(LAG(total_sales) OVER (ORDER BY Year), 0)) * 100, 2) AS yoy_growth_percent
FROM yearly_sales
ORDER BY Year;

#3-Month Moving Average
WITH monthly_sales AS (
    SELECT
        YEAR(date) AS Year,
        MONTH(date) AS Month_Number,
        SUM(sales) AS Total_Sales
    FROM sales_data
    GROUP BY YEAR(date), MONTH(date)
)
SELECT
    Year,
    Month_Number,
    Total_Sales,
    ROUND(
        AVG(Total_Sales) OVER (
            ORDER BY Year, Month_Number
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS 3_Month_Moving_Average
FROM monthly_sales
ORDER BY Year, Month_Number;

#Recent Sales Trend
SELECT
    YEAR(date) AS Year,
    MONTH(date) AS Month_Number,
    MONTHNAME(date) AS Month_Name,
    SUM(sales) AS Total_Sales
FROM sales_data
GROUP BY
    YEAR(date),
    MONTH(date),
    MONTHNAME(date)
ORDER BY Year DESC, Month_Number DESC LIMIT 6;