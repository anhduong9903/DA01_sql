--ex1
WITH duplicate_job_listings AS (
  SELECT
    company_id,
    title,
    COUNT(*)
  FROM job_listings
  GROUP BY company_id, title
  HAVING count(*) > 1
)
SELECT COUNT(*) AS duplicate_companies
FROM duplicate_job_listings
--ex2
  WITH tbl1 AS (
SELECT *
FROM product_spend
WHERE EXTRACT(year FROM transaction_date) = 2022
),tbl2 AS
(
SELECT category, product, SUM(spend) AS total_spend
FROM tbl1
GROUP BY category, product
ORDER BY category, product
), 
tbl3 AS (
SELECT * FROM tbl2
WHERE category = 'appliance'
ORDER BY total_spend DESC LIMIT 2),
tbl4 AS (
SELECT * 
FROM tbl2
WHERE category = 'electronics' 
ORDER BY total_spend DESC LIMIT 2)
SELECT * FROM tbl3 UNION ALL SELECT * FROM tbl4
--ex3
WITH call_records AS (
SELECT
  policy_holder_id,
  COUNT(case_id) AS call_count
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id) >= 3
)

SELECT COUNT(policy_holder_id) AS member_count
FROM call_records;
--ex4
SELECT a.page_id
FROM pages as a
LEFT JOIN page_likes as b ON a.page_id=b.page_id
WHERE liked_date is NULL 
GROUP BY a.page_id
ORDER BY a.page_id
--ex5
WITH active_users_cte AS (
  SELECT DISTINCT
    curr_month.user_id,
    EXTRACT(MONTH FROM curr_month.event_date) AS curr_month
  FROM (
    SELECT * FROM user_actions
    WHERE EXTRACT(MONTH FROM event_date) = 
      (SELECT EXTRACT(MONTH FROM MAX(event_date)) FROM user_actions)
    ) curr_month
  JOIN user_actions AS last_month
    ON curr_month.user_id = last_month.user_id
    AND EXTRACT(MONTH FROM curr_month.event_date) =
      EXTRACT(MONTH FROM last_month.event_date + interval '1 month')
)

SELECT
  curr_month,
  COUNT(user_id) AS num_active_users
FROM active_users_cte
--ex6
SELECT  SUBSTR(trans_date,1,7) as month, country, count(id) as trans_count,
SUM(CASE WHEN state = 'approved' then 1 else 0 END) as approved_count,
SUM(amount) as trans_total_amount, SUM(CASE WHEN state = 'approved' then amount else 0 END)
as approved_total_amount
FROM Transactions
GROUP BY month, country
--ex7
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) in (
SELECT product_id, MIN(year) 
FROM Sales GROUP BY product_id)
--ex8
SELECT  customer_id FROM Customer GROUP BY customer_id
HAVING COUNT(distinct product_key) = (SELECT COUNT(product_key) FROM Product)
--ex9
SELECT a.employee_id
FROM Employees AS a
LEFT JOIN Employees AS b
ON a.manager_id = b.employee_id
WHERE a.salary < 30000 AND b.employee_id IS NULL AND a.manager_id IS NOT NULL
ORDER BY employee_id;
--ex10
WITH duplicate_job_listings AS (
  SELECT
    company_id,
    title,
    COUNT(*)
  FROM job_listings
  GROUP BY company_id, title
  HAVING count(*) > 1
)

SELECT COUNT(*) AS duplicate_companies
FROM duplicate_job_listings
--ex11

--ex12
WITH all_id AS (
    SELECT requester_id AS id 
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id
    FROM RequestAccepted
)

SELECT id, COUNT(*) AS num
FROM all_id
GROUP BY id 
ORDER BY num DESC
LIMIT 1
