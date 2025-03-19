select * from pizza_sales
select sum(total_price) as t_revenue from pizza_sales
select sum(total_price)/count(distinct order_id) as avg_order_value from pizza_sales
select sum(quantity) as sale_pizza from pizza_sales
select  cast(cast(sum(quantity) as decimal(10,2) )/cast(count(distinct order_id) as decimal(10,2) ) as decimal(10,2)) from pizza_sales
/* this is for daily trend */
select datename(DW,order_date) as order_day, COUNT(distinct order_id) as total_orders from pizza_sales GROUP BY DATENAME(DW,order_date)
-- hourly trend
select DATEPART(HOUR,order_time) AS order_hour,COUNT(DISTINCT order_id) as total_orders from pizza_sales GROUP BY DATEPART(HOUR,order_time) ORDER BY DATEPART(HOUR,order_time)
-- % of sale of pizza categories
select pizza_category, sum(total_price) * 100 / (SELECT sum(total_price) from pizza_sales)as total_percentage from pizza_sales  GROUP BY pizza_category
-- % of sale of pizza size
select pizza_size, sum(total_price) * 100 / (SELECT sum(total_price) from pizza_sales)as total_percentage from pizza_sales  GROUP BY pizza_size
-- pizza sold by each category
select pizza_category, sum(quantity) from pizza_sales GROUP BY pizza_category
-- top 5 pizzas sold
select TOP 5 pizza_name ,sum(quantity) from pizza_sales GROUP BY pizza_name ORDER BY sum(quantity) DESC
-- bottom 5 pizzas sold
select TOP 5 pizza_name ,sum(quantity) from pizza_sales GROUP BY pizza_name ORDER BY sum(quantity) ASC