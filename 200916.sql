1. 정답 조회 하는 쿼리 작성
2. SQL에 불필요한 부분이 없는지 점검


데이터 결합 (outer join 실습 outerjoin5)
답 :

SELECT p.pid, p.pnm,
        NVL(cc.cid, 1) cid, NVL(cs.cnm, 'brown') cnm,
        NVL(cc.day, 0) day, NVL(cc.cnt, 0) cnt
FROM cycle cc, customer cs, product p
WHERE cc.cid = cs.cid(+)
    AND cc.pid(+) = p.pid
    AND cc.cid(+) = 1
ORDER BY p.pid DESC, day DESC;

5번 선생님의 답(미완성) : 
SELECT a.pid, a.pnm, a.cid, c.cnm, NVL(a.day, 0) day, NVL(a.cnt, 0) cnt
FROM
    (SELECt :cid cid, c.day, c.cnt, p.pid, p.pnm
     FROM cycle c, product p
     WHERE c.cid(+) = p.pid) a;


데이터 결합(실습 join6)
답 : 

SELECT customer.cid, customer.cnm, product.pid,
        product.pnm, sum(cycle.cnt)
FROM customer, cycle, product
WHERE customer.cid = cycle.cid
    AND cycle.pid = product.pid
GROUP BY customer.cid, customer.cnm, product.pid, product.pnm
ORDER BY product.pnm;


데이터 결합(실습 join7) --윌과 쿠퍼스 모르겠음
답 : 

SELECT product.pid, product.pnm, sum(cycle.cnt)cnt
FROM cycle, product
WHERE cycle.pid = product.pid
GROUP BY product.pid, product.pnm
ORDER BY product.pnm ;


데이터 결합(실습 join8)
답 : 

SELECT r.region_id, r.region_name, c.country_name
FROM regions r, countries c
WHERE r.region_id = c.region_id
 AND r.region_name = 'Europe';


데이터 결합(실습 join9)
답 : 

SELECT r.region_id, r.region_name, c.country_name, l.city
FROM regions r, countries c, locations l
WHERE r.region_id = c.region_id
    AND c.country_id = l.country_id
    AND r.region_name LIKE 'Europe';

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

데이터 결합(실습 join12)
답 : 

SELECT e.employee_id, e.first_name || e.last_name,
        e.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

데이터 결합 (실습 jon 13)
답 :

SELECT e.manager_id, 'StevenKing' AS mgr_name,
        e.employee_id, e.first_name || e.last_name name,
        j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
    AND e.employee_id >= 120
    AND e.manager_id = 100
    AND e.employee_id BETWEEN 120 AND 150
ORDER BY e.employee_id ASC;

20200916 오후 수업 내용 : 

서브쿼리부터

전체 직원의 급여 평균보다 높은 급여를 받는 사원들 조회
SELECT *
FROM emp
WHERE sal > (SELECT AVG(sal)
                FROM emp);

본인 속한 부서의 급여 평균보다 높은 급여를 받는 사람들을 조회

SELECT *
FROM emp e
WHERE sal > (SELECT AVG(sal)
                FROM emp
                WHERE deptno = e.deptno);

서브쿼리 (실습 sub4)
테스트용 데이터 추가
데이터 추가 후 부서 조회 쿼리
1. emp 테이블에 등록된 사원들이 속한 부서 번호 확인
답 : 

SELECT *
FROM dept
WHERE deptno NOT IN (SELECT deptno
                        FROM emp);


SELECT *
FROM dept
WHERE deptno >= 40
ORDER BY deptno DESC;


DESC dept;
INSERT INTO dept VALUES (99, 'ddit', 'daejeon');

SELECT *
FROM dept;

서브쿼리 (실습 sub5)
답 : 

SELECT *
FROM product
WHERE pid NOT IN (SELECT pid
                    FROM cycle
                    WHERE cid = 1);

SELECT *
FROM product
WHERE pid NOT IN (100, 400)


SELECT p.pid, p.pnm
FROM cycle c, product p
WHERE c.pid = p.pid
    AND c.cid NOT IN (SELECT cycle.cid
                        FROM cycle, product
                        WHERE cycle.pid = product.pid
                        AND cycle.cid = 1)
    AND p.pid NOT IN (SELECT product.pid
                        FROM cycle, product
                        WHERE cycle.pid = product.pid
                        AND prodcut.pid = 100);

SELECT deptno
FROM emp

SELECT *
FROM cycle;

SELECT *
FROM product;

SELECT *
FROM cycle c, product p
WHERE c.pid = p.pid
     AND p.pnm != (SELECT *
                   FROM cycle c, product p
                    WHERE c.pid = p.pid
                    AND cid = 1);


SELECT *
FROM cycle c, product p
WHERE c.pid = p.pid
     AND cid = 1;

서브쿼리 (실습 sub6)
답 : 

SELECT *
FROM cycle
WHERE cid = 1
AND pid IN(SELECT pid
            FROM cycle
            WHERE cid IN (2));



SELECT *
FROM cycle
WHERE cid IN ((SELECT cycle.cid
        FROM cycle
    WHERE cycle.cid IN (1)), 2);


SELECT *
FROM cycle
WHERE cid IN (1)
AND pid = 100;

서브쿼리 (실습 sub7)
답 : p284

SELECT c.cid, cu.cnm, c.pid, p.pnm, c.day, c.cnt
FROM product p, customer cu, cycle c
WHERE c.cid = cu.cid
AND c.pid = p.pid
AND c.cid = 1
AND c.pid IN (SELECT pid
                FROM cycle
                WHERE cid IN (2));



SELECT cs.cnm, cc.pid, p.pnm, cc.day, cc.cnt
FROM product p, customer cs, cycle cc
WHERE cc.cid = cs.cid
AND cc.pid = p.pid
AND cc.pid IN (SELECT cycle.pid
                FROM cycle
                WHERE cycle.cid = 1
                AND pid IN(SELECT pid
                            FROM cycle
                            WHERE cid IN (2)));




SELECT *
FROM product p, customer cs, cycle cc
WHERE cc.cid = cs.cid
AND cc.pid = p.pid
AND cc.pid IN (SELECT cycle.pid
                FROM cycle
                WHERE cycle.cid = 1
                AND pid IN(SELECT pid
                            FROM cycle
                            WHERE cid IN (2)));




SELECT *
FROM cycle
WHERE cid = 1
AND pid IN(SELECT pid
            FROM cycle
            WHERE cid IN (2));

SELECT *
FROM customer

= cid

SELECT *
FROM cycle

= pid

SELECT *
FROM product

EXISTS 연산자 : 조건을 만족하는 서브 쿼리의 행이 존재하면 TRUE
매니저가 존재하는 사원 정보 조회

SELECT *
FROM emp e
WHERE EXISTS (SELECT *
                FROM emp m
                WHERE e.mgr = m.empno);
                
SELECT *
FROM emp e
WHERE EXISTS (SELECT 'x'
                FROM emp m
                WHERE e.mgr = m.empno);

SELECT *
FROM emp e
WHERE EXISTS (SELECT 'X'
                FROM emp m
                WHERE 1 = 2);

서브쿼리 (실습 sub9)
4개의 제품중 1번 고객이 먹는 제품만 조회
답 : 


SELECT *
FROM product
WHERE EXISTS (SELECT *
                FROM cycle
                WHERE cid = 1
                AND pid = product.pid);

1번 고객이 안먹는 제품 조회 : NOT 붙이기
EXISTS : 행이 존재하는지 않는건지

서브쿼리 (실습 sub10)
답 : 

SELECT *
FROM product
WHERE NOT EXISTS (SELECT *
                FROM cycle
                WHERE cid = 1
                AND pid = product.pid);




SELECT *
FROM cycle
WHERE cid = 1
AND pid = 400

SELECT *
FROM product;


SELECT cs.cnm, cc.pid, p.pnm, cc.day, cc.cnt
FROM product p, customer cs, cycle cc
WHERE cc.cid = cs.cid
AND cc.pid = p.pid
AND cc.cid = 1
AND EXISTS (SELECT pid
                FROM cycle
                WHERE cid IN (2));

SELECT *
FROM cycle c, product p
WHERE EXISTS (SELECT *
                FROM cycle cc, product pd
                WHERE c.cid = cc.cid)


집합연산자 : 알아두자
수학의 집합 연산
A = {1, 3, 5}
B = {1, 4, 5}

합집합 : A U B = {1, 3, 4, 5} (교환법칙 성립) A U B == B U A)
교집합 : A ^ B = {1, 5} (교환법칙 성립 A ^ B == B ^ A)
차집합 : A - B = {3} (교환법칙 성립하지 않음 A - B != B - A)
        B - A = {4}

SQL에서의 집합 연산자
합집합 : UNION     : 수학적 합집합과 개념이 동일(중복을 허용하지 않음)
                    중복을 체크 ==> 두 집합에서 중복된 값을 확인 ==> 연산이 느림
        UNION ALL : 수학적 합집합 개념을 떠나 두개의 집합을 단순히 합친다.
                    (중복 데이터 존재가능)
                    중복 체크 없음 ==> 두 집합에서 중복된 값 확인 없음 ==> 연산이 빠름
                    ** 개발자가 두개의 집합에 중복되는 데이터가 없다는 것을 알 수 있는
                    상황이라면 일부러 UNION 연산자를 사용하는 것보다 UNION ALL을 사용하여
                    (오라클이 하는)연산을 절약할 수 있다
        INTERSECT : 수학적 교집합 개념과 동일
        MINUS : 수학적 차집합 개념과 동일

SELECT empno, ename
FROM emp
WHERE deptno = 10;

위아래 집합이 동일하기 때문에 합집합을 하더라도 행이 추가되진 않는다
SELECT empno, ename
FROM emp
WHERE deptno = 10
UNION
SELECT empno, ename
FROM emp
WHERE deptno = 10;

위아래 집합에서 7369번 사번은 중복되므로 한번만 나오게 된다 : 전체 행은 3건
SELECT empno, ename
FROM emp
WHERE empno IN (7369, 7566)
UNION
SELECT empno, ename
FROM emp
WHERE empno IN (7369, 7782);


UNION ALL 연산자는 중복제거 단계가 없다
SELECT empno, ename
FROM emp
WHERE empno IN (7369, 7566)
UNION ALL
SELECT empno, ename
FROM emp
WHERE empno IN (7369, 7782);


두집합의 공통된 부분은 7369행 밖에 없음 : 총 데이터 1행
SELECT empno, ename
FROM emp
WHERE empno IN (7369, 7566)
INTERSECT
SELECT empno, ename
FROM emp
WHERE empno IN (7369, 7782);


윗쪽 집합에서 아래쪽 집합의 행을 제거하고 남은 행 : 1개의 행(7566)
SELECT empno, ename
FROM emp
WHERE empno IN (7369, 7566)
MINUS
SELECT empno, ename
FROM emp
WHERE empno IN (7369, 7782);

집합연산자 특징
1. 컬럼명은 첫번째 집합의 컬럼명을 따라간다
2. order by 절은 마지막 잡힙에 적용한다.
    마지막 sql이 아닌 SQL에서 정렬을 사용하고 싶은 경우 INLINE-VIEW를 활용
    UNION ALL의 경우 위, 아래 집합을 이어 주기 때문에 집합의 순서를 그대로 유지
    하기 때문에 요구사항에 따라 정렬된 데이터 집합이 필요하다면 해당 방법을 고려
SELECT empno e, ename
FROM emp
WHERE empno IN (7369, 7566)
--ORDER BY ename 이렇게 하면 오류남
UNION ALL
SELECT empno, ename
FROM emp
WHERE empno IN (7369, 7782)
ORDER BY ename;

SELECT gb, sido, sigungu
FROM fastfood
WHERE sido = '대전광역시' AND sigungu = '중구'

SELECT gb, sido, sigungu
FROM fastfood
WHERE sido = '대전광역시' AND sigungu = '중구'










































