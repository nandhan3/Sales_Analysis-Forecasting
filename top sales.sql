select * from sales_data;
select sum(sales) as Total_Sales from sales_data;

select avg(sales) as Average_sales from sales_data;

select COUNT(DISTINCT store_nbr) AS total_stores
FROM sales_data;

SELECT COUNT(DISTINCT family) AS total_product_families
FROM sales_data;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT store_nbr) AS total_stores,
    COUNT(DISTINCT family) AS product_families,
    SUM(sales) AS total_sales,
    AVG(sales) AS average_sales,
    MAX(sales) AS maximum_sales
FROM sales_data;

# Top 10 product family sales
select family, sum(sales) as Total_Sales from sales_data
group by family
order by  Total_Sales desc limit 10;

# Top 10 stores by sales
select store_nbr, sum(sales) as Total_stores from sales_data
group by  store_nbr
order by  Total_stores desc limit 10;
