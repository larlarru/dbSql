시험 문제  : 
시험문제1번
ppt 파일시스템과 DB 보기

트랜잭션 : 여러 단계의 과정을 하나의 작업 행위로 묶는 단위

3번 문제 : 
원자성 : 트랜잭션 내의 작업 전체가 실행되거나 안되거나

4. BETWEEN 대신 >= AND <= 뭐 이렇게 적으면된다.

5번 : NULL 값이 없다.

6번 : TEST1	TEST2	TEST3 이렇게 나온다. 컬럼명은 ALIAS1 ALIAS2 ALIAS3
SELECT 'TEST1' alias1,
    'TEST2' AS alias2,
    'TEST3' AS alias3
FROM dual;

7번 답 : 'TEST1' || DUMMY 이렇게 출력되고 내용물은 TEST1X다
SELECT 'TEST1' || dummy
FROM dual;

8번 답 : DESC table명;

1. DESC emp;
2. sql developer 메뉴
3. select * ==>컬럼명만...

9번문제 : 
SELECT *
FROM emp
WHERE TO_CHAR(hiredate, 'YYYYMMDD')
    BETWEEN '19800101' AND '19821231';
힌트 : 
칠거지악
1. 데이터 타입
    - hiredate - date
2. 테이블의 컬럼 가공(좌변 가공)
    ==>테이블의 행 수만큼 TO_CHAR 호출

9번 답 : 
SELECT *
FROM emp
WHERE hiredate 
    BETWEEN TO_CHAR('19800101', 'YYYYMMDD') 
    AND TO_CHAR('19821231', 'YYYYMMDD');

10번 문제 :
SELECT *
FROM emp;
= 14
SELECT *
FROM dual;
= 1
SELECT *
FROM emp
WHERE 1= 1
    OR 1 != 1;
=14
TRUE OR FALSE ==> TRUE

10번 문제 답 :  
14*1*14

11번 문제 : 
SELECT *
FROM emp;

11번 답 : empno, ename, job, mgr, hiredate, sal, comm, deptno

12번 문제
SELECT *
FROM emp
WHERE deptno IN (10, 20);

12번 답 : 
SELECT *
FROM emp
WHERE deptno = 10 OR deptno = 20;

13번 문제 :
ename 컬럼의 값이 S로 시작하고 중간에 T가 반드시 존재하며 
H로 끝나는 이름을 갖거나 소속 부서번호가 15번이 아닌 부서에
속하는 직원을 찾는 SELECT

13번 답 : 
LIKE '%s'
LIKE '%T'
LIKE '%sh'

or
이렇게 하나로 쓰기
WHERE ename LIKE 's%t%H'

14번 문제 : 정렬
14번 답 : 
SELECT *
FROM emp
ORDER BY mgr DESC;

15번 문제 :
15번 답 : 1(첫행)

16번 문제 :
SELECT *
FROM emp
ORDER BY ename DESC, mgr;

16번 답 : 
ename 컬럼으로 내림차순 정렬하고, 만약에 동일한 ename이 있을경우
해당 데이터는 mgr 컬럼으로 정렬한다.

17번 문제 : 
ROWNUM이란 무엇이고 특징 및 유의점 서술

17번 답 : 
행번호 부여
의도하지 않는 순차적으로 순서가 부여되지 않을 수 있기 때문에 인라인 사용한다

18번 문제 
페이지 시리즈와 정리
18번 답 : 찾아서보기 있음

19번 문제 문자열 결합하고 dual테이블에 조회
1. Hello 2. , 3. World
19번 답 : 
SELECT CONCAT(CONCAT('Hello', ','), 'World')
FROM dual;

20번 문제
현재 일자가 속한 달의 마지막 일자에서 55일 뒤(미래)의 일자를 
날짜 타입으로 구하는 SELECT 쿼리를 dual 테이블을 통ㄴ해 작성

힌트 : 
1.SYSDATE
2. LAST-DAT ? LASTDAY ?? LAST_DAY(DATE)

20번 문제 답 :
SELECT LAST_DAY(SYSDATE) + 55
FROM dual;


수업 : 

데이터 결합 (outer join 실습 outerjoin2)
답 : 
SELECT b.buy_date, b.buy_prod, p.prod_id, p.prod_name, b.buy_qty
FROM buyprod b, prod p
WHERE b.buy_prod(+) = p.prod_id
    AND b.BUY_DATE(+) = TO_DATE('2005/01/25', 'YYYY/MM/DD')

데이터 결합 (outer join 실습 outerjoin2)
답 : 
SELECT TO_DATE(:yyyymmdd, 'YYYY/MM/DD') buy_date, 
    b.buy_prod, p.prod_id, p.prod_name, NVL(b.buy_qty, 0)
FROM buyprod b, prod p
WHERE b.buy_prod(+) = p.prod_id
    AND b.BUY_DATE(+) = TO_DATE(:yyyymmdd, 'YYYY/MM/DD');



데이터 결합 (outer join 실습 outerjoin3)
답 : 
SELECT cycle.pid, product.pnm, :cid cid, 
        NVL(cycle.day, 0) day, NVL(cycle.cnt, 0) cid
FROM cycle, product
WHERE cycle.pid(+) = product.pid
    AND cycle.cid(+) = 1;

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


SELECT product.pid, NVL(product.pnm, 0),
        customer.cid, customer.cnm,
        NVL(cycle.day, 0) day, NVL(cycle.cnt, 0) cnt
FROM customer, cycle, product
WHERE cycle.cid(+) = customer.cid
    AND cycle.pid = product.pid
    AND cycle.cid(+) = 1
ORDER BY cycle.pid DESC;

SELECT product.pid, product.pnm,
        customer.cid, customer.cnm,
        cycle.day, cycle.cnt
FROM customer, cycle, product
WHERE cycle.cid = customer.cid
    AND cycle.pid = product.pid
    AND cycle.cid = 1
ORDER BY cycle.pid DESC;

SELECT *
FROM customer;

SELECT *
FROM cycle;

SELECT *
FROM product

SELECT *
FROM product, customer, cycle;


SELECT p.pid, p.pnm,
        NVL(cc.cid, 1), NVL(cs.cnm, 'brown'),
        NVL(cc.day, 0), NVL(cc.cnt, 0)
FROM cycle cc, customer cs, product p
WHERE cc.cid = cs.cid(+)
    AND cc.pid(+) = p.pid
    AND cc.cid(+) = 1
ORDER BY p.pid DESC;


SELECT product.pid, product.pnm,
        cycle.cid, customer.cnm,
        NVL(cycle.day, 0), NVL(cycle.cnt,0)
FROM cycle JOIN customer ON (cycle.cid = customer.cid)
            JOIN product ON(cycle.pid = product.pid)
WHERE cycle.cid = 1
ORDER BY product.pid DESC;


--참고
SELECT e.empno, e.ename, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.deptno = d.deptno)
WHERE e.deptno = 10 OR e.deptno = 30
ORDER BY e.deptno;
--참고
SELECT cycle.pid, product.pnm, :cid cid, 
        NVL(cycle.day, 0) day, NVL(cycle.cnt, 0) cid
FROM cycle, product
WHERE cycle.pid(+) = product.pid
    AND cycle.cid(+) = 1;

SELECT cycle.pid, product.pnm, :cid cid, 
        NVL(cycle.day, 0) day, NVL(cycle.cnt, 0) cid
FROM cycle, product
WHERE cycle.pid(+) = product.pid;

SELECT *
FROM cycle;

SELECT *
FROM product;

SELECT *
FROM customer;


INNER JOIN : 조인이 성공하는 데이터만 조회가 되는 조인 방식
OUTER JOIN : 조인에 실패해도 기준으로 정한 테이블의 컬럼은 조회가 되는 조인 방식

EMP 테이블의 행 건수 (14) * DEPT 테이블의 행 건수 (4) = 56건
SELECT *
FROM emp, dept;

데이터 결합(cross join 실습 crossjoin1)
답 : 
SELECT *
FROM customer CROSS JOIN product;

SELECT cid, cnm, pid, pnm
FROM customer CROSS JOIN product;

SELECT *
FROM customer;


SELECT *
FROM product;

subquery는 where절 많이 사용함

SQL 활용에 있어서 매우 중요
서브쿼리 : 쿼리안에서 실행되는 쿼리
1. 서브쿼리 분류 - 서브쿼리가 사용되는 위치에 따른 분류
    1.1 SELECT : 스칼라 서브쿼리(SCALAR SUBQUERY)
    1.2 FROM : 인라인 뷰(INLINE-VIEW)
    1.3 WHERE : 서브쿼리 (SUB QUERY)

2. 서브쿼리 분류 - 서브쿼리가 반환하는 행, 컬럼의 개수의 따른 분류
(행1. 행 여러개), (컬럼1, 컬럼 여러개) : 
(행, 컬럼) : 4가지
2.1 단일행, 단일 컬럼
2.2 단일행, 복수 컬럼 ==> x(잘 안씀)
2.3 복수행, 단일 컬럼
2.4 복수행, 복수 컬럼

3. 서브쿼리 분류 - 메인쿼리의 컬럼을 서브쿼리에서 사용여부에 따른 분류
    3.1 상호 연관 서브 쿼리 (CO-RELATED SUB QUERY)
        - 메인 쿼리의 컬럼을 서브 쿼리에서 사용하는 경우
    3.2 비상호 연관 서브 쿼리(NON-CORELATED SUB QUERY)
        - 메인 쿼리의 컬럼을 서브 쿼리에서 사용하지 않는 경우

SMITH가 속한 부서에 속한 사원들은 누가 있을까?
1. SMITH가 속한 부서번호 구하기
2. 1번에서 구한 부서에 속해 있는 사원들 구하기

1. SELECT deptno
    FROM emp
    WHERE ename = 'SMITH';
2. SELECT *
    FROM emp
    WHERE deptno = 20;

==>서브쿼리를 이용하여 하나로 합칠수가 있다

SELECT *
FROM emp
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE ename = 'SMITH');
예 : 이거 밑에대로 실행하면 안됨
SELECT *
FROM emp
WHERE deptno = (SELECT deptno, empno
                FROM emp
                WHERE ename = 'SMITH');
위처럼 한다면 단일행에 복수 컬럼이다

서브쿼리를 사용할 때 주의점
1. 연산자
2. 서브쿼리의 리턴 형태

서브쿼리가 한개의 행 복수컬럼을 조회하고, 단일 컬럼과 = 비교 하는 경우 ==> X

SELECT *
FROM emp
WHERE deptno = (SELECT deptno, empno
                FROM emp
                WHERE ename = 'SMITH');

서브쿼리가 여러개의 행, 단일 컬럼을 조회하는 경우
1. 사용되는 위치 : WHERE - 서브쿼리
2. 조회되는 행, 컬럼의 개수 : 복수행, 단일 컬럼
3. 메인쿼리의 컬럼을 서브쿼리에서 사용 유무 : 비상호연관 서브쿼리

밑에 문장도 전체 돌리면 안나온다 가로안에 있는걸 돌리면 돌아감
SELECT *
FROM emp
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE ename = 'SMITH' 
                    OR ename = 'ALLEN');

위의 결과값 : deptno = 20
                     30
밑에 문장처럼 = IN스고 하면 값이 나온다
SELECT *
FROM emp
WHERE deptno IN (SELECT deptno
                FROM emp
                WHERE ename = 'SMITH' 
                    OR ename = 'ALLEN');

deptno IN (20, 30);
20번과 30번 에 속하는 결과값이 나온다

서브쿼리 (실습 sub1)
--평균 급여보다 높은 급여를 받는 직원의 수를 조회
답 : 
SELECT COUNT(*)
FROM emp
WHERE sal > (SELECT AVG(sal)
                FROM emp);

SELECT count(ename)
FROM emp
WHERE sal > (SELECT AVG(sal)
                FROM emp);

SELECT count(ename)
FROM emp
WHERE sal > (SELECT ROUND(sum(sal) / count(ename))
                FROM emp);

서브쿼리 (실습 sub2)
--평균 급여보다 높은 급여를 받는 직원의 정보를 조회하세요.
답 : 

SELECT *
FROM emp
WHERE sal > (SELECT AVG(sal)
                FROM emp);

SELECT *
FROM emp CROSS JOIN 

서브쿼리 (실습 sub3)
--SMITH와 WARD 사원이 속한 부서의 모든 사원 정보를
--조회하는 쿼리를 다음과 같이 작성하세요.
답 : 
SELECT *
FROM emp
WHERE deptno IN (SELECT deptno
                FROM emp
                WHERE ename IN('SMITH', 'WARD'));

SELECT *
FROM emp
WHERE deptno IN (SELECT deptno
                FROM emp
                WHERE ename = 'SMITH' 
                    OR ename = 'WARD');


복수행 연산자 : IN(중요), ANY, ALL(빈도 떨어진다)
SELECT *
FROM emp -- 800, 1250 SMITH와 WARD의 월급값
WHERE sal < ANY (SELECT sal
                    FROM emp
                    WHERE ename IN ('SMITH', 'WARD'));

SAL 컬럼의 값이 800이나, 1250 보다 작은 사원
==> SAL 컬럼의 값이 1250보다 작은 사원

SELECT *
FROM emp -- 800, 1250 SMITH와 WARD의 월급값
WHERE SAL > ALL (SELECT sal
                    FROM emp
                    WHERE ename IN ('SMITH', 'WARD'));

SAL 컬럼의 값이 800보다 크면서 1250보다 큰 사원
==> SAL 컬럼의 값이 1250 보다 큰 사원

복습
NOT IN 연산자와 NULL

관리자가 아닌 사원의 정보를 조회

SELECT *
FROM emp
WHERE empno NOT IN (SELECT NVL(mgr, 0)
                    FROM emp);

--밑에꺼는 null값 때문인지 값이 안나옴                    
SELECT *
FROM emp
WHERE empno NOT IN (SELECT mgr
                    FROM emp);

pair wise 개념 : 순서쌍, 두가지 조건을 동시에 만족시키는 데이터를 조회 할때 사용
                AND 논리연산자의 결과 값이 다를 수 있따(아래 예시 참조)
서브쿼리 : 복수행, 복수컬럼

SELECT *
FROM emp
WHERE (mgr, deptno) IN (SELECT mgr, deptno
                        FROM emp
                        WHERE empno IN (7499, 7782));


SELECT *
FROM emp
WHERE mgr IN (SELECT mgr
                FROM emp
                WHERE empno IN (7499, 7782));

AND deptno IN (SELECT deptno
                FROM emp
                WHERE empno IN (7499, 7782));

mgr 7698, 7839
deptno 30, 10
mgr, deptno => (7698, 30), (7698, 30), (7839, 30), (7839, 10)
                (7698, 30)                          (7839, 30)

SCALAR SUBQUERY : SELECT 절에 기술된 서브쿼리
                    하나의 컬럼
*** 스칼라 서브 쿼리는 하나의 행, 하나의 컬럼을 조회하는 쿼리 이어야한다.

SELECT dummy, (SELECT SYSDATE
                FROM dual)--이게 하나의 컬럼
FROM dual;

예 : 

스칼라 서브쿼리가 복수개의 행(4개), 단일 컬럼을 조회 ==> 에러
SELECT empno, deptno, (SELECT dname FROM dept)
FROM emp;

밑에 문장대로 하면 에러남
SELECT dummy, (SELECT SYSDATE, 'TEST'
                FROM dual)
FROM dual;

밑에처럼하면 오라클은 3개의 컬럼으로 인식한다.
SELECT dummy, (SELECT SYSDATE, 'TEST'
                FROM dual) 'TEST'
FROM dual;

emp 테이블과 스칼라 서브 쿼리를 이용하여 부서명 가져오기
기존 : emp 테이블과 dept 테이블을 조인하여 컬럼을 확장

SELECT empno, ename, dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

밑에 문장은 안됨
SELECT empno, ename, deptno, 
        (SELECT dname 
         FROM dept 
         WHERE deptno = deptno)--스칼라 쿼리에서 가져다쓴게 아님
FROM emp;


밑에 문자은 됨(밑에 문장 상호 연관성)
SELECT empno, ename, deptno, 
        (SELECT dname 
         FROM dept 
         WHERE deptno = emp.deptno) --가로 안에 있는거 단독으로 돌리면 안됨
         --즉 상호작용 쿼리는 단독작용이 아노딤
FROM emp;

=

SELECT empno, ename, deptno, 
        (SELECT dname 
         FROM dept 
         WHERE deptno = 20)
FROM emp;



상호연관 서브쿼리 : 메인 쿼리의 컬럼을 서브쿼리에서 사용한 서브쿼리
                - 서브쿼리만 단독으로 실행하는 것이 불가능 하다
                - 메인쿼리와 서브 쿼리의 실행 순서가 정해져 있다.
                    메인쿼리가 항상 먼저 실행된다.

비상호연관 서브쿼리 : 메인 쿼리의 컬럼을 서브쿼리에서 사용하지 않은 서브쿼리
                    - 서브쿼리만 단독으로 실행하는 것이 가능하다
                    - 메인 쿼리와 서브 쿼리의 실행 순서가 정해져 있지 않다
                        메인 => 서브, 서브 => 메인 둘다 가능
예 :

SELECT *
FROM dept
WHERE deptno IN (SELECT deptno
                 FROM emp);


SELECT empno, ename, emp.deptno,
        (SELECT dname FROM dept WHERE deptno = emp.deptno)
FROM emp;

SELECT dname
FROM dept
WHERE deptno = 20;

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

SELECT *
FROM employees;

SELECT *
FROM jobs;


--밑에 2문제는 참고 :

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



















