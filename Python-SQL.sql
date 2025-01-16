select * from dbo.df_orders

--finding top 10 highest revenue generating projects
select top 10 product_id, sum(sale_price) as sales
from dbo.df_orders
group by product_id
order by sales

-- Which regions or countries have the highest total profits?
-- Analysis: Group by region or country and aggregate the profit to identify the top performers. This will help to identify regions that might need more focus or resources.
SELECT
    region,
    country,
    SUM(profit) AS total_profit
FROM
    dbo.df_orders
GROUP BY
    region, country
ORDER BY
    total_profit DESC

	--Which customer segment (segment column) generates the most revenue and profit?
--Analysis: By aggregating sale_price and profit by segment, one can gain insights into which segments are most profitable, helping to refine marketing or sales strategies.
SELECT
    segment,
    SUM(sale_price) AS total_sales,
    SUM(profit) AS total_profit
FROM
    dbo.df_orders
GROUP BY
    segment
ORDER BY
    total_profit DESC;


	--How does the discount percent (discount_percent) impact the profit margins?
--Analysis: One can correlate discount_percent with profit to assess whether giving higher discounts results in better or worse profitability.
SELECT
    discount,
    AVG(profit) AS avg_profit
FROM
    dbo.df_orders
GROUP BY
    discount
ORDER BY
    discount;

	--Which products (product_id) have the highest total profit and sales?
--Analysis: By aggregating sale_price and profit by product_id, one can identify the top-performing products, which can inform inventory and marketing decisions.
SELECT top 10
    product_id,
    SUM(sale_price) AS total_sales,
    SUM(profit) AS total_profit
FROM
    dbo.df_orders
GROUP BY
    product_id
ORDER BY
    total_profit DESC;

	--How do cost prices (cost_price) and list prices (list_price) relate to the final sale price and profit?
--Analysis: Calculate the difference between sale_price and cost_price to find the margin. Also check if products sold close to their list price are more profitable.
SELECT
    category,
    sub_category,
    SUM(sale_price) AS total_sales,
    SUM(profit) AS total_profit
FROM
    dbo.df_orders
GROUP BY
    category, sub_category
ORDER BY
    total_profit DESC;

	--What is the average discount given by each category and subcategory?
--Analysis: Group by category and sub_category, and calculate the average discount_percent. This could help in determining if certain categories are discount-heavy, potentially affecting their overall profitability.
SELECT
    category,
    sub_category,
    AVG(discount) AS avg_discount
FROM
    dbo.df_orders
GROUP BY
    category, sub_category
ORDER BY
    avg_discount DESC;


	-- How do sales and profit differ across different shipping modes (ship_mode)?
--Analysis: Aggregate sale_price and profit by ship_mode to see which shipping methods generate the most revenue and profit, helping to evaluate logistics strategies.
SELECT
    ship_mode,
    SUM(sale_price) AS total_sales,
    SUM(profit) AS total_profit
FROM
    dbo.df_orders
GROUP BY
    ship_mode
ORDER BY
    total_profit DESC;


	--How does the quantity of items ordered (quantity) affect total profit?
--Analysis: By correlating quantity with profit, one can analyze if larger orders are more profitable or if smaller orders with higher margins are more beneficial.
SELECT
    quantity,
    SUM(profit) AS total_profit
FROM
    dbo.df_orders
GROUP BY
    quantity
ORDER BY
    quantity DESC;


	--Which states or cities contribute the most to total sales and profit?
--Analysis: Group by state or city, and aggregate the sale_price and profit to identify geographical areas where sales are highest. This can inform targeted regional promotions.
SELECT top 10
    state,
    city,
    SUM(sale_price) AS total_sales,
    SUM(profit) AS total_profit
FROM
    dbo.df_orders
GROUP BY
    state, city
ORDER BY
    total_profit DESC;
