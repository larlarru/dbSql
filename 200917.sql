순위  시도  시군구 도시발전지수  kfc건수   맥도날드    버거킹 롯데리아
1   서울시 서초구     4.5         3       4       5       6
2   서울시 강남구     4.3
3   부산시 해운대구    4.1

서울시 시초구 kfc 6
서울시 시초구 맥도날드 5

참고 : 

SELECT gb, sido, sigungu
FROM fastfood
WHERE sido = '대전광역시' AND sigungu = '중구'

SELECT gb, sido, sigungu
FROM fastfood
WHERE sido = '대전광역시' AND sigungu = '중구'

SELECT gb, sido, sigungu
FROM fastfood
GROUP BY sido, sigungu, gb
ORDER BY sido, sigungu, gb;


SELECT gb, sido, sigungu
FROM fastfood
GROUP BY sido, sigungu, gb

밑에 이런 데이터 한 4개 만들기
SELECT sido, sigungu, gb, COUNT(*)
FROM fastfood
WHERE gb = '롯데리아'
AND sido = '강원도'
AND sigungu = '강릉시'
GROUP BY sido, sigungu, gb
ORDER BY sido, sigungu, gb;

SELECT sido, sigungu, gb, COUNT(*)
FROM fastfood
WHERE gb = '맥도날드'
AND sido = '강원도'
AND sigungu = '강릉시'
GROUP BY sido, sigungu, gb
ORDER BY sido, sigungu, gb;



SELECT s.sido, s.sigungu, e.gb, COUNT(e.gb), s.gb, COUNT(s.gb)
FROM fastfood s , fastfood e 
WHERE s.sigungu = e.sigungu
AND s.sido = e.sido
AND s.gb = '롯데리아'
AND e.gb = '맥도날드'
AND s.sido = '강원도'
AND s.sigungu = '강릉시'
GROUP BY s.sido, s.sigungu, e.gb, s.gb

SELECT sido, sigungu, gb, COUNT(*)

SELECT s.sido, s.sigungu, e.gb, COUNT(e.gb), s.gb, COUNT(s.gb)
FROM fastfood s , fastfood e 
WHERE s.sigungu = e.sigungu
AND s.sido = e.sido

AND s.gb = '롯데리아'
AND e.gb = '맥도날드'
AND s.sido = '강원도'
AND s.sigungu = '강릉시'
GROUP BY s.sido, s.sigungu, s.gb, e.gb


ORDER BY sido, sigungu, gb;

선생님 답 :
SELECT a.sido, a.sigungu, a.cnt, b.cnt, ROUND(a.cnt/b.cnt, 2) di
FROM
(SELECT sido, sigungu, COUNT(*) cnt
FROM fastfood
WHERE gb IN ('KFC', '맥도날드', '버거킹')
GROUP BY sido, sigungu) a,

(SELECT sido, sigungu, COUNT(*) cnt
FROM fastfood
WHERE gb = '롯데리아'
GROUP BY sido, sigungu) b
WHERE a.sido = b.sido
AND a.sigungu = b.sigungu
ORDER BY di DESC;



SELECT sido, sigungu, gb, COUNT(*) cnt
FROM fastfood
WHERE gb = 'kfc'
GROUP BY sido, sigungu, gb
ORDER BY sido, sigungu, gb;

SELECT sido, sigungu, gb, COUNT(*) cnt
FROM fastfood
WHERE gb = '맥도날드'
GROUP BY sido, sigungu, gb
ORDER BY sido, sigungu, gb;


SELECT sido, sigungu, gb, COUNT(*) cnt
FROM fastfood
WHERE gb = '맘스터치'
GROUP BY sido, sigungu, gb
ORDER BY sido, sigungu, gb;


SELECT sido, sigungu, gb, COUNT(*) cnt
FROM fastfood
WHERE gb = '버거킹'
GROUP BY sido, sigungu, gb
ORDER BY sido, sigungu, gb;


***********일할때 많이 쓰는 기술중 하나********************

kfc 건수, 롯데리아건수, 버거킹 건수, 맥도날드 건수

SELECT sido, sigungu, gb, cnt,
        DECODE(gb, 'KFC', cnt) kfc,
        DECODE(gb, '롯데리아', cnt) 롯데리아,
        DECODE(gb, '버거킹', cnt) 버거킹,
        DECODE(gb, '맥도날드', cnt) 맥도날드
FROM
(SELECT sido, sigungu, gb, COUNT(*) cnt
FROM fastfood
WHERE gb IN ('KFC', '롯데리아', '버거킹', '맥도날드')
GROUP BY sido, sigungu, gb)
ORDER BY sido, sigungu, gb;

SELECT sido, sigungu,
        DECODE(gb, 'KFC', cnt) kfc,
        DECODE(gb, '롯데리아', cnt) 롯데리아,
        DECODE(gb, '버거킹', cnt) 버거킹,
        DECODE(gb, '맥도날드', cnt) 맥도날드
FROM
(SELECT sido, sigungu, gb, COUNT(*) cnt
FROM fastfood
WHERE gb IN ('KFC', '롯데리아', '버거킹', '맥도날드')
GROUP BY sido, sigungu, gb)
ORDER BY sido, sigungu, gb;

테이블 한번만 읽어서 도시지수? 알아내기
SELECT sido, sigungu,
       ROUND((NVL(SUM(DECODE(gb, 'KFC', cnt)), 0) +
        NVL(SUM(DECODE(gb, '맥도날드', cnt)), 0) +
        NVL(SUM(DECODE(gb, '버거킹', cnt)), 0) ) /
        NVL(SUM(DECODE(gb, '롯데리아', cnt)), 1), 2) di
FROM
(SELECT sido, sigungu, gb, COUNT(*) cnt
FROM fastfood
WHERE gb IN ('KFC', '롯데리아', '버거킹', '맥도날드')
GROUP BY sido, sigungu, gb)
GROUP BY sido, sigungu
ORDER BY di DESC;

SELECT sido, sigungu, ROUND(sal/people) p_sal
FROM tax
ORDER BY p_sal DESC;

도시발전지수 1 - 세금1위
도시발전지수 2 - 세금2위
도시발전지수 3 - 세금3위

SELECT sido, sigungu, sal
FROM tax;

DML : Data Manipulate LANGUAGE
1, SELECT *********************
2. INSERT : 테이블에 새로운 데이터를 입력하는 명령
3. UPDATE : 테이블에 존재하는 데이터의 컬럼을 번경하는 명령
4. DELETE : 테이블에 존재하는 데이터(행)를 삭제하는 명령

INSERT 3가지
1. 테이블의 특정 컬럼에만 데이터를 입력할 때(입력되지 않은 컬럼은 NULL로 설정 된다.)
INSERT INTO 테이블명 (컬럼1, 컬럼2,...) VALUES (컬러1의 값1, 컬럼2의 값2...);
DESC emp;

INSERT INTO emp (empno, ename) VALUES (9999, 'brown');
SELECT *
FROM emp
WHERE empno = 9999;

empno컬럼의 설정이 NOT NULL이기 때문에 empno 컬럼에 NULL 값이 들어갈 수 없어서 에러가 발생
INSERT INTO emp (ename) VALUES ('sally');

2. 테이블의 모든 컬럼에 모든 데이터를 입력할 때
    **** 단 값을 나열하는 순서는 테이블의 정의된 컬럼 순서대로 기술 해야한다.
        테이블 컬럼 순서 확인 방법 : DESC 테이블명
INSERT INTO 테이블명 VALUES (컬러1의 값1, 컬럼2의 값2...);

DESC dept;

SELECT *
FROM dept

INSERT INTO dept VALUES (98, '대덕', '대전');
SELECT *
FROM dept;

컬럼을 기술하지 않았기 때문에 테이블에 정의된 모든 컬럼에 대해 값을 기술해야하니
3개중에 2개만 기술하여 에러 발생
INSERT INTO dept VALUES (97, 'DDIT');


3. SELECT 결과를(여러행일 수도 있다) 테이블에 입력
INSERT INTO emp (empno, ename)
INSERT INTO 테이블명 [(col,...)]
SELECT 구문;

SELECT 9997, 'cony' FROM dual
UNION ALL
SELECT 99996, 'moon' FROM dual;


SELECT *
FROM emp;

날짜 컬럼 값 입력하기
INSERT INTO emp VALUES (9996, 'james', 'CLERK', NULL,
                        SYSDATE, 3000, NULL, NULL);

'2020/09/01'
INSERT INTO emp VALUES (9996, 'james', 'CLERK', NULL,
                        TO_DATE('2020/09/01', 'YYYY/MM/DD'), 
                        3000, NULL, NULL);


SELECT *
FROM emp;

UPDATE : 테이블에 존재하는 데이터를 수정
         1. 어떤 데이터를 수정할지 데이터를 한정 (WHERE)
         2. 어떤 컬럼에 어떤 값을 넣을지 기술

UPDATE 테이블명 SET 변경할 컬럼명 = 수정할 값 [, 변경할 컬럼명 = 수정할 값...]
[WEHRE]
9   ddit    daejeon
dept 테이블의 deptno 컬럼의 값이 99번인 데이터의
    DNAME 컬럼ㅂ을 대문자 DDIT로, LOC 컬럼을 한글 '영민'으로 변경

UPDATE dept SET dname = 'DDIT', loc = '영민'
WHERE deptno = 99;

SELECT *
FROM dept;

UPDATE dept SET dname = 'DDIT', loc = '영민';

커밋만 안한다면 현재 하나의 과정 트랜잭션?이 되어 있기 때문에 ROLLBACK하면 돌아간다.
ROLLBACK;

2. 서브쿼리를 활용한 데이터 변경 (***추후 MERGE 구문을 배우면 더 효율적으로 작성할 수 있다)

테스트 데이터 입력
INSERT INTO emp (empno, ename, job) VALUES (9000, 'brown', NULL);

9000번 사번의 DEPTNO, JOB 컬럼의 값을 SMITH 사원의 DEPTNO, JOB 컬럼으로 동일하게 변경
SELECT deptno, job
FROM emp
WHERE ename = 'SMITH';

UPDATE emp SET deptno = 값1, job = 값2


UPDATE emp SET deptno = 20, job = 'CLERK'


UPDATE emp SET deptno = (SELECT deptno
                         FROM emp
                         WHERE ename = 'SMITH')
                , job = (SELECT job
                         FROM emp
                         WHERE ename = 'SMITH')
WHERE empno = 9000;

SELECT *
FROM emp
WHERE ename IN ('brown', 'SMITH');

3. DELETE : 테이블에 존재하는 데이터를 삭제(행 전체를 삭제)
*****emp테이블에서 9000번 사번의 deptno 컬럼을 지우고 싶을 때 (NULL) ??
    ==> deptno 컬럼을 NULL 업데이트 한다.

DELETE (FROM) 테이블명
(WHERE .....)

emp테이블에서 9000번 사번의 데이터(행)를 완전히 삭제
DELETE emp
WHERE empno = 9000;

UPDATE, DELETE절을 실행하기 전에
WHERE절에 기술한 조건으로 SELECT를 먼저 실행하여, 변경, 삭제되는 행을 눈으로 확인 해보자

SELECT *
FROM emp;

DELETE emp
WHERE empno = 7369;

DELETE emp;

SELECT *
FROM emp;



ROLLBACK;

DML 구문 실행시
DBMS는 복구를 위해 로그를 남긴다
즉 데이터 변경 작업 + alpah의 작업량이 필요

하지만 개발 환경에서는 데이터를 복구할 필요가 없기 때문에
삭제속도를 빠르게 하는것이 개발 효율성에서 좋음.

로그없이 테이블의 모든 데이터를 삭제 하는 방법 : TRUNCATE TABLE 테이블명;

DELETE emp;
TRUNCATE TABLE emp;

ROLLBACK;























