
데이터 결합(실습 join6)
답 : 

SELECT customer.cid, customer.cnm, product.pid,
        product.pnm, sum(cycle.cnt)
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
    AND cycle.pid = product.pid
GROUP BY customer.cid, customer.cnm, product.pid, product.pnm
ORDER BY product.pnm;

데이터 결합(실습 join7)
답 : 

SELECT product.pid, product.pnm, sum(cycle.cnt)cnt
FROM cycle, product
WHERE cycle.pid = product.pid
GROUP BY product.pid, product.pnm
ORDER BY product.pnm ;