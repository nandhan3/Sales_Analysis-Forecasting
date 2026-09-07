#Top 10 Product Families
select family,
	sum(sales) as Total_Sales,
    avg(sales) as Avg_Sales from sales_data
group by family
order by Total_Sales desc limit 10;

#Product Family Ranking
select family,
	sum(sales) as Total_Sales,
    rank() over (order by sum(sales) desc) as Sales_Rank from sales_data
group by family
order by Sales_rank;

#Store + Product Family Performance
select store_nbr, family,
	sum(sales) as Total_Sales from sales_data
group by store_nbr, family
order by Total_Sales desc limit 20;
    
    