--ex1
SELECT COUNTRY.Continent, floor(AVG(CITY.Population))
From CITY
JOIN COUNTRY
On CITY.CountryCode = COUNTRY.Code
group by COUNTRY.Continent
--ex2
select ROUND(SUM(CASE WHEN t2.signup_action = 'Confirmed' THEN 1 ELSE 0 END)*1.0 / COUNT(t2.signup_action),2)
as confirm_rate 
from emails as t1
inner join texts as t2 on t1.email_id=t2.email_id
--ex3
SELECT t2.age_bucket, 
ROUND(100* SUM(CASE WHEN t1.activity_type = 'send' THEN t1.time_spent ELSE 0 END)/SUM(t1.time_spent),2) as send_perc,
ROUND(100* SUM(CASE WHEN t1.activity_type ='open' THEN t1.time_spent ELSE 0 END)/SUM(t1.time_spent),2) as open_perc
FROM activities as  t1
INNER JOIN age_breakdown as t2 ON t1.user_id=t2.user_id
WHERE t1.activity_type IN ('send','open')
GROUP BY t2.age_bucket
--ex4
--ex5
select a.employee_id, a.name, 
count(b.reports_to) as reports_count,
round(avg(b.age*1.00)) as average_age 
from employees as a
left join employees as b 
on a.employee_id = b.reports_to 
where b.reports_to is not null
group by a.employee_id, a.name
--ex6
select a.product_name, 
sum(b.unit) as unit
from products as a
left join orders as b 
on a.product_id=b.product_id
where b.order_date between '2020-02-01' and '2020-02-29'
group by a.product_name
having sum(b.unit)>=100
--ex7
SELECT a.page_id
FROM pages as a
LEFT JOIN page_likes as b ON a.page_id=b.page_id
WHERE liked_date is NULL 
GROUP BY a.page_id
ORDER BY a.page_id

