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
SELECT t1.customer_id as customer_id
FROM customer_contracts as t1
INNER JOIN products as t2
ON t1.product_id=t2.product_id
GROUP BY t1.customer_id
HAVING count(distinct product_category) = 3
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

---MID-COURSE TEST
--- Ex1 
select 
MIN (replacement_cost) as min_cost
from film; 
/*Ex2: số lượng phim có chi phí thay thế trong phạm vi
1. low: 9.99-19.99
2. medium: 20.00-24.99
3. high: 25.00-29.99*/
select 
case 
	when replacement_cost between 9.99 and 19.99 then 'low'
	when replacement_cost between 20.00 and 24.99 then 'medium'
   	when replacement_cost between 25.00 and 29.99 then 'high'
end as category,
sum(case 
	when replacement_cost between 9.99 and 19.99 then 1
	when replacement_cost between 20.00 and 24.99 then 1
	when replacement_cost between 25.00 and 29.99 then 1
end) as total
from film 
group by category 
 
/*Ex3: Tạo danh sách các film_title (title,length,
category_name) desc
Lọc: 'Drama'hoặc 'Sports'
Phim dài nhất thuộc thể loại nào và dài bao nhiêu*/
select a.length, c.name as category_name
from film as a
inner join film_category as b on a.film_id=b.film_id
inner join category as c on c.category_id=b.category_id
where name in ('Drama','Sports')
order by c.name desc, length desc limit 1
/*Ex4: Đưa ra cái nhìn tổng quan về số lượng phim (title)
trong mỗi danh mục (category)
Thể loại danh mục nào là phổ biến nhất*/
select c.name as category,
count (a.title) as numbers_of_title
from film as a
inner join film_category as b on a.film_id=b.film_id
inner join category as c on c.category_id=b.category_id
group by category
order by count(a.title) desc limit 1

/*Ex5: Đưa ra cái nhìn tổng quan về họ và tên của 
các diễn viên cũng như số lượng phim họ tham gia.
Question: Diễn viên nào đóng nhiều phim nhất?
Answer: Susan Davis : 54 movies*/
select a.first_name, a.last_name,
count (distinct (b.film_id))
from actor as a 
inner join film_actor as b on a.actor_id=b.actor_id
group by  a.first_name, a.last_name
order by count (distinct (b.film_id)) desc limit 1
/*Ex6: Tìm các địa chỉ không liên quan đến bất kỳ 
khách hàng nào.
Question: Có bao nhiêu địa chỉ như vậy?
Answer: 4*/
select count (a.address_id)
from address as a 
left join customer as b on a.address_id=b.address_id
where first_name is null or last_name is null
/*Ex7: Danh sách các thành phố và doanh thu tương ứng 
trên từng thành phố 
Question:Thành phố nào đạt doanh thu cao nhất?
Answer: Cape Coral : 221.55*/
select 
from city
inner join payment 
/*Ex8: Tạo danh sách trả ra 2 cột dữ liệu: 
-	cột 1: thông tin thành phố và đất nước 
( format: “city, country")
-	cột 2: doanh thu tương ứng với cột 1
Question: thành phố của đất nước nào đat doanh thu 
cao nhất*/

select 
a.city || ',' || ' ' || b.country as city_country,

from city as a
inner join country as b on a.country_id=b.country_id



