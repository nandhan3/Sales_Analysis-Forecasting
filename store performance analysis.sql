#Store Performance Analysis
select store_nbr,
	sum(sales) as Total_sales,
    avg(sales) as Avg_Sales,
    count(*) as Total_Records from sales_data
group by store_nbr
order by Total_Sales desc limit 10;
    
#Store-wise Sales Ranking
SELECT store_nbr,
    SUM(sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM sales_data
GROUP BY store_nbr
ORDER BY sales_rank;