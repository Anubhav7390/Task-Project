create database superstore;
use superstore;

select * from sales;

# calculate profit margins by category and sub-category

select category,`Sub-Category`, sum(sales) as total_sales, sum(profit) as total_profit, round((sum(profit) / sum(sales)) * 100 , 2) as profit_margin
from sales
group by category, `Sub-Category`
order by profit_margin desc;

# Top Loss-Making Sub-Categories:

select `Sub-Category`, round(sum(profit), 2) as total_profit
from sales
group by `Sub-Category`
order by total_profit ASC
limit 5 ;

# Region & Segment-Wise Profitability

select Region, Segment, round((sum(profit) / sum(Sales) ) * 100, 2) as profit_margin
from sales
group by Region , Segment
order by profit_margin desc;

#  Slow Moving Items (High Quantity, Low Profit)

select `product Name`,`Sub-Category`, sum(quantity) as total_quantity, round(sum(profit), 2) as total_profit
from sales
group by `product Name`, `Sub-Category`
having sum(quantity) > 5 & sum(profit) < 50
order by total_quantity desc; 

