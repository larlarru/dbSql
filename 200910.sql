많이 쓰이는 함수, 잘 알아두자 
(개념 적으로 혼돈하지 말고 잘 정리하자 - SELECT 절에 올 수 있는 컬럼에 대해 잘 정리)

그룹함수 : 여러개의 행을 입력으로 받아 하나의 행으로 결과를 반환하는 함수

오라클 제공 그룹함수
MIN(컬럼|익스프레션) : 그룹중에 최소값을 반환
MAX(컬럼|익스프레션) : 그룹중에 최대값을 반환
AVG(컬럼|익스프레션) : 그룹의 평균값을 반환
SUM(컬럼|익스프레션) : 그룹의 합계값을 반환
COUNT(컬럼  | 익스프레션 | * ) : 그룹핑된 행의 개수

SELECT 행을 묶을 컬럼, 그룹함수
FROM 테이블명
[WHERE]
GROUP BY 행을 묶을 컬럼
[HAVING 그룹함수 체크조건];


SELECT *
FROM emp
ORDER BY deptno;


그룹함수에서 많이 어려워 하는 부분
SELECT 절에 기술할 수 있는 컬럼의 구분 :
                                    GROUP BY 절에 나오지 않은 컬럼이 SELECT 절에 나오면 에러



SELECT deptno, COUNT(*), MIN(sal), MAX(sal)
FROM emp
GROUP BY deptno;


밑에처럼 작성하면 오류난다. 오라클 입장에서는 그룹을 해야하는데 뭘 해야 할지 모른다는거다. 
SELECT deptno, sal, COUNT(*), MIN(sal), MAX(sal), SUM(sal), AVG(sal)
FROM emp
GROUP BY deptno;

SELECT deptno, ename, MIN(enam), COUNT(*), MIN(sal), MAX(sal), SUM(sal), AVG(sal)
FROM emp
GROUP BY deptno, ename;


전체 직원(모든 행을 대상으로)중에 가장 많은 급여를 받는 사람의 값
    : 전체행을 대상으로 그룹핑을 할 경우 GROUP BY를 쓰지 않는다.


SELECT deptno, MAX(sal)
FROM emp
GROUP BY deptno;

전체 직원중에 가장 큰 급여 값을 알수는 있지만 해당 급여를 받는 사람이 누군지는 
그룹함수만 이용 해서는 구할수가 없다.
emp 테이블 가장 큰 급여를 받는 사람의 값이 5000인 것은 알지만 해당 사원이 누구인지는
그룹함수만 사용해서는 누군지 식별할 수 없다.
    ==> 추후 진행

SELECT MAX(sal)
FROm emp;

COUNT 함수 * 인자
* : 행의 개수를 반환
컬럼 | 익스프레션 : NULL값이 아닌 행의 개수

SELECT COUNT(*), COUNT(mgr), COUNT(comm)
FROM emp;

그룹함수의 특징 : NULL값을 무시
NULL 연산의 특징 : 결과 항상 NULL이다.

SELECT SUM(comm)
FROM emp;


SELECT SUM(sal + comm), SUM(sal) + SUM(comm)
FROM emp;

SUM(sal + comm) 이거하고, SUM(sal) + SUM(comm)이거는 값이 다르다.

그룹함수 특징2 : 그룹화 관련없는 상수들은 SELECT 절에 기술할 수 있다.

SELECT deptno, SYSDATE, 'TEST', 1, COUNT(*)
FROM emp
GROUP BY deptno;


SELECT deptno, COUNT(*)
FROM emp
GROUP BY deptno;

밑에 애는 된다.
SELECT deptno, SYSDATE, COUNT(*)
FROM emp
GROUP BY deptno;

그룹함수 특징3:
    SINGLE ROW 함수의 경우 WHERE 에 기술하는 것이 가능하다.
    ex : SELECT *
        FROM emp
        WHERE ename = UPPER('smith');

그룹함수의 경우 WHERE에서 사용하는 것이 불가능하다.
    ==> HAVING 절에서 그룹함수에 대한 조건을 기술하여 행을 제한 할 수 있다.
    
    그룹함수는 WHERE절에 사용 불가
    SELECT deptno, COUNT(*)
    FROM emp
    WHERE COUNT(*) >= 5
    GROUP BY deptno;
    
    그룹함수에 대한 행 제한은 HAVING 절에 기술
    SELECT deptno, COUNT(*)
    FROM emp
    GROUP BY deptno
    HAVING COUNT(*) >= 5;

질문 : GROUP BY를 사용하면 WEHRE 절을 사용 못하냐?
질문 답 : GROUP BY에 대상이 되는 행들을 제한할 때 WHERE 절을 사용
예 : 
SELECT deptno, COUNT(*)
FROM emp
WHERE sal > 10
GROUP BY deptno;

SELECT comm, COUNT(*)
FROM emp
GROUP BY comm;
위에 문장은 null이 있으면 하나의 값?으로 침 NULL은 하나의 종류라고 보면 된다.

FUNCTION (group function 실습 group1)

선생님이 한거 답 : 
SELECT MAX(sal) max_sal,
        MIN(sal) min_sal, 
        ROUND(AVG(sal), 2) avg_sal,
        SUM(sal) sum_sal,
        COUNT(sal) count_sal,
        COUNT(mgr) count_mgr,
        COUNT(*) count_all
FROM emp;



내가 한건 밑에
SELECT sal, MAX(sal), MIN(sal), ROUND(AVG(sal), 2), SUM(sal), COUNT(*)
FROM emp
GROUP BY sal;


SELECT MAX(sal), MIN(sal), ROUND(AVG(sal), 2), SUM(sal), COUNT(*), COUNT(mgr), COUNT(empno)
FROM emp;

SELECT sal, MAX(sal), MIN(sal), ROUND(AVG(sal), 2), SUM(sal), COUNT(*), COUNT(mgr), COUNT(empno)
FROM emp
GROUP BY sal;

FUNCTION (group function 실습 group2)

***GROUP BY 절에 기술한 컬럼이 SELECT 절에 오지 않아도 실행에는 문제는 없다.

SELECT deptno, MAX(sal) max_sal,
        MIN(sal) min_sal, 
        ROUND(AVG(sal), 2) avg_sal,
        SUM(sal) sum_sal,
        COUNT(sal) count_sal,
        COUNT(mgr) count_mgr,
        COUNT(*) count_all
FROM emp
GROUP BY deptno;

FUNCTION (group function 실습 group3)

밑에는 선생님이 하신 답 : 
SELECT DECODE(deptno, 10, 'ACCOUNTING', 
            20, 'RESEARCH',
            30, 'SALES') dnnme,
        MAX(sal) max_sal,
        MIN(sal) min_sal, 
        ROUND(AVG(sal), 2) avg_sal,
        SUM(sal) sum_sal,
        COUNT(sal) count_sal,
        COUNT(mgr) count_mgr,
        COUNT(*) count_all
FROM emp
GROUP BY DECODE(deptno, 10, 'ACCOUNTING', 
            20, 'RESEARCH',
            30, 'SALES');

SELECT 
        CASE
            WHEN deptno = 10 THEN 'ACCOUNTING'
            WHEN deptno = 20 THEN 'RESEARCH'
            WHEN deptno = 30 THEN 'SALES'
            WHEN deptno = 30 THEN 'OPERATIONS'
            ELSE 'DDIT'
        END dname, 
        MAX(sal) max_sal,
        MIN(sal) min_sal, 
        ROUND(AVG(sal), 2) avg_sal,
        SUM(sal) sum_sal,
        COUNT(sal) count_sal,
        COUNT(mgr) count_mgr,
        COUNT(*) count_all
FROM emp
GROUP BY deptno
ORDER BY deptno;

FUNCTION (group function 실습 group4)

밑에는 년월까지 같은걸 취급하기 때문에 날짜가 달라도 월이 같으면 같은걸로 취급함
SELECT TO_CHAR(hiredate, 'yyyymm') hire_yyyymm, COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate, 'yyyymm');

밑에껄로 해도 되는데 9월 8일과 9월 28을 다른걸로 취급함
SELECT TO_CHAR(hiredate, 'yyyymm') hire_yyyymm, COUNT(*)
FROM emp
GROUP BY hiredate;

SELECT *
FROM emp;

FUNCTION (group function 실습 group5-7 과제)

FUNCTION (group function 실습 group5 과제)
답 : 

SELECT TO_CHAR(hiredate, 'yyyy') hire_yyyy, COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate, 'yyyy');


FUNCTION (group function 실습 group6 과제)
답 : 
SELECT COUNT(deptno) cnt
FROM dept;

SELECT 
DECODE(deptno, 10, 'ACCOUNTING', 
            20, 'RESEARCH',
            30, 'SALES',
            30, 'OPERATIONS')
FROM emp
GROUP BY DECODE(deptno, 10, 'ACCOUNTING', 
            20, 'RESEARCH',
            30, 'SALES',
            30, 'OPERATIONS');
SELECT COUNT(deptno) cnt
FROM dept;

SELECT *
FROM dept;

DECODE(deptno, 10, 'ACCOUNTING', 
            20, 'RESEARCH',
            30, 'SALES',
            30 THEN 'OPERATIONS')



SELECT DECODE(deptno, 10, 'ACCOUNTING', 
            20, 'RESEARCH',
            30, 'SALES') dnnme,
        MAX(sal) max_sal,
        MIN(sal) min_sal, 
        ROUND(AVG(sal), 2) avg_sal,
        SUM(sal) sum_sal,
        COUNT(sal) count_sal,
        COUNT(mgr) count_mgr,
        COUNT(*) count_all
FROM emp
GROUP BY DECODE(deptno, 10, 'ACCOUNTING', 
            20, 'RESEARCH',
            30, 'SALES');

FUNCTION (group function 실습 group7 과제)

답 : 
SELECT COUNT(*) cnt
FROM(
SELECT DECODE(deptno, 10, 'ACCOUNTING', 
            20, 'RESEARCH',
            30, 'SALES') deptno
FROM emp
GROUP BY DECODE(deptno, 10, 'ACCOUNTING', 
            20, 'RESEARCH',
            30, 'SALES'));

--되긴 되는데 오류가 남..
--SELECT COUNT(*) cnt
--FROM (SELECT DECODE(deptno, 10, 'ACCOUNTING', 
  --          20, 'RESEARCH',
    --        30, 'SALES',
      --      30, 'OPERATIONS') cnt
        --FROM emp
        --GROUP BY DECODE(deptno, 10, 'ACCOUNTING', 
          --  20, 'RESEARCH',
           -- 30, 'SALES',
            --30, 'OPERATIONS'));
--GROUP BY (SELECT DECODE(deptno, 10, 'ACCOUNTING', 
  --          20, 'RESEARCH',
   --         30, 'SALES',
    --        30, 'OPERATIONS')
     --   FROM emp
      --  GROUP BY DECODE(deptno, 10, 'ACCOUNTING', 
       --     20, 'RESEARCH',
        --    30, 'SALES',
         --   30, 'OPERATIONS'));



SELECT deptno
FROM
(SELECT DECODE(deptno, 10, 'ACCOUNTING', 
            20, 'RESEARCH',
            30, 'SALES',
            30, 'OPERATIONS')
    FROM emp
    GROUP BY deptno);

DECODE(deptno, 10, 'ACCOUNTING', 
            20, 'RESEARCH',
            30, 'SALES') dnnme


SELECT *
FROM emp;

******WHERE + JOIN SELECT SQL의 모든 것******
JOIN : 다른 테이블과 연결하여 데이터를 확장하는 문법
        .컬럼을 확장

**행을 확장 - 집합연산자(UNION, INTERSECT, MINUS)

JOIN 문법 구분
    1. ANSI - SQL
        : RDBMS에서 사용하는 SQL 표준
            (표준을 잘 지킨 모든 RDMBS-MYSQL, MSSQL, POSTGRESQL...에서 실행가능)
    2. ORACLE - SQL
        : ORACLE사만의 고유 문법

ANSI는 미국 산업 표준

회사에서 요구하는 형태로 따라가자
7(oracle) : 3(ansi)

NATURAL JOIN : 조인하고자 하는 테이블의 컬럼명이 같은 컬럼끼 연결
                컬럼의 값이 같은 행들끼 연결
    ANSI-SQL

    SELECT 컬럼
    FROM 테이블명 NATURAL JOIN 테이블명;


SELECT *
FROM emp NATURAL JOIN dept;

조인 컬럼에 테이블 한정자를 붙이면 NATURAL JOIN 에서는 에러로 취급
emp.deptno (x) ==> deptno (o)

컬럼명이 한쪽 테이블에만 존재할 경우 테이블 한정자를 붙이지 않아도 상관 없다
emp.empno {o},  emp (o)

SELECT emp.empno, deptno
FROM emp NATURAL JOIN dept;


SELECT emp.empno, deptno, dept.dname
FROM emp NATURAL JOIN dept;

//이렇게 하면 오류난다.
SELECT emp.empno, emp.deptno
FROM emp NATURAL JOIN dept;


NATURAL JOIN을 ORACLE 문법으로
1. FROM 절에 조인할 테이블을 나열한다.
2. WHERE절에 테이블 조인 조건을 기술한다.


NATURAL JOIN과 다르게 등록된것만 나온다.

SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;
위에 의미는 emp와 dept 부서번호?가 같을 때 연결한다.


ORA-00918: column ambiguously defined
컬럼이 여러개의 테이블에 동시에 존재하는 상황에서 테이블 한정자를 붙이지 않아서
오라클 입장에서는 해당 컬럼이 어떤 테이블의 컬럼인 알수가 없을 때 ㅂ라생.
deptno 컬럼은 emp, dept 테이블 양쪽 모두에 존재한다.

SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;


인라인뷰 별칭처럼, 테이블 별칭을 부여하는게 가능
컬럼과 다르게 AS 키워드는 붙이지 않는다.
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;


SELECT *
FROM emp e, dept d
WHERE e.deptno = d.deptno;

ANSI-SQL : JOIN WITH USING
    조인 하려는 테이블간 같은 이름의 컬럼이 2개 이상일 때
    하나의 컬럼으로만 조인을 하고 싶을 때 사용

SELECT *
FROM emp JOIN dept USING (deptno);

ORACLE 문법
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;

ANSI-SQL : JOIN WITH ON - 조인 조건을 개발자가 직접 기술
            NATURAL JOIN, JOIN WITH USING 절을 JOIN WITH ON 절을 통해 표현 가능

SELECT *
FROM emp JOIN dept ON( emp.deptno = dept.deptno); --오라클이 아니라 내가 직접 조건을 기술
WHERE emp.deptno IN ( 20, 30);
ORACLE

SELECT *
FROM emp, dept
WHERE emp. deptno = dept.deptno
    AND emp.deptno IN (20, 30);

논리적인 형태에 따른 구분
1. SELF JOIN : 조언하는 테이블이 서로 같은 경우

SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e JOIN emp m ON (e.mgr = m.empno);


SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e JOIN emp m ON (m.mgr = e.empno);

ORACLE 문법으로 바꾼거
SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno;

KING의 경우 mgr 컬럼의 값이 NULL 이기 때문에 e.mgr = m.empno 조건을 충족 시키지 못함
그래서 조인 실패해서 14건중 13건에 데이터만 조회

2. NONEQUI JOIN : 조인 조건이 =이 아닌 조인
SELECT
FROM emp
WHERE emp.empno=7369
    AND emp.deptno = dept.deptno;


sal를 이용하여 등급을 구하기
SELECT *
FROM salgrade;
empno, ename, sal, 등급(grade)

SELECT empno, ename, sal, grade
FROM emp e, salgrade s
WHERE e.sal >= s.losal 
    AND e.sal <= s.hisal;

SELECT empno, ename, sal, grade
FROM emp , salgrade
WHERE sal BETWEEN losal AND hisal;

ORCALE문법으로 된 위의 문장 ANSI-SQL문법으로 바꾸기

SELECT empno, ename, sal, grade
FROM emp JOIN salgrade ON ( sal >= losal AND sal <= hisal);



SELECT *
FROM emp;

SELECT *
FROM salgrade;

sal hisal

sa; >= losal AND
sal <= hisal

데이터 결합 (실습 join0-4까지 과제)

데이터 결합 (실습 join0 과제)
답 : 
SELECT e.empno, e.ename, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.deptno = d.deptno)
ORDER BY e.deptno;

SELECT e.empno, e.ename, e.deptno, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno
ORDER BY deptno ASC;

SELECT e.empno, e.ename, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.deptno = d.deptno);


SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno;

SELECT empno, ename, deptno, dname
FROM emp JOIN salgrade ON ( sal >= losal AND sal <= hisal);

SELECT *
FROM emp;

SELECT *
FROM dept;

데이터 결합 (실습 join1 과제)
답 : 

SELECT e.empno, e.ename, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.deptno = d.deptno)
WHERE e.deptno in ('10','30');




SELECT e.empno, e.ename, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.deptno = d.deptno)
WHERE e.deptno BETWEEN 10 AND 30;

SELECT e.empno, e.ename, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.sal >= losal AND sal <= hisal);

참고 밑에는
SELECT ename, sal, deptno from emp
where sal BETWEEN 2000 AND 500 or deptno in ('10', '30')

데이터 결합 (실습 join2 과제)

답 :

SELECT e.empno, e.ename, e.sal, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.deptno = d.deptno)
WHERE e.sal > 2500
ORDER BY e.deptno; 



SELECT *
FROM emp;

SELECT *
FROM dept;

데이터 결합 (실습 join3 과제)

답 :

SELECT e.empno, e.ename, e.sal, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.deptno = d.deptno)
WHERE e.sal > 2500 AND e.empno > 7600
ORDER BY e.deptno; 


데이터 결합 (실습 join4 과제)

답 :

SELECT e.empno, e.ename, e.sal, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.deptno = d.deptno)
WHERE e.sal > 2500 AND e.empno > 7600 AND d.dname in ('RESEARCH')
ORDER BY e.deptno; 











