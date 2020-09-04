
empno, ename, job, hiredate....
SELECT empno, ename ==> 컬럼으로 인식
FROM emp;

SELECT empno ename =>이렇게 적으면 empno가 ename 라고 컬럼명이 바뀌면서 나온다.
FROM emp;

별칭 기술 : 텍스트, "텍스트" / '텍스트'
SELECT empno ename
FROM emp;

WHERE 절 : 스프레드 시트
            - filter : 전체 데이터중에서 내가 원하는 행만 나오도록 제한

비교연산 <, >, =, !=, <>, <=, >=
        BETWEEN AND
        IN

연산자를 배울때 (복습할 때) 기억할 부분은
해당 연산자 x항 연산자 인지하자.

a++ : 단항연산자

int a = b > 5 ? 10 : 20;

BETWEEN AND : 비교대상 BETWEEN 시작값 AND 종료값
IN : 비교대상 IN (값, 값2.....)
LIKE : 비교대상 LIKE '매칭문자열 % _ '

SELECT *
FROM emp
WHERE 10 BETWEEN 10 AND 50; --이거 의미한느건 10보다 크거나 같고 50보다 작거나 같다인데 비교대상이 10이니 참이다

NULL 비교
NULL값은 =, != 등의 비교연산으로 비교가 불가능
EX : emp 테이블에는 comm컬럼의 값이 NULL인 데이터가 존재
comm이 NULL인 데이터를 조회 하기 위해 다음과 같이 실행할 경우
정상적으로 동작하지 않음
SELECT *
FROM emp
WHERE comm = NUIL;

SELECT *
FROM emp
WHERE comm IS NULL;

comm 컬럼의 값이 NULL이 아닐때
= , != , <>
>>IS NOT

SELECT *
FROM emp
WHERE comm IS NOT NULL;

IN <==> NOT IN
사원중 소속 부서가 10번이 아닌 사원 조회
SELECT *
FROM emp
WHERE deptno NOT IN (10)


사원중에 자신의 상급자가 존재하지 않는 사원들만 조회(모든컬럼)

SELECT *
FROM emp
WHERE mgr IS NULL;

논리 연산 : AND, OR, NOT
AND, OR : 조건을 결합
    AND : 조건1 AND 조건2 : 조건1과, 조건2를 동시에 만족하는 행만 조회가 되도록 제한
    OR : 조건1 OR 조건2 : 조건1 혹은 조건2를 만족하는 행만 조회 되도록 제한
    
조건1     조건2      조건1 AND 조건2     조건1 OR 조건2
T           T           T                   T           
T           F           F                   T
F           T           F                   T
F           F           F                   F

WHERE 절에 AND 조건을 사용하게 되면 : 보통은 행이 줄어든다.
WHERE 절에 OR 조건을 사용하게 되면 : 보통은 행이 늘어난다.

NOT : 부정 연산
다른 연산자와 함께 사용되며 부정형 표현으로 사용됨
NOT IN (값1, 값2.....)
IS NOT NULL
NOT EXISTS

mgr가 7698사번을 갖으면서 급여가 1000보다 큰 사원들을 조회
SELECT * 
FROM emp
WHERE mgr = 7698
    AND sal > 1000;

mgr가 7698이거나 sal가 1000보다 큰 사람
SELECT * 
FROM emp
WHERE mgr = 7698
    OR sal > 1000;

emp 테이블의 사원중에 mgr가 7698, 7839가 아닌 직원

SELECT * 
FROM emp
WHERE mgr != 7698
    AND mgr != 7839;

SELECT *
FROM emp
WHERE mgr NOT IN (7698, 7839);

IN연산자는 OR 연산자로 대체가 가능하다.

SELECT *
FROM emp
WHERE mgr IN (7698, 7839); ==> mgr = 7698 OR mgr = 7839

WHERE mgr NOT IN (7698, 7839); ==> mgr != 7698 AND mgr != 7839

위에 이런 문제 여러개 낸다.

IN 연산자 사용시 NULL 데이터 유의점

요구사항 : mgr가 7698, 7839, NULL인 사원만 조회
SELECT *
FROM emp
WHERE mgr IN (7698, 7839, NULL);
해석하자면 mgr = 7698 OR mgr = 7839 OR mgr = NULL;로 이해한다. IS?로 해석을 안한다.
그래서 바꾼다면 mgr = 7698 OR mgr = 7839 OR mgr IS NULL;로 한다.
그래서 정리해서 밑에다가 적으면
SELECT *
FROM emp
WHERE mgr IN (7698, 7839)
    OR mgr IS NULL;


SELECT *
FROM emp
WHERE mgr NOT IN (7698, 7839, NULL);
해석하자면 mgr != 7698 AND mgr != 7839 AND mgr != null

SELECT *
FROM emp
WHERE mgr NOT IN (SELECT MGR FROM emp); 
이렇게 쓰면 데이터가 안나온다.
★NOT IN 쓸때 집합에 NULL값이 들어가 있으면 안나온다.★

논리연산 (AND, OR, 실습 where7)

emp 테이블에서 job이 SALESMAN 이고 입사일자가 1981년 6월 1일 이후인  직원의 정보를 다음고 ㅏ같이 조회하세요.

SELECT *
FROM emp
WHERE job = 'SALESMAN'
    AND hiredate >= TO_DATE('19810601', 'YYYYMMDD');

논리연산(AND, OR 실습 where8)

emp 테이블에서 부서번호가 10번이 아니고 입사일자가 1981년 6월 1일 이후인 직원의 정보를 다음과 같이 조회 하세요.
(IN, NOT IN 연산자 사용금지)

SELECT *
FROM emp
WHERE deptno != 10
    AND hiredate >= TO_DATE('19810601', 'YYYYMMDD');

실습 where10

SELECT *
FROM emp
WHERE deptno IN (20, 30)
    AND hiredate >= TO_DATE('19810601', 'YYYYMMDD');

실습 11
job이 SALESMANT이거나 입사일자가 1981년 6월 1이후인 다음과 같이 조회
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR hiredate >= TO_DATE('19810601', 'YYYYMMDD');

실습12
job이 SALESMANT이거나 사원번호가78로 시작하는직원정보
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno LIKE '78%';

실습 13 (LIKE사용금지)
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno >= '7800'
    AND empno < '7900';

조건1 OR 조건2 AND 조건3
해석 : 조건1이거나 조건 2와 3인거?, 조건1 OR (조건2 AND 조건3)

논리연산실습 14

emp 테이블에서
1. job이 SALESMAN이거나
2. 사원번호가 78로 시작하면서 입사일자가 1981년 6월 1일 이후인 직원의 정보를 다음과 같이 조회
1번 조건 또는 2번 조건을 만족하는 직원

SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno >= '7800' AND empno < '7900'
    AND hiredate >= TO_DATE('19810601', 'YYYYMMDD');
    --위에 이게 맞는지 모르겠음

SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno LIKE '78%';
    
정렬
**************** 매우매우 중요 ****************

RDBMS는 집합에서 많은 부분을 차용
집합의 특징 : 1. 순서가 없다
            2. 중복을 허용하지 않는다.
{1, 5, 10} == {5, 1, 10} {집합에 순서는 없다}
{1, 5, 5, 10} ==> {1, 5, 10} (집합은 중복을 허용하지 않는다.)

1. 순서가 없다 이게 어떻게 표현되나면
아래 sql의 실행결과, 데이터의 조회 순서는 보장되지 않는다.
지금은 7369, 7499...조회가 되지만
내일 동일한 sql을 실행 하더라도 오늘 순서가 보장되지 않는다. (바뀔 수 있음)
SELECT *
FROM emp

* 데이터는 보편적으로 데이터를 입력한 순새돌 나온다(보장은 아님)
** table에는 순서가 없다.
SELECT *
FROM emp;

시스템을 만들다 보면 데이터의 정렬이 중요한 경우가 많다.
게시판 글 리스트 : 가장 최신글이 가장위로 와야 한다.

** 즉 SELECT 결과 행의 순서를 조정할 수 있어야 한다.
    ==> ORDER BY 구문
    
문법
SELECT *
FROM 테이블명
(WHERE)
(ORDER BY 컬럼1, 컬럼2)

SELECT *
FROM emp
ORDER BY job, empno;

오름차순, ASC : 값이 작은 데이터부터 큰 데이터 순으로 나열
내림차순, DESC : 값이 큰 데이터부터 작은 데이터 순으로 나열

ORALCE에서는 기본적으로 오름차순이 기본 값으로 적용됨
내림차순으로 정렬을 원할경우 정렬 기준 컬럼 뒤에 DESC를 붙여 준다.

job컬럼으로 오름차순 정렬하고, 같은 job을 갖는 행끼리는 empno로 내림차순 정렬한다.
SELECT *
FROM emp
ORDER BY job, empno DESC;

참고로만......중요하진 않음
1. ORDER BY 절에 별칭 사용 가능
ORDER BY 별칭

SELECT empno eno, ename enm
FROM emp
ORDER BY enm;

2. ORDER BY 절에 SELECT 절의 컬럼 순서 번호를 기술 하여 정렬 가능
SELECT empno, ename
FROM emp
ORDER BY 2; ==> ORDER BY ename

3. expression도 가능
SELECT empno, ename, sal + 500 sal_ps
FROM emp
ORDER BY sal + 500;
위에나 == 밑에나 
SELECT empno, ename, sal + 500
FROM emp
ORDER BY sal + 500;

데이터 정렬 ORDER BY 실습 orderby1
dept 테이블의 모든 정보를 부서일므으로 오름차순 정렬로 조회되도록 쿼리를 작성하세요.
dept 테이블의 모든 정보를 부서 위치로 내림차순 정렬로 조회되도록 쿼리를 작성하세요.

SELECT *
FROM dept
ORDER BY dname ASC;
SELECT *
FROM dept
ORDER BY dname DESC;

데이터 정렬 (ORDER BY 실습 orderby2)
comm이 존재하는 사원만 조회, 단 상여가 0인 사람은 상여가 없는 것으로 간주.
SELECT *
FROM emp
WHERE comm != 0
ORDER BY comm DESC
    AND comm between ; -- AND와 between할려했는데 그게 아니고 그냥 ORDER BY에 ,하고 컬럼명만 바꿔도 됬었다.

답 : 
SELECT *
FROM emp
WHERE comm IS NOT NULL
    AND comm != 0
ORDER BY comm DESC, empno DESC;

데이터 정렬(ORDER BY 실습 orderby3)

SELECT *
FROM emp
WHERE mgr IS NOT NULL
ORDER BY job ASC, empno DESC;

데이터 정렬 실습4

SELECT *
FROM emp
WHERE deptno IN (10, 30)
    AND sal > 1500
ORDER BY ename DESC;

orderby 4]

밑에는 우리가 적는 순서
1. SELECT *
2. FROM emp
3. WHERE deptno IN (10, 20)
    AND sal > 1500
4. ORDER BY ename DESC;

오라클 입장에서 처리하는 순서 : 2-3-1-4



**************************실무에서 매우 많이 사용**************************
ROWNUM : 행의 번호를 부여해주는 가상 컬럼
            ** 조회된 순서대로 번호를 부여

    ROWNUM은 1번부터 순차적으로 데이터를 읽어 올 때만 사용 가능
1. WHERE 절에 사용하는 것이 가능
    * WHERE ROWNUM = 1 ( = 동등 비교 연산의 경우 1만 가능)
      WHERE ROWNUM <= 15
      WHERE ROWNUM BETWEEN 1 AND 15



SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM = 3;
에러는 아니고 검색값만 안나옴

SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM = 3;


SELECT ROWNUM, empno, ename
FROM emp
WHERE 글번호 BETWEEN 46 AND 60;
위에 문장은 글번호 조회 다만 이렇게하면 오류남

SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM BETWEEN 6 AND 10;

2. ORDER BY 절은 SELECT 이후에 실행된다
    **SELECT절에 ROWNUM을 사용하고 ORDER BY절을 적용 하게 되면
      원하는 결과를 얻지 못한다.
      
SELECT ROWNUM, empno, ename
FROM emp
ORDER BY ename;
--순서가 꼬이는것처럼 보인다.그래서 먼저 정렬하고 ORDER를 부여하면 우리가 원하는대로 나온다.

정렬을 먼저 하고, 정렬된 결과에 ROWNUM을 적용
==> INLINE-VIEW
    SELECT 결과를 하나의 테이블 처럼 만들어 준다.

SELECT *
FROM
(SELECT empno, ename
FROM emp
ORDER BY ename);
() 가로 친걸 하나의 테이블로 한다. 그래서 위에처럼 문장치고 돌리면 내가 원하는 대로 정렬되서 결과가 나온다.


SELECT ROWNUM, a.*
FROM
(SELECT empno, ename
FROM emp
ORDER BY ename) a;
위에께 좋음
() 가로 친걸 하나의 테이블로 한다. 그래서 위에처럼 문장치고 돌리면 내가 원하는 대로 정렬되서 결과가 나온다.

사원정보를 페이징 처리
1페이지 5명씩 조회
1페이지 : 1~5, 2페이지 : 6~10, 3페이지 : 11~15

SELECT ROWNUM, a.*
FROM
(SELECT empno, ename
FROM emp
ORDER BY ename) a
WHERE ROWNUM BETWEEN 6 AND 10; 이렇게 하면 좋을것 같은데 ROWNUM은 1번부터라서 안됨 그래서 밑에처럼 처리해야함

SELECT *
FROM
    (SELECT ROWNUM rn, a.*
    FROM
        (SELECT empno, ename
        FROM emp
        ORDER BY ename) a)
WHERE rn BETWEEN 6 AND 10;

사원정보를 페이징 처리
1페이지 5명씩 조회
1페이지 : 1~5, page ~ page * pageSize 페이지 구하는 공식 : (page-1)* pageSize
2페이지 : 6~10,
3페이지 : 11~15

page = 1, pageSize = 5

SELECT *
FROM (SELECT ROWNUM rn, a.*
    FROM
    (SELECT empno, ename
        FROM emp
        ORDER BY ename) a)
WHERE rn BETWEEN (:page - 1) * :pageSize + 1 AND :page * "pageSize;

SELECT 절에 * 사용했는데 ,를 통해 다른 특수 컬럼이나 EXPRESSION을 사용 할 경우는
        *앞에 해당 데이터가 어떤 테이블에서 왔는지 명시를 해줘야 한다(한정자).
SELECT ROWNUM, *
FROM emp;

SELECT ROWNUM, emp.*
FROM emp;

별칭은 테이블에도 적용 가능, 단 컬럼이랑 다르게 AS 옵션은 없다

SELECT ROWNUM,
FROM emp e;

SELECT ROWNUM,
FROM emp AS e; 이거 넣으면 오류남








































