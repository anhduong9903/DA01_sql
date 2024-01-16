--ex1
select name 
from STUDENTS
where marks > 75 
order by right(name,3), ID;
--ex2
select user_id, 
concat(Upper (left (name,1)), Lower (right(name,length(name)-1))) as name
from Users
order by user_id;
--ex3
SELECT manufacturer, 
'$'|| ROUND(SUM(total_sales)/1000000,0) || ' ' || 'million' as sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer;
--ex4
 SELECT
EXTRACT(month FROM submit_date) AS mth, 
product_id,
ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY product_id, EXTRACT(month FROM submit_date)
ORDER BY mth,product_id;
--ex5
SELECT 
sender_id,
COUNT(message_id) as message_count
FROM messages
WHERE extract (month from sent_date) = 8 AND
extract (year from sent_date) = 2022
GROUP BY sender_id
ORDER BY message_count desc 
limit 2
--ex6 
select tweet_id
from Tweets
where length(content)>15
--ex7
 select activity_date as day, count (distinct user_id) as active_users from Activity
where activity_date between '2019-06-28' and '2019-07-27'
group by activity_date;
--ex8 
select
count() as number_employee 
from employees
where extract(month from joining_date) between 1 and 7 and extract (year from joining_date) = 2022
--ex9
select 
position ('a' in first_name) as position 
from worker
where first_name ='Amitah'
--ex10
select 
substring (title,length(winery)+2,4)
from winemag_p2
where country ='Macedonia'
