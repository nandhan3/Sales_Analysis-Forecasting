#Monthly Sales Trend
SELECT
    YEAR(date) AS year,
    MONTH(date) AS month_number,
    MONTHNAME(date) AS month_name,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY YEAR(date), MONTH(date), MONTHNAME(date)
ORDER BY year, month_number;

#Weekly Sales Trend
SELECT
    YEAR(date) AS year,
    WEEK(date, 1) AS week_number,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY YEAR(date), WEEK(date, 1)
ORDER BY year, week_number;

#Highest sales by day
SELECT date, SUM(sales) AS total_sales FROM sales_data
GROUP BY date
ORDER BY total_sales DESC LIMIT 3;