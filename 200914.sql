SELECT *
FROM customer;

cid : customer name
SELECT *
FROM customer;

cnm : 

product : 제품
pid : product id : 제품번호
pnm : product name

SELECT *
FROM product;

cycle : 고객애음주기

cid : customer id 고객 id
pid : product id 제품 id
day : 1-7(일-토) 
cnt : COUNT, 수량

SELECT *
FROM product;

SELECT *
FROM customer;

SELECT *
FROM cycle;

데이터 결합(실습 join4)

답 : 

ORACLE
SELECT customer.*, cycle.pid, cycle.day, cycle.cnt
FROM customer, cycle
WHERE customer.cid = cycle.cid
    AND customer.cnm IN ('brown', 'sally'); 
    

SELECT cy.cid, cus.cnm, cy.pid, cy.day, cy.cnt
FROM customer cus JOIN cycle cy ON (cy.cid = cus.cid)
WHERE cus.cnm IN ('brown','sally');

SQL : 실행에 대한 순서가 없다
        조인할 테이블에 대해서 FROM 절에 기술한 순으로
        테이블을 읽지 않음.
        FROM customer, cycle, product ==> 오라클에서는 product 테이블부터 읽을 수 도 있다.

데이터 결합(실습 join5)
답 : 

SELECT customer.cid, customer.cnm, cycle.pid, 
        product.pnm, cycle.day, cycle.cnt
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
    AND cycle.pid = product.pid
    AND customer.cnm IN ('brown', 'sally');


EXPLAIN PLAN FOR
SELECT customer.cid, customer.cnm, cycle.pid, 
        product.pnm, cycle.day, cycle.cnt
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
    AND cycle.pid = product.pid
    AND customer.cnm IN ('brown', 'sally');

SELECT *
FROM TABLE(dbms_xplan.display);


SELECT a.cid, a.cnm, product.pnm, a.day, a.cnt
FROM
(SELECT customer.*, cycle.pid, cycle.day, cycle.cnt
FROM customer, cycle
WHERE customer.cid = cycle.cid
   -- AND customer.cnm IN ('brown', 'sally))) a, product
--WHERE a.pid = product.pid;

데이터 결합(실습 join6~7, 8~13) 과제 ppt226~

SELECT *
FROM customer;

SELECT *
FROM cycle;

SELECT *
FROM product;

OUTER JOIN : 자주 쓰이지는 않지만 중요
JOIN 구분
1. 문법에 따른 구분 : ANSI=SQL, ORACLE
2. join의 형태에 따른 구분 : SELF-JOIN, NONEQUI-JOIN, CROSS-JOIN
3. join 성공여부에 따라 데이터 표시여부 
        : INNER JOIN - 조인이 성공했을 때 데이터를 표시
        : OUTER JOIN - 조인이 실패해도 기준으로 정한 테이블의 컬럼 정보는
                        표시

사번, 사원의 이름, 관리자 사번, 관리자 이름
답 : 

SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno);

SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp m RIGHT OUTER JOIN emp e ON (e.mgr = m.empno);

행에 대한 제한 조건 기술시 WHERE절에 기술 했을 때와 ON 절에 기술 했을 때
결과가 다르다.

KING(PRESIDENT)의 경우 MGR 컬럼의 값이 NULL 이기 때문에 조인에 실패 ==>13건 조회
SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno;

ANSI - SQL
SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e JOIN emp m ON (e.mgr = m.empno);

empno, ename, job='manager'와 거기에 있는 이름

SELECT *
FROM emp;

SELECT *
FROM dept;

SELECT * 
FROM prod;

SELECt *
FROM member;

사원의 부서가 10번인 사람들만 조회 되도록 부서 번호 조건을 추가

SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno AND e.deptno = 10);

조건을 WHERE 절에 기술한 경우 ==> OUTER JOIN이 아닌 INNER 조인 결과가 나온다.
ANSI-SQL
SELECT e.empno, e.ename, e.deptno, e.mgr, m.ename, m.deptno
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno)
WHERE e.deptno = 10;

조건을 뭘 넣는냐에 따라 다름 밑에 JOIN만 들어간것도 값이 다름 밑에꺼는 NULL값이 빠짐
SELECT e.empno, e.ename, e.deptno, e.mgr, m.ename, m.deptno
FROM emp e JOIN emp m ON (e.mgr = m.empno)
WHERE e.deptno = 10;

ORACLE-SQL : 데이터가 없는 쪽의 컬럼에 (+) 기호를 붙인자
            ANSI-SQL 기준 테이블 반대편 테이블의 컬럼에 (+)을 붙인다.
            WHERE절 연결 조건에 적용
SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno(+);

밑에 UNION 쓰고 2개 문장 합치면 중복된거 제외하고 나온다.
SELECT e.ename, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno)
UNION
SELECT e.ename, m.ename
FROM emp e RIGHT OUTER JOIN emp m ON (e.mgr = m.empno)

UNION이라는 키워드로 위아래를 합칠 수 있다.다만 컬럼명 갯수가 다르면 안된다.


A = {1, 3, 5}, B = {1, 4, 5}
A U B = {1, 3, 4, 5}

SELECT e.ename, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno)
UNION
SELECT e.ename, m.ename
FROM emp e RIGHT OUTER JOIN emp m ON (e.mgr = m.empno)
MINUS
SELECT e.ename, m.ename
FROM emp e FULL OUTER JOIN emp m on (e.mgr = m.empno);

밑에껄 해야지 나온다. 22건 나온다.
SELECT e.ename, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno)
UNION
SELECT e.ename, m.ename
FROM emp e RIGHT OUTER JOIN emp m ON (e.mgr = m.empno)
INTERSECT
SELECT e.ename, m.ename
FROM emp e FULL OUTER JOIN emp m on (e.mgr = m.empno);

OUTERJOIN1
답 : 
ORACLE
b.buy_prod에 (+)를 해줘야지 없는 값도 출력된다.
SELECT b.buy_date, b.buy_prod, p.prod_id, p.prod_name, b.buy_qty
FROM buyprod b, prod p
WHERE b.buy_prod(+) = p.prod_id
    AND b.BUY_DATE(+) = TO_DATE('2005/01/25', 'YYYY/MM/DD');

ANSI-SQL
b.buy_prod에 (+)를 해줘야지 없는 값도 출력된다.
SELECT b.buy_date, b.buy_prod, p.prod_id, p.prod_name, b.buy_qty
FROM buyprod b RIGHT OUTER JOIN  prod p
    ON (b.buy_prod = p.prod_id 
        AND BUY_DATE = TO_DATE('2005/01/25', 'YYYY/MM/DD'));





SELECT bp.buy_date, bp.buy_prod, p.prod_id, p.prod_name, bp.buy_qty
FROM buyprod bp LEFT OUTER JOIN prod p ON (bp.buy_prod = p.prod_id)
UNION
SELECT bp.buy_date, bp.buy_prod, p.prod_id, p.prod_name, bp.buy_qty
FROM buyprod bp RIGHT OUTER JOIN prod p ON (bp.buy_prod = p.prod_id)
INTERSECT
SELECT bp.buy_date, bp.buy_prod, p.prod_id, p.prod_name, bp.buy_qty
FROM buyprod bp RIGHT OUTER JOIN prod p ON (bp.buy_prod = p.prod_id);

SELECT e.ename, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno)

SELECT bp.buy_date, bp.buy_prod, p.prod_id, p.prod_name, bp.buy_qty
FROM buyprod bp , prod p
WHERE bp.buy_prod = p.prod_id
    AND BUY_DATE = TO_DATE('2005/01/25', 'YYYY/MM/DD');





SELECT *
FROM prod;

prod_id
buy_prod

SELECT *
FROM buyprod
WHERE BUY_DATE = TO_DATE('2005/01/25', 'YYYY/MM/DD');

데이터 결합(실습 join5)
답 : 

SELECT customer.cid, customer.cnm, cycle.pid, 
        product.pnm, cycle.day, cycle.cnt
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
    AND cycle.pid = product.pid
    AND customer.cnm IN ('brown', 'sally');

SELECT
COUNT(case when tmp1 = '111' then 1 end),
count(case when tmp1 = '222' then 1 end)

EXPLAIN PLAN FOR
SELECT customer.cid, customer.cnm, cycle.pid, 
        product.pnm, cycle.day, cycle.cnt
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
    AND cycle.pid = product.pid
    AND customer.cnm IN ('brown', 'sally');

SELECT *
FROM TABLE(dbms_xplan.display);


SELECT a.cid, a.cnm, product.pnm, a.day, a.cnt
FROM
(SELECT customer.*, cycle.pid, cycle.day, cycle.cnt
FROM customer, cycle
WHERE customer.cid = cycle.cid
   -- AND customer.cnm IN ('brown', 'sally))) a, product
--WHERE a.pid = product.pid;

데이터 결합(실습 join6~7, 8~13) 과제 ppt226~

데이터 결합(실습 join6)
답 : 

SELECT customer.cid, customer.cnm, product.pid,
        product.pnm, sum(cycle.cnt)
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
    AND cycle.pid = product.pid
GROUP BY customer.cid, customer.cnm, product.pid, product.pnm
ORDER BY product.pnm;


SELECT customer.cid, customer.cnm, product.pid,
        product.pnm, cycle.cnt
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
    AND cycle.pid = product.pid
ORDER BY product.pnm;

COUNT(case when tmp1 = '111' then 1 end)

--밑에 문장 group by 쓸때 컬럼명 갯수하고 맞춰줘야한다.
SELECT customer.cid, customer.cnm, product.pid,
        product.pnm, sum(cycle.cnt)
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
    AND cycle.pid = product.pid
GROUP BY customer.cid, customer.cnm, product.pid, product.pnm
ORDER BY product.pnm;





SELECT COUNT(COUNT(deptno)) cnt
FROM emp
GROUP BY deptno;

SELECT count(count(product)) cnt
FROM product
GROUP BY cycle;


SELECT *
FROM emp;

SELECT customer.cid, customer.cnm, cycle.pid, 
        product.pnm, cycle.day, cycle.cnt
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
    AND cycle.pid = product.pid
    AND customer.cnm IN ('brown', 'sally');

cid, cnm, pid, pnm, cnt


SELECT *
FROM customer;

SELECT *
FROM cycle;


SELECT *
FROM product;


데이터 결합(실습 join7)
답 : 

SELECT product.pid, product.pnm, sum(cycle.cnt)cnt
FROM cycle, product
WHERE cycle.pid = product.pid
GROUP BY product.pid, product.pnm
ORDER BY product.pnm ;

SELECT customer.cid, customer.cnm, product.pid,
        product.pnm, sum(cycle.cnt)
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
    AND cycle.pid = product.pid
GROUP BY customer.cid, customer.cnm, product.pid, product.pnm
ORDER BY product.pnm;


SELECT product.pid, product.pnm, sum(cycle.cnt)cnt
FROM cycle, product
WHERE cycle.pid = product.pid
GROUP BY product.pid, product.pnm
ORDER BY product.pnm ;

SELECT userid, usernm, reg_dt,
        case
            WHEN MOD(TO_CHAR(reg_dt, 'yyyy'), 2) = 
                MOD(TO_CHAR(SYSDATE, 'yyyy'), 2)
                    THEN '건강검진대상자'
            ELSE '건강검진비대상자'
        END contact_to_doctor
FROM users;

SELECT product.pid, case WHEN '윌' THEN '쿠퍼스'
    case WHEN '쿠퍼스' THEN '윌'
        ELSE ''
        END product.pnm, sum(cycle.cnt)cnt
FROM cycle, product
WHERE cycle.pid = product.pid
GROUP BY product.pid, product.pnm
ORDER BY product.pnm ;

case WHEN '윌' THEN '쿠퍼스'
    case WHEN '쿠퍼스' THEN '윌'
            ELSE ''
        END product.pnm






SELECT product.pid, product.pnm, --sum(cycle.cnt)
FROM customer, cycle, product
WHERE cycle.pid = product.pid
--GROUP BY product.pid, product.pnm
ORDER BY product.pnm;

SELECT *
FROM cycle;

SELECT *
FROM product;

데이터 결합(실습 join8)
답 : 


SELECT r.region_id, r.region_name, c.country_name
FROM regions r, countries c
WHERE r.region_id = c.region_id
 AND r.region_name LIKE 'Europe';

SELECT *
FROM countries;


SELECT *
FROM countries;


SELECT *
FROM em;















