SELECT *
FROM emp

SELECT *
FROM dual;

1.PRIMARY KEY -  NOT NULL + UNIQUE
2. FK : FOREIGN KEY
3. NOT NULL
4. UNIQUE
5. CHECK

SQL실습때 낼 문제
foreign와 pk?

PRIMARY KEY : PK_테이블명
FOREIGN KEY : FK_소스테이블명_참조테이블명

제약조건 삭제
ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명;

1.부서 테이블에 PRIMARY KEY 제약조건 추가
2. 사원 테이블에 PRIMARY KEY 제약조건 추가
3. 사원 테이블-부서테이블간 FOREIGN KEY 제약조건 추가

제약조건 삭제시는 데이터 입력과 반대로 자식부터 먼저 삭제
3 - (1, 2)

ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명;

ALTER TABLE emp_test DROP CONSTRAINT FK_emp_test_dept_test;
ALTER TABLE dept_test DROP CONSTRAINT PK_dept_test;
ALTER TABLE emp_test DROP CONSTRAINT PK_emp_test;


SELECT *
FROM user_constraints
WHERE table_name IN ('EMP_TEST', 'DEPT_TEST');


제약조건
1. dept_test 테이블의 deptno컬럼에 PRIMARY KEY 제약 조건 추가
2. emp_test 테이블의 empno컬럼에 PRIMARY KEY 제약 조건 추가
3. emp_test 테이블의 deptno컬럼이 dept_test 컬럼의 deptno컬럼을
    참조하는 FOREIGN KEY 제약 조건 추가

ALTER TABLE dept_test ADD CONSTRAINT pk_dept_test PRIMARY KEY (deptno);

ALTER TABLE emp_test ADD CONSTRAINT pk_emp_test PRIMARY KEY (empno);

ALTER TABLE emp_test ADD CONSTRAINT fk_emp_test_dept_test 
    FOREIGN KEY (deptno) REFERENCES dept_test (deptno);


SELECT *
FROM user_constraints
WHERE table_name IN ('EMP_TEST', 'DEPT_TEST');

제약조건 활성화-비활성화 테스트
테스트 데이터 준비 : 부모-자식 관계가 있는 테이블에서는 부모 테이블에 데이터를 먼저 입력
dept_test ==> emp_test
INSERT INTO dept_test VALUES (10, 'ddit');

dept_test와 emp_test 테이블간 FK가 설정되어 있지만 10번 부서는
dept_test에 존재하기 때문에 정상입력
INSERT INTO emp_test VALUES (9999, 'brown', 10);

20번 부서는 dept_test 테이블에 존재하지 않는 데이터이기 때문에 
FK에 의해 입력불가
INSERT INTO emp_test VALUES (9998, 'sally', 20);

FK를 비활성화 한후 다시 입력

SELECT *
FROM user_constraints
WHERE table_name IN ('EMP_TEST', 'DEPT_TEST');


ALTER TABLE emp_test DISABLE CONSTRAINT FK_emp_test_dept_test;
INSERT INTO emp_test VALUES (9998, 'sally', 20);

dept_test : 10
emp_test : 9999(99) 10, 9998(98) 20 ==> 10, NULL, 삭제

FK 제약조건 재 활성화
ALTER TABLE emp_test ENABLE CONSTRAINT FK_emp_test_dept_test;

테이블, 컬럼 주석(comments) 생성가능
테이블 주석 정보확인
SELECT *
FROM user_tab_comments;


테이블 주석 작성 방법
COMMENT ON TABLE 테이블명 IS '주석';

EMP 테이블에 주석(사원) 생성하기;
COMMENT ON TABLE emp IS '사원';

SELECT *
FROM user_tab_comments;

컬럼 주석 확인
SELECT *
FROM user_col_comments
WHERE TABLE_NAME = 'EMP';

컬럼 주석 다는 문법
COMMENT ON COLUMN .컬러명 IS '주석';


COMMENT ON COLUMN emp.EMPNO IS '사번';
COMMENT ON COLUMN emp.ENAME IS '사원이름';
COMMENT ON COLUMN emp.JOB IS '담당역할';
COMMENT ON COLUMN emp.MGR IS '매니저 사번';
COMMENT ON COLUMN emp.HIREDATE IS '입사일자';
COMMENT ON COLUMN emp.SAL IS '급여';
COMMENT ON COLUMN emp.COMM IS '성과급';
COMMENT ON COLUMN emp.DEPTNO IS '소속부서번호';

SELECT *
FROM user_col_comments
WHERE TABLE_NAME = 'EMP';

DDL(Table-comments 실습 comment1)
답 : 
SELECT *
FROM user_tab_comments t, user_col_comments c
WHERE t.table_name = c.table_name
    AND t.table_name IN ('CYCLE', 'CUSTOMER', 'PRODUCT', 'DAILY')
    AND c.table_name IN ('CYCLE', 'CUSTOMER', 'PRODUCT', 'DAILY');

--위에 WHERE에 있는 AND 부분은 하나만 써도 됨


SELECT *
FROM user_tab_comments

SELECT *
FROM user_col_comments


SELECT table_name, table_type, tab_comment, column_name, col_comment
FROM customer cu, product p, cycle cy, daily d
WHERE cu.cid = cy.cid
    AND cu.cid = cy.cid
    AND cu.cid = d.cid
GROUP BY 


SELECT *
FROM user_col_comments
WHERE TABLE_NAME = 'CUSTOMER'
    AND TABLE_NAME = 'PRODUCT'
    AND TABLE_NAME = 'CYCLE'
    AND TABLE_NAME = 'DAILY';


SELECT *
FROM user_col_comments
WHERE TABLE_NAME = 'PRODUCT'


SELECT *
FROM user_col_comments
WHERE TABLE_NAME = 'CYCLE'


SELECT *
FROM user_col_comments
WHERE TABLE_NAME = 'DAILY'

----
SELECT *
FROM user_constraints
WHERE table_name IN ('EMP', 'DEPT');

SELECT *
FROM user_constraints
WHERE table_name IN ('EMP');

ALTER TABLE emp DISABLE CONSTRAINT FK_emp_dept;


200921 과제???
ALTER TABLE dept ADD CONSTRAINT pk_dept PRIMARY KEY (deptno);
ALTER TABLE emp ADD CONSTRAINT pk_emp PRIMARY KEY (empno);
ALTER TABLE emp ADD CONSTRAINT fk_emp_dept 
    FOREIGN KEY (deptno) REFERENCES dept (deptno);
ALTER TABLE emp ADD CONSTRAINT fk_emp_emp
    FOREIGN KEY (mgr) REFERENCES emp (empno);





SELECT *
FROM emp e, dept d
WHERE deptno


SELECT *
FROM emp

SELECT *
FROM dept


CREATE TABLE dept_test (
    deptno NUMBER(2) PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR2(13)
); 

CREATE TABLE emp_test (
    empno NUMBER(4),
    ename VARCHAR2(10),
    deptno NUMBER(2),
    CONSTRAINT FK_emp_test_dept_test FOREIGN KEY(deptno)
    REFERENCES dept_test (deptno) ON DELETE CASCADE
);

VIEW : VIEW는 쿼리이다.(VIEW 테이블은 잘못된 표현)
. 물리적인 데이터를 갖고 있지 않고, 논리적인 데이터 정의 입합이다(SELECT 쿼리)
. VIEW가 사용하고 있는 테이블의 데이터가 바뀌면 VIEW 조회 결과도 같이 바뀐다.
        
문법
CREATE OR REPLACE VIEW 뷰이름 AS
SELECT 쿼리;

emp테이블에서 sal, comm 컬럼 두개를 제외한 
나머지 6개 컬럼으로 v_emp 이름으로 VIEW 생성
CREATE OR REPLACE VIEW v_emp AS
SELECT empno, ename, job, mgr, hiredate, deptno
FROM emp;
위에처럼 작성하면 에러가 나온다.
그래서 계정에 grant줘야한다.

GRANT CONNECT, RESOURCE TO 계정명 :
VIEW에 대한 생성권한은 RESOURCE에 포함되지 않는다.


SELECT *
FROM v_emp;

위와 == 아래 둘다 같다

SELECT *
FROM 
(SELECT empno, ename, job, mgr, hiredate, deptno
 FROM emp);

VIEW는 쿼리다. SELECT qury

emp 테이블에서 10번 부서에 속하는 3명을 지웠기 때문에
아래 view의 조회 결과도 3명이 지워진 11명만 나온다.
SELECT *
FROM v_emp;

ROLLBACK;

LARLARRU 계정에 있는 V_EMP 뷰를 HR 계정에게 조회할 수 있도록 권한 부여
GRANT SELECT ON v_emp TO HR;











