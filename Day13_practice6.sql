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
