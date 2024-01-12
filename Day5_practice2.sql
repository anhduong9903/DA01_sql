--ex1
select distinct CITY from STATION
where ID%2=0;
--ex2
select count(CITY) - count(distinct city) from STATION;
--ex4
SELECT 
ROUND (CAST(SUM(item_count*order_occurrences)/sum(order_occurrences) AS DECIMAL),1) AS mean
FROM items_per_order;
--ex5
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY  candidate_id
HAVING COUNT(skill)=3;
--ex6
SELECT user_id,
DATE(max(post_date)) - DATE(min(post_date)) as days_between  
FROM posts 
WHERE post_date >='2021-01-01'AND post_date <'2022-01-01'
GROUP BY user_id
HAVING count(post_id)>=2;
--ex7
SELECT card_name, 
MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;
--ex 8
SELECT manufacturer, 
COUNT (drug) AS drug_count,
ABS(SUM (cogs-total_sales)) AS total_loss
FROM pharmacy_sales
WHERE total_sales<cogs
GROUP BY manufacturer
ORDER BY total_loss DESC; 
-- ex 9 
select * from Cinema
where id%2=1 and description not like 'boring'
order by rating desc;
-- ex 10
select teacher_id, 
count(distinct(subject_id)) AS cnt
from teacher
group by teacher_id; 
-- ex 11
select user_id, 
count(follower_id) as followers_count
from Followers
group by user_id
order by user_id; 
-- ex 12
select class
from Courses 
group by class
having count(student)>=5;
