SELECT *
FROM `walmart_db`.`walmart`;

select count(*) from `walmart_db`.`walmart`;

select distinct payment_method from `walmart_db`.`walmart`;

select
payment_method,
count(*)
from `walmart_db`.`walmart`
group by payment_method;

select Branch from `walmart_db`.`walmart`;

select MAX(quantity) from `walmart_db`.`walmart`;

-- Business Problems
-- find different payment method and number of transactions, number of qty sold

select
payment_method,
count(*) as no_payments,
SUM(quantity) as no_qty_sold
from `walmart_db`.`walmart`
group by payment_method;

-- Q2
-- Identify the highest rated category each branch, displaying the branceh,category
-- AVG rating
SELECT *
FROM (
    SELECT 
        branch,
        category,
        AVG(rating) AS avg_rating,
        RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS rnk
    FROM `walmart_db`.`walmart`
    GROUP BY branch, category
) t
WHERE rnk = 1;
-- Identify the busiest day of each branch based on the number of transactions

SELECT 
    `date`,
    STR_TO_DATE(`date`, '%d/%m/%y') AS formatted_date
FROM `walmart_db`.`walmart`;

SELECT *
FROM (
    SELECT 
        branch,
        DATE_FORMAT(STR_TO_DATE(`date`, '%d/%m/%y'), '%W') AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER (PARTITION BY branch ORDER BY COUNT(*) DESC) AS rnk
    FROM `walmart_db`.`walmart`
    GROUP BY branch, day_name
) t
WHERE rnk = 1;

-- Q4 
-- calculate the quanity of items sold as per payment method.List Payment Method
-- Total quantity sold
select
payment_method,
sum(quantity) as no_qty_sold
from walmart
group by payment_method;

-- Q5
-- Determine the average,minimum rating of products for each city
-- List the city,average_rating,min_rating,and max_rating

select

city,
category,
MIN(rating) as min_rating,
MAX(rating) as max_rating,
AVG(rating) as avg_rating

from walmart
group by 1,2;


-- Q6 Calculate the total profit for each category by considering total_profit asbinary()
-- (unit_price * quantity * profit_margin).
-- list category and total_profit, ordered from highest to lowest profit


select 
category,
sum(total) as total_revenue,
sum(total * profit_margin) as profit
from walmart
group by 1;

-- q7
-- Determine the most common payment method for each Branch
-- Display branch and the preferred_payment_method

WITH cte AS (
    SELECT
        branch,
        payment_method,
        COUNT(*) AS total_trans,
        RANK() OVER (PARTITION BY branch ORDER BY COUNT(*) DESC) AS rnk
    FROM walmart
    GROUP BY branch, payment_method
)
SELECT *
FROM cte
WHERE rnk = 1;


-- Q8
-- Categorize sales into 3 groups Morning,Afternoon,Evening
-- Findout each of the shift and number of invoices

SELECT
    branch,
    CASE 
        WHEN HOUR(TIME(time)) < 12 THEN 'Morning'
        WHEN HOUR(TIME(time)) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS num_invoices
FROM walmart
GROUP BY branch, shift
ORDER BY branch, num_invoices DESC;












