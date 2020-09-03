SELECT * | { colum | expression [alias]}

SELECT empno, 'test'
FROM emp;

DESC emp;

테이블의 구조(컬럼명, 데이터타입) 확인하는 방법
1. DESC 테이블명 : DESCRIBE
2. 컬럼 이름만 알 수 있는 방법(데이터 타입은 유추)
    SELECT *
    FROM 테이블명;
3. 툴에서 제공하는 메뉴 이용
    접속 정보 - 테이블 - 확인 하고자하는 테이블 클릭

SELECT 절 : 컬럼을 제한

*************매우 중요****************
WHERE 절 : 조건에 만족하는 행들만 조회되도록 제한 (행을 제한)
    ex ) sal 컬럼의 값이 1500보다 큰 사람들만 조회 ==> 7명

★WHERE절에 기술된 조건을 참(TRUE)으로 만족하는 행들만 조회가 된다.★

조건 연산자
    동등 비교(equal)
        java : int a = 5;
                primitive type : == ex )a == 5,
                object : "+".equals("-")
        sql : sal = 1500

        not equal
            java : !=
            sql : !=, <>
    
    대입연산자
        java :          =
        pl/sql :        : =

users테이블에는 총 5명의 캐릭터가 등록이 되어있는데
그중에서 userid 컬럼의 값이 'brown'인 행만 조회되도록 WHERE절에 조건을 기술

SELECT userid, usernm, alias, reg_dt
FROM users;
위에처럼 검색하면 4개의 컬럼이 검색된다.

SELECT userid, usernm, alias, reg_dt
FROM users
WHERE userid = 'brown'; --brown이라는 글자를 검색할때 ''이걸 붙이지 않으면 brown이라는 컬러명으로 인식하기 때문에 조심해야한다.

SQL은 대소문자를 가리지 않는다. : 키워드, 테이블명, 컬럼명
데이터는 대소문자를 가린다

SELECT userid, usernm, alias, reg_dt
FROM users
WHERE userid = 'BROWN';
그래서 위에처럼 검색하면 BROWN이라는 글자가 없기 때문에 나오지 않는다.


SELECT userid, usernm, alias, reg_dt
FROM users
WHERE 1 = 1;
위에 문장 WHERE 1 = 1; 이라는 의미는 참이라는 의미라서 5개의 컬럼이 모두 나온다.
다만 WHERE 1 = 2;라고 하면 항상 거짓이라는 의미이기 때문에 데이터값이 나오지 않는다.

emp테이블에서 부서번호(deptno)가 30보다 크거나 같은 사원들만 조회
컬럼은 모든 컬럼 조회

SELECT *
FROM emp
WHERE deptno >= 30;

날짜 비교
1982년 01월 01일 이후에 입사한 사람들만 조회(이름, 입사일자)
dhiredate type : date
문자 리터럴 표기법 : '문자열'
숫자 리터럴 표기법 : 숫자
날짜 리터럴 표기법 : 항상 정해진 표기법이 아니다. 서버 설정마다 다르다.
                    한국 : yy/mm/dd(년도/월/일)
                    서양권 : mm/dd/yy
날짜 리터럴 결론 : 문자열 형태로 표현하는 것이 가능하나 서버 설정마다
                다르게 해석할 수 있기 때문에 서버 설정과 관계없이 
                ★동일하게 해석할 수 있는 방법으로 사용★                    
                ★TO_DATE('날짜문자열', '날짜문자열형식')★
                    : 문자열 ==> 날짜 타입으로 변경
                    
년도 : yyyy
월 : mm
일 : dd

SELECT ename, hiredate
FROM emp
WHERE hiredate >= '82/01/01';
위 말고

SELECT ename, hiredate
FROM emp
WHERE hiredate >= TO_DATE('1982/01/01', 'yyyy/mm/dd');
서벌 설정 문제로 인해 검색이 안되는데
'1111/11/11' 이렇게 적어도 뒤에 , 하고 'yyyy/mm/dd' 적어줘야 위에처럼 검색이 된다.

도구에 환경설정에 들어가서 데이터 베이스에 NLS의 날짜형식에 YYYY/MM/DD HH24:MI:SS 이렇게 고쳐주면 년도부터 초까지 나온다.

BETWEEN AND 연산자
WHERE 비교대상 BETWEEN 시작값 AND 종료값
비교대상의 값이 시작값과 종료값 사이에 있을 때 참(TRUE)으로 인식
(시작값과, 종료값을 포함 비교대상 >= 시작값, 배교대상 <= 종료값)

emp테이블에서 sal 컬럼의 값이 1000이상 2000이하인 사원들의 모든 컬럼을 조회

BETWEEN 이용한 풀이
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000;

비교 연산자를 이용한 풀이
SELECT *
FROM emp
WHERE sal >= 1000
   AND sal <= 2000;

조건에 맞는 데이터 조회하기(BETWEEN...AND...실습 where1)

emp 테이블에서 입사 일자가 1982년 1월 1일 이후부터 1983년 1월 1일 이전인 사원의 ename, hiredate 데이터를 조회하는 쿼리를 작성하시오.

SELECT ename, hiredate 
FROM emp
WHERE hiredate BETWEEN TO_DATE('1982/01/01', 'yyyy/mm/dd')
                    AND TO_DATE('1983/01/01', 'yyyy/mm/dd');


SELECT ename, hiredate 
FROM emp
WHERE hiredate BETWEEN TO_DATE('19820101', 'YYYYMMDD')
                    AND TO_DATE('19830101', 'YYYYMMDD');

조건에 맞는 데이터 조회하기(>=, >, <=, < 실습 where2)

emp 테이블에서 입사 일자가 1982년 1월 1일 이후부터 1983년 1월 1일 이전인 사원의 ename, hiredate 데이터를 조회하는 쿼리를 작성하시오.
단 연산자는 비교연산자를 사용한다.

SELECT ename, hiredate 
FROM emp
WHERE hiredate >= TO_DATE('19820101', 'YYYYMMDD')
                    AND hiredate <= TO_DATE('19830101', 'YYYYMMDD');

★날짜형태는 꼭 이렇게 해주기 TO_DATE('20200903', 'YYYYMMDD')★

IN 연산자
특정 값이 집합(여러개의 값을 포함)에 포함되어 있는지 여부를 확인
WHERE 비교대상 IN (값1, 값2....)
==> 비교대상이 값1 이거나(=)
    비교대상이 값2 이거나(=)
        
WHERE 비교대상 = 값1
    OR 비교대상 = 값2

emp 테이블에서 사원이 10번 부서 혹은 30번 부서에 속한 사원들 정보를 조회(모든 컬럼)

SELECT *
FROM emp
WHERE deptno IN (10, 30);

AND ==> 그리고
OR ==> 또는

조건1 AND 조건2 ==> 조건1과 조건2를 동시에 만족
조건1 OR 조건2 ==> 조건1을 만족하거나, 조건2를 만족하거나
                조건1과 조건2를 동시 만족하거나


SELECT *
FROM emp
WHERE deptno = 10
    OR deptno = 30;

SELECT *
FROM users;

where3
users 테이블에서 userid가 brown, cony, sally인 데이터를 조회

SELECT userid "아이디", usernm "이름", alias "별명"
FROM users
WHERE userid IN ('brown', 'cony', 'sally');

★ WHERE userid IN (brown, cony, sally);이게 잘못됬는데 이유는 ★
(brown, cony, sally) 이게 내용이 아니고 컬럼으로 인식되서 생긴 문제이다 
그래서 ('brown', 'cony', 'sally') 이렇게 해줘야한다.

OR를 쓴다면

SELECT userid "아이디", usernm "이름", alias "별명"
FROM users
WHERE userid = 'brown'
    OR userid = 'cony'
    OR userid = 'sally';
★OR도 같은 경우다 ''이거를 빼먹고 한다면 컬럼으로 인식되기 때문에 조심해야한다.★

LIKE 연산자 : 문자열 매칭
WHERE userid = 'brown'
userid가 b로 시작하는 캐릭터만 조회
% : 문자가 없거나, 여러개의 문자열
_ : 하나의 임의의 문자

SELECT *
FROM emp
WHERE ename LIKE 'S%';
위의 문장 해석하자면 컬럼 ename에서 대문자 S로 시작하는 는걸 찾는거다.

SELECT *
FROM emp
WHERE ename LIKE 'W___'; 

위에 문장은 ename이 W로 시작하고 이어서 3개의 글자가 있는 사원을 의미한다.
그래서 조회하면 WARD 하나 조회되늰데 만약 _이거 3개중 2개로 줄이고 검색하면 안뜬다.

조건에 맞는 데이터 조회하기 (LIKE, %, _ 실습 where4)
member 테이블에서 회원의 성이 [신]씨인 사람의 mem_id, mem_name을 조회하는 쿼리를 작성하시오.

SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '신%';

조건에 맞는 데이터 조회하기(LIKE, %,_ 실습 where5)

member 테이블에서 회원의 이름에 글자[이]가 들어가는 모든 사람의 mem_id, mem_name을 조회하는 쿼리를 작성하시오.

SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '%이%';

위에 문장처럼 한글자가 포함된 모든것을 찾는다면 %이%라고 써서 이가 포함된 모든 글자를 찾는다고 보면된다.

SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '%희';

%뒤에 예를들어 %희 라고 적고 검색하면 끝에 글자가 희라고 검색되는걸 찾는다.

SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '_이'
    OR mem_name LIKE '__이'
    OR mem_name LIKE '___이'
    OR mem_name LIKE '____이'
    OR mem_name LIKE '_____이'
    OR mem_name LIKE '______이'
    OR mem_name LIKE '_______이';
위에꺼는 무식한 방법이니 비추한다.

Sourcetree로 github에 원격으로 올릴때 조심해야할점이 있는데
취소나 패기 이런게 없어서 꼬여서 문제가 생길 수 있으니 함부로 건들지 말자





















