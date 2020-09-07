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
실습 12답 : 
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno LIKE ('78%');
    
실습 13 (LIKE사용금지)
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno >= '7800'
    AND empno < '7900';

AND, OR 실습 13 답 : 

SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR (empno BETWEEN 78 AND 78,
    OR empno BETWEEN 780 AND 78,
    OR empno BETWEEN 7800 AND 7900);
    
실습 14
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno >= '7800' AND empno < '7900'
    AND hiredate >= TO_DATE('19810601', 'YYYYMMDD');

LIKE : 문자열 매칭

ROWNUM : 1부터 읽어야 된다
        SELECT 절이 ORDER BY 절보다 먼저 실행된다
            ==> ROWNUM을 이용하여 순서를 부여 하려면 정렬 부터 해야한다.
                ==> 인라인뷰( ORDER BY - ROWNUM을 분리)

가상컬럼 ROWNUM 실습 row_1

SELECT *
FROM ( (SELECT ROWNUM rn.*
        FROM empno, ename)
            FROM emp)
WHERE rn BETWEEN 1 AND 5;

가상컬럼 ROWNUM 실습 row_1 답 : 

SELECT ROWNUM rn, empno, ename
FROM emp
WHERE ROWNUM <= 10; --1~10까지라는 의미이다.


가상컬럼 ROWNUM 실습 row_2 : 

SELECT ROWNUM rn, empno, ename
FROM emp
WHERE ROWNUM <= 10; --1~10까지라는 의미이다.


가상컬럼 ROWNUM 실습 row_2 답 : 

SELECT * 
FROM (SELECT ROWNUM rn, empno, ename
        FROM emp)
WHERE rn >= 11 AND rn <= 20;

가상컬럼 ROWNUM 실습 row_3 : 

SELECT * 
FROM (SELECT ROWNUM rn, empno, ename
        FROM emp)
WHERE rn >= 11 AND rn <= 20
ORDER BY ename DESC;

가상컬럼 ROWNUM 실습 row_3 답 : 

ASC :  오름차순
DESC : 내림차순

SELECT * 
FROM (SELECT ROWNUM rn, empno, ename
        FROM
            (SELECT empno, ename
            FROM emp
            ORDER BY ename ASC))
WHERE rn > 10 AND rn <= 20;

Function : 함수
    Single row function
    - 단일 행을 기준으로 작업하고, 행당 하나의 결과를 반호나
    - 특정 컬럼의 문자열 길이 : length(ename)

    Multi row function
    - 여러 행을 기준으로 작업하고, 하나의 결과를 반환
    - 그룹 함수
        count, sum, avg

Function에 character
대소문자
- LOWER : 문자열을 소문자로
- UPPER : 문자열을 대문자로
- INICAP : 첫단어만 대문자로

문자열 조작
- CONCAT : 문자열 결합
- SUBSTR : 문자열에서 일부분 추출(구분문자, 일부 문자만 빼오고 싶을때 )
- LENGTH : 문자열 길이
- INSTR
- LPAD|RPAD
- TRIM
- REPLACE

DUAL table
- sys 계정에 있는 테이블
- 누구나 사용 가능
- DUMMY 컬럼 하나만 존재하며 값은 'X'이며 데이터는 한 행만 존재

- 사용용도
    - 데이터와 관련 없이
        - 함수 실행
        - 시퀀스 실행
    - merge 문에서
    - 데이터 복제시(connect by level)

SELECT *
FROM dual;

ORALCE 함수 분류
*** 1. SINGLE ROW FUNCTION : 단일 행을 작업의 기준, 결과도 한건 반환
2. MULITI ROW FUNCTION : 여러 행을 작업의 기준, 하나의 행을 결과로 반환

dual 테이블
    1. sys 계정에 존재하는 누구나 사용할 수 있는 테이블
    2. 테이블에는 하나의 컬럼, dummy 존재. 값은 X
    3. 하나의 행만 존재
        ***** SIGNLE
SELECT dummy

SELECT empno, ename
FROM emp;

SELECT empno, ename, LENGTH(ename) --LENGTH(ename)이거는 한 행당 글자수가 몇개냐 재는거 즉 사람 이름 길이 알고 싶을 때 사용
FROM emp;

SELECT empno, ename, LENGTH(ename), LENGTH('hello') --LENGTH('hello')는 문자열만 가져다 씀
FROM emp;

SELECT LENGTH('hello')
FROM dual;

★★★★★★★★★SQL 칠거지악★★★★★★★★★
SQL 칠거지악
1. 좌변을 가공하지 말아라 (테이블 컬럼에 함수를 사용하지 말것)
    * 함수 실행 횟수
    * 인덱스 사용관련(추후에)

SELECT ename, LOWER(ename)
FROM emp
WHERE ename = 'smith'; 이렇게 하면 데이터가 하나도 안 나오기 때문에 하면 안된다.

SELECT ename, LOWER(ename)
FROM emp
WHERE LOWER(ename) = 'smith'; //이거는 값이 나오기 위해 실행함 이게 14번 있다면 14번 비교해서 찾음
위에나 아래나 둘다 출력은 같음 다만 위에껄 하면 안됨
SELECT ename, LOWER(ename)
FROM emp
WHERE ename = UPPER('smith'); //UPPER 얻기 위해 한번만 하면됨 그러니 이걸 참고하기

문자열 관련 함수
SELECT CONCAT('Hello', ', World') concat,
        SUBSTR('Hello, World', 1, 5) substr, --이거는 첫번째부터 5번째까지 있는걸 출력하겠다는 의미
        SUBSTR('Hello, World', 5) substr2, --이거는 5번째 부터 시작한다는거다.
        LENGTH('Hello, World') length,
        INSTR('Hello, World', 'W') instr, --이 문장 실행하면 w가 8번째 위치에 있다고 출력된다.
        INSTR('Hello, World', 'o') instr1, --이 문장 실행하면 w가 8번째 위치에 있다고 출력된다.
        INSTR('Hello, World', 'o', 6) instr2, --이렇게 치면 9번째에 있는 o를 찾음
        INSTR('Hello, World', 'o', 5 + 1) instr2, --이렇게 치면 9번째에 있는 o를 찾음
        INSTR('Hello, World', 'o', INSTR('Hello, World', 'o') + 1) instr3, --이렇게 치면 9번째에 있는 o를 찾음
        LPAD('Hello, World', 15, '*') lpad, --이 'Hello Wolrd'를 15문장으로 채우는데 부족한 부분을 왼쪽부터 *로 채운다는 소리이다.
        LPAD('Hello, World', 15) lpad2,
        RPAD('Hello, World', 15, '*') rpad, --이 'Hello Wolrd'를 15문장으로 채우는데 부족한 부분을 오른쪽부터 *로 채운다는 소리이다.
        REPLACE('Hellow, World', 'Hellow', 'Hell') replace,
        TRIM('Hello, World') trim,
        TRIM('     Hello, World     ') trim2, --공백
        TRIM('H' FROM 'Hello, World') trim3 --문자열 앞뒤로 특정 문자 제거
FROM dual;

FUNCTION 숫자 관련 함수
    number
    - 숫자 조작
        - ROUND
            - 반올림
    - TRUNC
        - 내림
    - MOD
        - 나눗셈의 나머지

숫자 관련 함수
ROUND : 반올림 함수
TRUNC : 버림 함수
    ==> 몇번째 자리에서 반올림, 버림을 할지?
        두번째 인자가 0, 양수 : ROUND(숫자, 반올림 결과 자리수)
        두번째 인자가 음수 : ROUND(숫자, 반올림 해야되는 위치)
MOD : 나머지를 구하는 함수

소수점 자리 구분할때
105.544 소수점 자리 구분 해준다면
 1  0  5 . 5 4 4 (여기서 버리기(내림)하는데 0하면 0이후에 있는 것들을 버리라는 소리가 소수점 첫번째부터 버린다는 소리임)
-3 -2 -1 0 1 2 3
그래서 실제로 적용되는 걸 생각해서 적는다면(???)
 1  0  5. 5 4 4 4
-3 -2 -1  0 1 2 3

SELECT ROUND(105.54, 1) round, -- 소수점 두번째 자리에서 반올림
        ROUND(105.55, 1) round2, -- 소수점 두번째 자리에서 반올림
        ROUND(105.55, 0) round3, -- 소수점 첫번째 자리에서 반올림
        ROUND(105.55, -1) round4 -- 일의 자리에서 반올림
FROM dual;

SELECT TRUNC(105.54, 1) trunc, -- 소수점 두번째 자리에서 버리기(내림)
        TRUNC(105.55, 1) trunc2, -- 소수점 두번째 자리에서 버리기(내림)
        TRUNC(105.55, 0) trunc3, -- 소수점 첫번째 자리에서 버리기(내림)
        TRUNC(105.55, -1) trunc4 -- 일의 자리에서 버리기(내림)
FROM dual;

찾아 바꾸기는 Ctrl + R이다.

mod 나머지 구하는 함수
피제수 - 나눔을 당하는 수, 제수 - 나누는수
a / b = c
a : 피제수
b : 제수

10을 3으로 나눴을 때의 몫을 구하기
SELECT mod(10, 3), 10*3, 10/3,
    TRUNC(10/3, 0) trunc --반올림 하면 올라갈 수 있으니 버리는(내림) trunc 쓰기
FROM dual;

날짜 관련 함수
문자열 ==> 날짜 타입 TO_DATE
SYSDATE : 오라클 서버의 현재 날짜, 시간을 돌려주는 특수함수
            함수의 인자가 없다
            (java
            public void test() {
            }
            test();
            
            SQL
            length('Hello, World'
            SYSDATE;
            )

SELECT SYSDATE
FROM dual;

날짜 타입 +- 정수 : 날짜에서 정수만큼 더한(뺀) 날짜
하루 = 24
1일 24h
1/24일 = 1h
1/24/60 = 1m
1/24/60/60 = 1s
emp hiredate +5, -5

fn1j
날짜를 어떻게 표현할까?
java : java.util.Date
sql : nsl 포맷에 설정된 문자열 형식을 따르거나
        ==> 툴 때문일수도 있음 예측하기 힘듬.
        TO_DATE 함수를 이용하여 명확하게 명시
        TO_DATE('날씨 문자열', '날짜 문자열 형식')

SELECT SYSDATE, SYSDATE + 5, SYSDATE -5
FROM dual;
위 문장처럼 입력하고 하면 날짜를 +5, -5 하겠다는 의미이다.

SELECT SYSDATE, SYSDATE +5,
        SYSDATE + 5 + 1/24 + 1/24/60 + 1/24/60/60, SYSDATE -5,
        SYSDATE - 5 - 1/24 - 1/24/60 - 1/24/60/60
FROM dual;


SELECT TO_DATE('20191231', 'YYYY/MM/DD') lastday, 
        TO_DATE('20191231', 'YYYY/MM/DD')-5 lastday_before5,
        TO_DATE('20191231', 'YYYY/MM/DD')-5 "lastday before5", 
        SYSDATE now, 
        SYSDATE - 3 now_before3,
        SYSDATE - 3 "now before3"
FROM dual;

밑에 문장처럼 입력하면 형식이 맞지않아 오류가 나니 절대로 하면 안된다.
SELECT TO_DATE('20191231', 'YYYY/MM/DD') lastday,
        lastday-5
FROM dual;























   
