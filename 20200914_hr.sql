데이터 결합(실습 join8)
답 : 


SELECT r.region_id, r.region_name, c.country_name
FROM regions r, countries c
WHERE r.region_id = c.region_id
 AND r.region_name LIKE 'Europe';

SELECT *
FROM countries;

SELECT *
FROM regions;

regions - region_id, region_name

countries-region_id country_name

SELECT r.region_id, r.region_name, c.country_name
FROM regions r, countries c
WHERE r.region_id = c.region_id
 AND r.region_name LIKE 'Europe';

SELECT product.pid, product.pnm, sum(cycle.cnt)cnt
FROM cycle, product
WHERE cycle.pid = product.pid
GROUP BY product.pid, product.pnm
ORDER BY product.pnm ;

데이터 결합(실습 join9)
답 : 

SELECT r.region_id, r.region_name, c.country_name, l.city
FROM regions r, countries c, locations l
WHERE r.region_id = c.region_id
    AND c.country_id = l.country_id
    AND r.region_name LIKE 'Europe';

SELECT *
FROM locations;

SELECT *
FROM countries;

SELECT *
FROM regions;

SELECT *
FROM departments

department_name
데이터 결합(실습 join10)
답 : 

SELECT r.region_id, r.region_name, c.country_name,
        l.city, d.department_name
FROM regions r, countries c, locations l, departments d
WHERE r.region_id = c.region_id
    AND c.country_id = l.country_id
    AND l.location_id = d.location_id
    AND r.region_name LIKE 'Europe';

데이터 결합(실습 join11)
답 : 

SELECT r.region_id, r.region_name, c.country_name,
        l.city, d.department_name, e.first_name || e.last_name
FROM regions r, countries c, locations l, departments d,
        employees e
WHERE r.region_id = c.region_id
    AND c.country_id = l.country_id
    AND l.location_id = d.location_id
    AND e.department_id = d.department_id
    AND r.region_name LIKE 'Europe';

SELECT *
FROM locations;

SELECT *
FROM countries;

SELECT *
FROM regions;

SELECT *
FROM departments

SELECT *
FROM employees

SELECT *
FROM jobs;

데이터 결합(실습 join12)
답 : 

SELECT e.employee_id, e.first_name || e.last_name,
        e.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;









