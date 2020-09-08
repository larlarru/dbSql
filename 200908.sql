날짜 데이터 : emp.hiredate
            SYSDATE

TO_CHAR(날짜타입, '변경할 문자열 포맷')--문자열로 바꿈
TO_DATE('날짜문자열', '첫번째 인자의 날짜 포맷')
TO_CHAR, TO_DATE 첫번째 인자 값을 넣을 때 문자열인지, 날짜인지 구분

조심할께 DD : 2자리 일자 인데
D : 주간 날짜(1-7) 이다.
IW : 주차(1~53)

현재 설정된 NLS DATE FORMAT : YYYY/MM/DD HH24:MI:SS

SELECT SYSDATE
FROM dual;

밑에처럼 치면 TO_CHAR(SYSDATE, 'DD-MM-YYYY')라는 컬럼이 생기고 날짜-달-년도 이렇게 나온다.
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD-MM-YYYY'), 
            TO_CHAR(SYSDATE, 'D'), TO_CHAR(SYSDATE, 'IW')
FROM dual;

날짜+1한거이다.
SELECT ename, 
        --SUBSTR('20200908', 1, 4) || '/' || SUBSTR('20200908', 5, 6), --1,4는 첫번째 글자부터 4글자 5,2는 5번째부터 6글자
        hiredate, TO_CHAR(hiredate, 'yyyy/mm/dd hh24:mi:ss') h1,
        TO_CHAR(hiredate + 1, 'yyyy/mm/dd hh24:mi:ss') h2, --날짜+1이다.
        TO_CHAR(hiredate + 1/24, 'yyyy/mm/dd hh24:mi:ss') h3, --시간+1이다.
        TO_CHAR(TO_DATE('20200908', 'YYYYMMDD'), 'YYYY/MM/DD') h4 --'20200908' ==> '2020/09/08'로 바꾼거임
FROM emp;

YYYYMMDD ==> YYYY/MM/DD으로 바꾸기 
'20200908' ==> '2020/09/08'
밑에처럼 바꾸며 된다.

SELECT ename, hiredate, 
        TO_CHAR(TO_DATE('20200908', 'YYYYMMDD'), 'YYYY/MM/DD') h4
FROM emp;

날짜 : 일자 + 시분초
2020년 9월 8일 14시 10분 5초 ==> '20200908' ==> 2020년 9월 8일
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD')
FROM DUAL;

WHERE cs_rcv_dt BETWEEN SYSDATE로 하게 되면
2020년 9월 8일 14시 10분 5초 ==> '20200908' ==> 2020년 9월 8일 ==> 2020년 9월 8일 00시 0분 0초로 된다.

Function (date 실습 fin2)
1. 년-월-일
2. 년-월-일 시간(24)-분-초
3. 일-월-년

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') DT_DASH,
        TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24-MI-SS') dt_dash_with_time,
        TO_CHAR(SYSDATE, 'MM-DD-YYYY') dt_dd_mm_yyyy
FROM dual;

Function(date)
date
    - 날짜조작 
        ROUND(DATE, format) --이거 쓸일이 거의 없다
        TRUNC(DATE, format) --이거 쓸일이 거의 없다
        
        MONTHS_BETWEEN(DATE, DATE)
        - 두 날짜 사이의 개월수
        ADD_MONTHS(DATE, NUMBER)
        - NUMBER개월 이후의 날짜
        NEXT_DAY(DATE, weekday)
        - DATE 다음 weekday
        LAST_DAY(DATE)
        - DATE가 속한 월의 마지막 날짜

날짜 조작 함수
MONTHS_BETWEEN(date1, date2) : 두 날짜 사이의 개월수를 반환
                                두 날짜의 일정보가 틀리면 소수점이 나오기 때문에 잘 사용하지 않는다.

***ADD_MONTHS(DATE, NUMBER) : 주어진 날짜에 개월수를 더하거나 뺀 날짜를 반환
                            한달이라는 기간이 월마다 다름 - 직접 구현이 힘듬

ADD_MONTHS(SYSDATE, 5) : 오늘 날짜로부터 5개월 뒤의 날짜는 몇일인가
                            근데 이렇게 할경우 단순히 한달이 30일이라고 하는것도 아니여서 생각보다 정확한 값이 안나온다.


**NEXT_DAY(DATE, NUMBER(주간요일: 1-7)) : DATE이후에 등장하는 첫번째 주간요일을 갖는 날짜
NEXT_DAY(SYSDATE, 5) : SYSDATE이 후에 등장하는 첫번째 금여일에 해당하는 날짜

*****LAST_DAY(DATE) : 주어진 날짜가 속한 월의 마지막 일자를 날짜로 반환
LAST_DAY(SYSDATE) : SYSDATE(2020/09/08)가 속한 9월의 마지막 날짜 : 2020/09/30
                    월마다 마지막 일자가 다르기 때문에 해당 함수를 통해서
                    편하게 마지막 이자를 구할 수 있다.

해당월의 가장 첫 날짜를 반화하는 함수는 없어 ==> 모든 월의 첫 날짜 1일이다
FIRST_DAY

SYSDATE가 혹한 월의 첫 날짜 구하기
        (2020년 9월 8일 ==> 2020년 9월 1일의 날짜 타입으로 어떻게든 구하기)



의도한 답 : 
SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM') || '01', 'YYYYMMDD'),
        --밑에는 의도한 답과 달리 다르게 답을 낸거
        TO_DATE('01', 'DD'), --기본 설정에 의해서 날짜만 01로 바뀌었다.
        ADD_MONTHS( LAST_DAY(SYSDATE), -1) + 1,
        SYSDATE - TO_CHAR(SYSDATE, 'DD') + 1,
        TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM"01"'))
FROM dual;

SELECT MONTHS_BETWEEN( TO_DATE('20200915', 'YYYYMMDD'), TO_DATE('20200808', 'YYYYMMDD')),
        ADD_MONTHS(SYSDATE, 5),
        NEXT_DAY(SYSDATE, 6), --이번주 금요일 해당하는거 찾는거다.
        LAST_DAY(SYSDATE),
        TO_CHAR(SYSDATE, 'YYYYMMDD') || ' ' || TO_CHAR(TO_DATE('20200901', 'YYYYMMDD'), 'YYYYMMDD') " "
FROM dual;

Function (date 실습 fin3)

SELECT : yyyymm
FROM dual;


SELECT : yyyymm param, TO_CHAR( LAST_DAY( TO_DATE( :yyyymm, 'YYYYMM')), 'DD')
FROM dual;

SELECT '202009' param
FROM dual;

SELECT SYSDATE - TO_CHAR(SYSDATE, 'DD'),
        ADD_MONTHS( LAST_DAY(SYSDATE), -1),
        ADD_MONTHS( LAST_DAY(SYSDATE), + 1) - 31,
        TO_CHAR(LAST_DAY(SYSDATE), 'DD') dt,
        --선생님이 의도하신답
        TO_CHAR( LAST_DAY( TO_DATE('202009', 'YYYYMM')), 'DD'),
        TO_CHAR( LAST_DAY( TO_DATE('20208', 'YYYYMM')), 'DD')
FROM dual;

형변환

명시적 형변환
    TO_CHAR, TO_DATE, TO_NUMBER
묵시적 형변환
    .....ORACLE DBMS가 상황에 맞게 알아서 해주는 것
    JAVA시간에 8가지 원시 타입(primitive type) 간 형변환
    1가지 타입이 다른 7가지 타입으로 변환될 수 있는지
    8*7 = 56가지

두가지 가능한 경우
1. empno(숫자)를 문자로 묵시적 형변환
2. '7369'(문자)를 숫자로 묵시적 형변환

*****알면 매우 좋음, 몰라도 수업 진행하는데 문제 없고, 추후 취업해서도 큰 지장은 없음
*****다만 고급 개발자와 일반 개발자를 구분하는 차이점이 됨.

실행계획 : 오라클에서 요청받은 SQL을 처리하기 위한 절차를 수립한 것
실행계획 보는 방법
1. EXPLAIN PLAN FOR
    실행계획을 분석할 SQL;
2. SELECT *
    FROM TABLE(dbms_xplan.display);

실행계획의 operation을 해석하는 방법
1. 위에서 아래로
2. 단 자식노드(들여쓰기가 된 노드)였을 경우 자식부터 실행하고
    본인 노드를 실행

실행계획순서 : 1 -> 0

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno LIKE '78%';

TABLE 함수 : PL/SQL의 테이블 타입 자료형을 테이블로 변환
SELECT *
FROM TABLE(dbms_xplan.display);
dbms_xplan.display 는 dbms_xplan에 있는 display를 애기하는거다.
dbms_xplan = java.lang

java의 class full name : 패키지명.클래스명
java : String class : java.lang.String


Plan hash value: 3956160932
 
--------------------------------------------------------------------------
| Id  | Operation         | Name | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |      |     3 |   261 |     3   (0)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| EMP  |     3 |   261 |     3   (0)| 00:00:01 | -- 여기*는 내가 찾는 정보?가 있는곳
--------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter(TO_CHAR("EMPNO") LIKE '78%') --이거 필터링 했다는 의미이다
 
Note
-----
   - dynamic sampling used for this statement (level=2)

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno LIKE '7369';

Plan hash value: 3956160932
 
--------------------------------------------------------------------------
| Id  | Operation         | Name | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |      |     1 |    87 |     3   (0)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| EMP  |     1 |    87 |     3   (0)| 00:00:01 |
--------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter(TO_CHAR("EMPNO")='7369')
 
Note
-----
   - dynamic sampling used for this statement (level=2)

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE TO_CHAR(empno) = '7369';

SELECt *
FROM TABLE(dbms_xplan.display);

Plan hash value: 3956160932
 
--------------------------------------------------------------------------
| Id  | Operation         | Name | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |      |     1 |    87 |     3   (0)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| EMP  |     1 |    87 |     3   (0)| 00:00:01 |
--------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter(TO_CHAR("EMPNO")='7369')
 
Note
-----
   - dynamic sampling used for this statement (level=2)

읽는순서 : 2-3-1-0로 읽는 경우도 있다.
        3-5-4-2-6-1-0 이 이런 경우는 위에서 아래로 자식여부로 판단하는데 3번경우 자식이 없어서 3번부터 하는거고
                        그다음에 다시 자식여뷰 따지다가 5번에는 자식여부가 없어서 가듬에 5번 그다음에 40201뭐이렇게 이ㅓㅇ진다.
SELECT보다 WHERE절이 중요하다.

1600 ==> 1,600 이 보기가 좋은데1,600은 숫자가 아니다.

숫자를 문자로 포맷팅 : DB보다는 국제화(i18n) Internationalization에서 더 많이 활용 --소프트웨어 국제화(i18n) il8n ==>i와n사이에 18개의 알파벳을 의미
SELECT empno, ename, sal
FROM emp;
SELECT empno, ename, sal, TO_CHAR(sal, '9,999') --4자리로 표현한다. 3자리 예를들어 999 하면 4자리인 숫자들이 #로 바뀐다.
FROM emp;


SELECT empno, ename, sal, TO_CHAR(sal, '009,999L') -- '009,999L' 하면 6자리 돈단위 찍는거다?
FROM emp;

함수
    문자열
    날짜
    숫자
    null과 관련된 함수 : 4가지 (다 못외워도 괜찮음, (실무에서)한가지를 주로 사용)
    오라클의 NVL 함수와 동일한 역할을 하는 MS-SQL SERVER의 함수 이름?

NULL의 의미 ? 아직 모르는 값, 할당되지 않은 값
            0과, '' 문자와는 다르다(''는 공백 문자)
NULL의 특징 : NULL을 포함한 연산의 결과는 항상 NULL

sal 컬럼에는 null이 없지만, comm에는 4개의 행을 제외하고 10개의 행이 null값을 갖는다.
SELECT ename, sal, comm, sal+comm
FROM emp;

NULL과 관련된 함수
1. NVL(컬럼 || 익스프레션, 컬럼 || 익스프레션)
   NVL(expr1, expr2)
   
   --if( expr1 == null)
    --return expr2;
   if( expr1 == null)
    System.out.println(expr2);
   else
    System.out.println(expr1);

SELECT empno, comm, NVL(comm, 0) --NVL(comm, 0)이거는 2번째?가 나온다.
FROM emp;

SELECT ename, sal, comm, sal+comm, NVL(comm, 0), sal + NVL(comm, 0)
FROM emp;













