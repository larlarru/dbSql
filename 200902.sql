| : OR
{} : 여러개가 반복
[] : 옵션 - 있을 수도 있고, 없을 수 도 있다.

== SELECT 문법 ==
SELECT * | { column | expression [alias] }
FROM 테이블 이름;

== SQL 실행 방법 ==
1. 실행하려고 하는 SQL을 선택 후 ctr1 + enter;
2. 실행하려는 sql 구문에 커서를 위치시키고 ctrl + enter;

SELECT *
FROM emp;

emp 테이블은 8행으로 이루어져 있고 14개가 있다

SELECT empno, enmae
FROM emp;

위처럼 하면 오류가 나는데 

ORA-00904: "ENMAE": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
18행, 15열에서 오류 발생

가 뜨는데 ORA-00904 가 오류 번호이다.

SELECT empno, ename
FROM emp;

SELECT *
FROM dept;

dept는 3행에 4개로 이루어져있다.

자바언어와 다른점
SQL의 경우 KEY워드의 대소문자를 구분하지 않는다.

그래서 아래 SQL은 정상적으로 실행된다.
select *
from DEPT;

Coding rule
수업시간에는 keyword는 대문자 그 외는 소문자로한다.

실습1 : 

SELECT *
FROM lprod;

SELECT buyer_id, buyer_name
FROM buyer;

SELECT *
FROM cart;

SELECT mem_id, mem_pass, mem_name
FROM member;

연산
SELECT ename, sal + 100
FROM emp;

위에처럼 하는게 연산이다. sal이라는 컬럼?에 100을 더하는것이다.

SELECT 쿼리는 테이블의 데이터에 영향을 주지 않는다.
SELECT 쿼리를 잘못 작성 했다고 해서 데이터가 망가지지 않음.

데이터 타입
DESC 테이블명 (테이블 구조를 확인)
DESC emp;

숫자 + 숫자 = 숫자값
5 + 6 = 11

문자 + 문자 = 문자 =>자바에서는 문자열을 이은, 문자열 결합으로 처리

수학적으로 정의된 개념이 아님
오라클에서 정의한 개념은 날짜에다가 숫자를 일수로 생각하여 더하고 뺀 일자가 결과로 된다.
날짜 + 숫자 = 날짜

hiredate에서 365일 미래의 일자
SELECT ename, hiredate,  hiredate+365, hiredate-365
FROM emp;

우선순위 변경은 ()친다.

이름좀 바꾸고 싶다면 컬러명? 뒤에 바꿀명칭 적던가 아니면
SELECT ename, hiredate,  
    hiredate+365 after_lyear, hiredate-365 before_lyear
FROM emp;

아니면 뒤에다가 AS 하고 바꿀명칭 적으면 된다.
SELECT ename AS emp_name, hiredate,  
    hiredate+365 after_lyear, hiredate-365 before_lyear
FROM emp;

정리하자면 별칭 : 컬럼, expression에 새로운 이름을 부여 
                컬럼 | expression [AS] [컬럼명]
별칭을 부여할 때 주의점
1. 공백이나, 특수문자가 있는경우 더블 쿼테이션으로 감싸줘야한다.
2. 별칭명은 기본적으로 대문자로 취급되지만 소문자로 지정하고 싶으면 더블 쿼테이션을 적용한다.

SELECT ename emp name
FROM emp;
위에처럼 적으면 공백이 있으니 에러난다.
SELECT ename "emp name"
FROM emp;
그래서 위에처럼 고쳐줘야한다.

SELECT ename "emp name", ename emp_no, empno "emp_no2"
FROM emp;
위에처럼 입력하면 ""는 소문자 ""가 들어가지 않는것은 대문자로 나온다.

자바에서 문자열 : "Hello, World"
SQL에서 문자열 : 'Hello, World'

== 매우 중요 ==
NULL : 아직 모르는 값
숫자 타입 : 0이랑 NULL은 다르다.
문자 타입 : ' ' 공백문자와 NULL은 다른다.

**** NULL을 포함한 연산의 결과는 항상 NULL ****
예 :
5 * NULL = NULL
800 + NULL = NULL
800 + 0 = 800

emp 테이블 컬럼 정리
1. empno : 사원번호
2. ename : 사원이름
3. job : (담당)업무
4. mgr : 매니저 사번번호
5. hiredate : 입사일자
6. sal : 급여
7. comm : 성과급
8. deptno : 부서번호

SELECT *
FROM emp;

emp 테이블에서 NULL값을 확인

SELECT ename, sal, comm, sal + comm AS total_sal
FROM emp;
위에처럼 하면 2개의 컬럼 값을 합친 값이 나오는데 하나나로 NULL값이 있으면 NULL이 나온다.

SELECT *
FROM dept;

SELECT userid, usernm, reg_dt, reg_dt + 5
FROM users;

SELECT *
FROM users;

column alias 실습2 :

SELECT prod_id AS id, prod_name AS name
FROM prod;

SELECT lprod_gu, lprod_nm
FROM lprod

SELECT buyer_id AS "바이어아이디", buyer_name AS "이름"
FROM buyer;

여기서 주의할점이 한글할때 ""이거 써줘야한다.
그리고 -- 이거는 주석

select2]

literal : 값 자체
literal 표기법 : 값을 표현하는 방법

숫자 10이라는 값을
java : int a =10;
sql : SELECT empno, 10 --이렇게 하면 10라는 컬럼이 생기고 전부 값이 10으로 채워진다.
        FROM emp;
      
문자 Hello, World 라는 문자 값을
java : String str = "Hello, World";
sql : SELECT empno, 'hello, World'
        FROM emp;
"" 이거는 별칭
SELECT empno, 'hello, World', "Hello, World"
FROM emp;
위에처럼 작성하면 오류가 나는데 이유는

★* | {column | expression [alias]} 즉 위에 문장은 컬럼 뒤에? 별칭이 와야하는데 그게 안왔으면 오류가 나는거다.★

SELECT empno, 'hello, World' h
FROM emp;

컬럼 별칭, expression 별칭, 별칭
그래서 밑에 문장이 오류가 난거다.
SELECT empno, 'hello, World' h, "Hello, World"
FROM emp;
위의 문장에서 'hello, World'는 고정된 문자열이다.

날짜 2020년 9월 2일이라는 날짜 값을..
java : primitive type(원시타입) : 8개 - byte, short, int, long, float, double, char, boolean
                                문자열은 primitive type(원시타입)이 아니며 
                                문자열 ==> String class
                                날짜 ==> Date class
                                
sql : ??

문자열 연산
java 
    "Hello," + "World" ==> "Hello, World"
    "Hello," - "World" : 연산자가 정의되어 있지 않다.
    위에 이걸하면 에러나는데 이러한 이유는 일단 수학적 타입?이 아니고 이러한 개념이 없기 때문이다. 즉 결합 연산
    
python 
        "Hello," * 3 ==> "Hello,Hello,HEllo,"
    
sql ||, CONCAT 함수 ==> 결합 연산
    emp테이블의 ename, job 컬럼이 문자열

CONCAT(문자열1, 문자열2) : 문자열1과 문자열2를 합쳐서
                        만들어진 새로운 문자열을 반환해준다.

ename + " " + job
ename || ' ' || job

SELECT ename || ' ' || job
FROM emp;
위의 문장을 입력하면 공백 포함해서 하나로 합쳐져 나오게 된다.


SELECT ename || ' ' || job,
    CONCAT(ename, ' ')
FROM emp;


SELECT ename || ' ' || job || ' ' || ename
FROM emp;


SELECT ename || ' ' || job,
    CONCAT(ename, ' ')
FROM emp;

SELECT ename || ' ' || job || ' ' ||
    CONCAT(ename, ' ')
FROM emp;

SELECT 
    CONCAT(CONCAT(ename, ' '), job)
FROM emp;

SELECT ename || ' ' || job,
    CONCAT(CONCAT(ename, ' '), job)
FROM emp;

DESC emp;

USER_TABLES : 오라클에서 관리하는 테이블(뷰)
                접속한 사용자가 보유하고 있는 테이블 정보를 관리

SELECT *
FROM user_tables;

SELECT *
FROM user_tables;

Literal Character, Concatenation(문자열 결합 실습 sel_con1)

현재 접속한 사용자가 소유한 테이블 목록을 조회
SELECT table_name 
FROM user_tables;

문자열 결합을 이용하여 다음과 같이 조회 되도록 쿼리를 작성하시오
SELECT 'SELECT' || ' ' ||  '*' || ' ' || table_name || ';' AS QUERY
FROM user_tables;

SELECT 'SELECT' || ' ' ||  '*' || ' ' || table_name || ';' QUERY
FROM user_tables;

SELECT CONCAT(CONCAT(CONCAT(CONCAT(CONCAT('SELECT',' '), '*'), ' '), table_name), ';') AS QUERY
FROM user_tables;

SELECT CONCAT(CONCAT(CONCAT(CONCAT(CONCAT('SELECT',' '), '*'), ' '), table_name), ';') QUERY
FROM user_tables;

위에거는 FROM을 빼먹었음

쉽고 편한법 : 
SELECT 'SELECT * FROM' || ' ' || table_name || ';' AS QUERY
FROM user_tables;

SELECT 'SELECT * FROM' || ' ' || table_name || ';' QUERY
FROM user_tables;

SELECT 'SELECT * FROM' || ' ' || table_name || ';' "QUERY"
FROM user_tables;

SELECT CONCAT(CONCAT(CONCAT('SELECT * FROM', ' '), table_name), ';') AS QUERY
FROM user_tables;

SELECT CONCAT(CONCAT(CONCAT('SELECT * FROM', ' '), table_name), ';') QUERY
FROM user_tables;

SELECT CONCAT(CONCAT(CONCAT('SELECT * FROM', ' '), table_name), ';') "QUERY"
FROM user_tables;




































