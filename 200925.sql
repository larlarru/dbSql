
REPORT GROUP FUNCTION
GROUP BY의 확장 : SUBGROUP을 자동을 생성하여 하나의 결과로 합쳐준다.
1. ROLLUP(col1, col2.....)
    . 기술된 컬럼을 오른쪽에서 부터 지워 나가며 서브 그룹을 생성
    
2. GROUPING SETS ((col1, col2), col3)
    . ,단위로 기술된 서브 그룹을 생성

3. CUBE(col1, col2.....)
    . 컬럼의 순서는 지키되, 가능한 모든 조합을 생성한다.

GROUP BY CUBE(job, deptno) ==> 4ri
    job deptno
     0    0     ==> GROUP BY job, deptno
     0    X     ==> GROUP BY job
     X    0     ==> GROUP BY deptno (ROLLUP에는 없던 서브 그룹)
     X    X     ==> GROUP BY 전체

GROUP BY ROLLUP(job, deptno) ==> 3개




SELECT job, deptno, SUM(sal + NVL(comm, 0)) sal
FROM emp
GROUP BY CUBE(job, deptno);

CUBE의 경우 가능한 모든 조합으로 서브 그룹을 생성하기 때문에
2의 기술한 컬럼개수 승 만큼의 서브 그룹이 생성된다.
CUBE(col1, col2) : 4 --각 컬럼마다 4가지 경우수가 생김
CUBE(col1, col2, col3) : 8
CUBE(col1, col2, col3, col4) : 16

REPORT GROUP FUNCTION 조합
GROUP BY job, ROLLUP(deptno), CUBE(mgr)
                deptno      mgr
                 전체        전체
                 
        job, deptno, mgr
        job, deptno
        job, mgr
        job, 전체
        
SELECT job, deptno, mgr, SUM(sal + NVL(sal + NVL(comm, 0)) sal
FROM emp
GROUP BY job, ROLLUP(hdeptno), CUBE(mgr);

상호 연관 서브 쿼리를 이용한 업데이트
1. EMP_TEST 테이블 삭제
2. EMP 테이블을 사용하여 EMP_TEST 테이블 생성(모든 컬럼, 모든 데이터)
3. EMP_TEST테이블에는 DNAME 컬럼을 추가( VARCHAR2(14) ) 
4. 상호 연관 서브쿼리를 이용하여 EMP_TEST테이블의 DNAME 컬럼을 DEPT을 이용하여 UPDATE

DESC dept;

DROP TABLE emp_test;

CREATE TABLE emp_test AS 
SELECT *
FROM emp;

ALTER TABLE emp_test ADD (dname VARCHAR2(14));

SELECT *
FROM emp_test;

비상호연관성? : 단독으로 쿼리를 실행가능한거
SELECT *
FROM emp_test;
UPDATE emp_test SET dname = (SELECT dname FROM dept WHERE deptno = emp_test.deptno);

상호연관성 :

UPDATE emp_test SET dname = (SELECT dname FROM dept WHERE deptno = emp_test.deptno);

서브쿼리 ADVANCED (correlated subquery update - 실습 sub_a1)
답 : 
DROP TABLE dept_test;

CREATE TABLE dept_test AS 
SELECT *
FROM dept;

DESC dept;

ALTER TABLE dept_test ADD (empcnt NUMBER);

UPDATE dept_test SET empcnt = (SELECT COUNT(*) FROM emp WHERE deptno = dept_test.deptno);

COMMIT;

SELECT *
FROM dept;


SELECT COUNT(*)
FROM emp
WHERE deptno = 10
AND deptno = 20;

SELECT *
FROM dept_test;

SELECT *
FROM dept_test;

INSERT INTO emp_test (empno) VALUES (9999) --추가 구문


서브쿼리 ADVANCED (correlated subquery delete - 실습 sub_a2)
답 : 
INSERT INTO dept_test (deptno, dname, loc) VALUES (99, 'it1', 'daejeon');
INSERT INTO dept_test (deptno, dname, loc) VALUES (98, 'it2', 'daejeon');

ALTER TABLE dept_test DROP COLUMN empcnt;

DELETE dept_test
WHERE 0 = (SELECT COUNT(*)
            FROM emp
            WHERE deptno = dept_test.deptno);

또는

DELETE dept_test
WHERE deptno NOT IN(10, 20, 30);
또는
DELETE dept_test
WHERE deptno NOT IN(SELECT deptno
                    FROM emp);

또는

DELETE dept_test
WHERE NOT EXISTS (SELECT 'X'
                FROM emp
                WHERE deptno = dept_test.deptno);

SELECT *
FROM dept_test;

부서에 속한 직원이 없는 부서를 삭제하는 쿼리를 작성하세요.

DESC dept;

DELETE dept_test;


SELECT *
FROM dept_test;

DELETE dept
WHERE deptno >= 90;

과제 :**************************************************************
ppt3에 있는 p47
서브쿼리 ADVANCED (correlated subquery delete - 실습 sub_a3) ppt47(응용3)

DROP TABLE emp_test;

CREATE TABLE emp_test AS 
SELECT *
FROM emp;

SELECT *
FROM emp_test;

DESC emp;

ALTER TABLE emp_test ADD (empcnt NUMBER);

UPDATE dept_test SET empcnt = (SELECT COUNT(*) FROM emp WHERE deptno = dept_test.deptno);

COMMIT;

SELECT *
FROM emp_test;

평균 급여보다 낮으면 + 200
SELECT  sal
FROM emp_test
WHERE sal <= (SELECT AVG(sal)
            FROM emp_test);
            
SELECT sal, sal
FROM emp_test e, emp_test t
WHERE e.sal = t.sal;


DESC emp_test;

ALTER TABLE emp_test ADD (addsal NUMBER);

UPDATE emp_test SET addsal = 
(SELECT sal
FROM emp
WHERE sal <= (SELECT AVG(sal)
            FROM emp))

추가 

UPDATE emp_test SET addsal = sal + 200
WHERE sal <= (SELECT AVG(sal)
            FROM emp
            WHERE deptno = emp_test.deptno
            GROUP BY deptno);
            
UPDATE emp_test SET addsal = sal
WHERE sal <= (SELECT AVG(sal)
            FROM emp);

(SELECT sal
FROM emp
WHERE sal <= (SELECT ROUND(AVG(sal))
            FROM emp));

SELECT *
FROM emp_test;

DBA 커뮤니티 그룹

시험문제 실험

SELECT 'TEST1' alias1,
        TEST2 AS 'alias2',
        'TEST3' AS "alias3"
FROM dual;

SELECT 'TEST1' || 'dummy'
FROM dual;

SELECT *
FROM emp
WHERE deptno NOT IN (10, 20);

SELECT *
FROM emp e
WHERE EXISTS (SELECT 'X'
                FROM emp m
                WHERE e.mgr = m.empno);

SELECT *
FROM emp, dept;


SELECT *
FROM dept;

SELECT *
FROM emp, dept
WHERE emp.deptno != dept.deptno;

시험문제 실험

SELECT emp.empno, emp.ename,
    (SELECT *
     FROM dept
     WHERE deptno = emp.deptno) d
FROM emp;

SELECT e.empno, e.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

달력만들기 : 행을 열로 만들기-레포트 쿼리에서 자주 사용하는 형태
주어진것  : 년월(수업시간에는 '202009' 문자열을 사용)

SELECT TO_CHAR(LAST_DAY(TO_DATE('202008', 'YYYYMM')), 'DD')
FROM dual;



SELECT TO_DATE('202002', 'YYYYMM') + LEVEL-1 day,
        TO_CHAR(TO_DATE('202002', 'YYYYMM') + LEVEL-1, 'D') d
FROM dual
CONNECT BY LEVEL <= 
TO_CHAR(LAST_DAY(TO_DATE('202002', 'YYYYMM')), 'DD');

SELECT TO_CHAR(sysdate, 'iw'), TO_CHAR(sysdate)
FROM dual;


SELECT day, d, iw, DECODE(d, 1, day) sun,
        DECODE(d, 2, day) mon, 
        DECODE(d, 3, day) tue, 
        DECODE(d, 4, day) wed, 
        DECODE(d, 5, day) thu, 
        DECODE(d, 6, day)fri, 
        DECODE(d, 7, day) sat
FROM
(SELECT TO_DATE('202002', 'YYYYMM') + LEVEL-1 day,
        TO_CHAR(TO_DATE('202002', 'YYYYMM') + LEVEL-1, 'd') d,
        TO_CHAR(TO_DATE('202002', 'YYYYMM') + LEVEL-1, 'iw') iw
FROM dual
CONNECT BY LEVEL <= 
TO_CHAR(LAST_DAY(TO_DATE('202002', 'YYYYMM')), 'DD'));

DECODE(iw, 1, iw+1, iw)

SELECT iw, MIN(DECODE(d, 1, day)) sun,
        MIN(DECODE(d, 2, day)) mon, MIN(DECODE(d, 3, day)) tue, 
        MIN(DECODE(d, 4, day)) wed, MIN(DECODE(d, 5, day)) thu, 
        MIN(DECODE(d, 6, day)) fri, MIN(DECODE(d, 7, day)) sat
FROM
(SELECT TO_DATE('202002', 'YYYYMM') + LEVEL-1 day,
        TO_CHAR(TO_DATE('202002', 'YYYYMM') + LEVEL-1, 'd') d,
        TO_CHAR(TO_DATE('202002', 'YYYYMM') + LEVEL-1, 'iw') iw
FROM dual
CONNECT BY LEVEL <= 
TO_CHAR(LAST_DAY(TO_DATE('202002', 'YYYYMM')), 'DD'))
GROUP BY iw
ORDER BY iw;

DECODE(d, 1, iw+1, iw)

달력 : 
SELECT MIN(DECODE(d, 1, day)) sun,
        MIN(DECODE(d, 2, day)) mon, MIN(DECODE(d, 3, day)) tue, 
        MIN(DECODE(d, 4, day)) wed, MIN(DECODE(d, 5, day)) thu, 
        MIN(DECODE(d, 6, day)) fri, MIN(DECODE(d, 7, day)) sat
FROM
(SELECT TO_DATE('202002', 'YYYYMM') + LEVEL-1 day,
        TO_CHAR(TO_DATE('202002', 'YYYYMM') + LEVEL-1, 'd') d,
        TO_CHAR(TO_DATE('202002', 'YYYYMM') + LEVEL-1, 'iw') iw
FROM dual
CONNECT BY LEVEL <= 
TO_CHAR(LAST_DAY(TO_DATE('202002', 'YYYYMM')), 'DD'))
GROUP BY DECODE(d, 1, iw+1, iw)
ORDER BY DECODE(d, 1, iw+1, iw);

SELECT MIN(DECODE(d, 1, day)) sun,
        MIN(DECODE(d, 2, day)) mon, MIN(DECODE(d, 3, day)) tue, 
        MIN(DECODE(d, 4, day)) wed, MIN(DECODE(d, 5, day)) thu, 
        MIN(DECODE(d, 6, day)) fri, MIN(DECODE(d, 7, day)) sat
FROM
(SELECT TO_DATE(:yyyymm, 'YYYYMM') + LEVEL-1 day,
        TO_CHAR(TO_DATE(:yyyymm, 'YYYYMM') + LEVEL-1, 'd') d,
        TO_CHAR(TO_DATE(:yyyymm, 'YYYYMM') + LEVEL-1, 'iw') iw
FROM dual
CONNECT BY LEVEL <= 
TO_CHAR(LAST_DAY(TO_DATE(:yyyymm, 'YYYYMM')), 'DD'))
GROUP BY DECODE(d, 1, iw+1, iw)
ORDER BY DECODE(d, 1, iw+1, iw);

SELECT TO_CHAR(TO_DATE('20191229', 'YYYYMMDD'), 'iw'),
        TO_CHAR(TO_DATE('20191230', 'YYYYMMDD'), 'iw'),
        TO_CHAR(TO_DATE('20191231', 'YYYYMMDD'), 'iw')
FROM dual;

create table sales as 
select to_date('2019-01-03', 'yyyy-MM-dd') dt, 500 sales from dual union all
select to_date('2019-01-15', 'yyyy-MM-dd') dt, 700 sales from dual union all
select to_date('2019-02-17', 'yyyy-MM-dd') dt, 300 sales from dual union all
select to_date('2019-02-28', 'yyyy-MM-dd') dt, 1000 sales from dual union all
select to_date('2019-04-05', 'yyyy-MM-dd') dt, 300 sales from dual union all
select to_date('2019-04-20', 'yyyy-MM-dd') dt, 900 sales from dual union all
select to_date('2019-05-11', 'yyyy-MM-dd') dt, 150 sales from dual union all
select to_date('2019-05-30', 'yyyy-MM-dd') dt, 100 sales from dual union all
select to_date('2019-06-22', 'yyyy-MM-dd') dt, 1400 sales from dual union all
select to_date('2019-06-27', 'yyyy-MM-dd') dt, 1300 sales from dual;


SELECT MIN(DECODE(d, 1, day)) sun,
        MIN(DECODE(d, 2, day)) mon, MIN(DECODE(d, 3, day)) tue, 
        MIN(DECODE(d, 4, day)) wed, MIN(DECODE(d, 5, day)) thu, 
        MIN(DECODE(d, 6, day)) fri, MIN(DECODE(d, 7, day)) sat
FROM
(SELECT TO_DATE('202002', 'YYYYMM') + LEVEL-1 day,
        TO_CHAR(TO_DATE('202002', 'YYYYMM') + LEVEL-1, 'd') d,
        TO_CHAR(TO_DATE('202002', 'YYYYMM') + LEVEL-1, 'iw') iw
FROM dual
CONNECT BY LEVEL <= 
TO_CHAR(LAST_DAY(TO_DATE('202002', 'YYYYMM')), 'DD'))
GROUP BY DECODE(d, 1, iw+1, iw)
ORDER BY DECODE(d, 1, iw+1, iw);

SELECT jan, feb, mar, apr, may, jun
FROM sales;

SELECT *
FROM sales;

SELECT *
FROM sales
CONNECT BY LEVEL <= TO_CHAR(TO_DATE('202006', 'YYYYMM'));

ppt 달력쿼리에 p23에 있는 복습(실습 calendar1)
답 : 
SELECT NVL(MIN(DECODE(mm, '01', sales)), 0) jan, 
        NVL(MIN(DECODE(mm, '02', sales)), 0) feb, 
        NVL(MIN(DECODE(mm, '03', sales)), 0) mar, 
        NVL(MIN(DECODE(mm, '04', sales)), 0) apr, 
        NVL(MIN(DECODE(mm, '05', sales)), 0) may, 
        NVL(MIN(DECODE(mm, '06', sales)), 0) jun
FROM
(SELECT TO_CHAR(dt, 'mm') mm, SUM(sales) sales
FROM sales
GROUP BY TO_CHAR(dt, 'mm'));

SELECT *
FROM dept_h
START WITH deptcd = 'dept0'
CONNECT BY PRIOR deptcd = p_deptcd;

LEVEL는 계층 처음시작은 1로 시작
LEVEL *3은 레벨 곱하기 3칸을 띄우라는거다

SELECT deptcd, LPAD(' ', (LEVEL-1) * 3) || deptnm, LEVEL
FROM dept_h
START WITH deptcd = 'dept0'
CONNECT BY PRIOR deptcd = p_deptcd;


14번 답 ename빠짐


COMMIT;
































