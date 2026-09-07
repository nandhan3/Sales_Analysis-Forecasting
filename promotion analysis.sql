#Promotion vs Non-Promotion Sales
SELECT
    CASE
		WHEN onpromotion > 0 THEN 'Promotion' ELSE 'No Promotion'
    END AS promotion_status,
    COUNT(*) AS total_records,
    SUM(sales) AS total_sales,
    AVG(sales) AS average_sales
FROM sales_data
GROUP BY
    CASE
        WHEN onpromotion > 0 THEN 'Promotion'ELSE 'No Promotion'
    END;
    
    select count(*) from sales_data;
    
    drop table sales_data;
    
    CREATE TABLE sales_data (
    id INT,
    date DATE,
    store_nbr INT,
    family VARCHAR(100),
    sales DECIMAL(15,2),
    onpromotion INT,
    Year INT,
    Month_number INT,
    `Month Name` VARCHAR(20),
    Quarter VARCHAR(5),
    `Day Name` VARCHAR(20),
    Promotion_Status VARCHAR(20)
);

SELECT
    onpromotion,
    COUNT(*) AS record_count
FROM sales_data
GROUP BY onpromotion
ORDER BY onpromotion;

    