/* 사용자 */
CREATE TABLE USERS (
	USER_ID VARCHAR2(50) NOT NULL, /* 아이디 */
	PASSWORD VARCHAR2(50) NOT NULL, /* 패스워드 */
	COL NUMBER NOT NULL, /* 전화번호 */
	ADM VARCHAR2(255) NOT NULL, /* 주소 */
	BIR DATE NOT NULL, /* 생년월일 */
	nick VARCHAR2(50) /* 닉네임 */
);

COMMENT ON TABLE USERS IS '사용자';

COMMENT ON COLUMN USERS.USER_ID IS '아이디';

COMMENT ON COLUMN USERS.PASSWORD IS '패스워드';

COMMENT ON COLUMN USERS.COL IS '전화번호';

COMMENT ON COLUMN USERS.ADM IS '주소';

COMMENT ON COLUMN USERS.BIR IS '생년월일';

COMMENT ON COLUMN USERS.nick IS '닉네임';

CREATE UNIQUE INDEX PK_USERS
	ON USERS (
		USER_ID ASC
	);

ALTER TABLE USERS
	ADD
		CONSTRAINT PK_USERS
		PRIMARY KEY (
			USER_ID
		);

/* 업체 */
CREATE TABLE COMPANY (
	COMNO NUMBER NOT NULL, /* 업체번호 */
	COMNM VARCHAR2(50) NOT NULL, /* 업체이름 */
	LOC VARCHAR2(255) NOT NULL, /* 업체위치 */
	CATNO NUMBER NOT NULL, /* 카테고리번호 */
	USER_ID VARCHAR2(50) NOT NULL, /* 아이디 */
	DELRANGE VARCHAR2(4000) NOT NULL, /* 배달범위 */
	COMCOL NUMBER NOT NULL /* 전화번호 */
);

COMMENT ON TABLE COMPANY IS '업체';

COMMENT ON COLUMN COMPANY.COMNO IS '업체번호';

COMMENT ON COLUMN COMPANY.COMNM IS '업체이름';

COMMENT ON COLUMN COMPANY.LOC IS '업체위치';

COMMENT ON COLUMN COMPANY.CATNO IS '카테고리번호';

COMMENT ON COLUMN COMPANY.USER_ID IS '아이디';

COMMENT ON COLUMN COMPANY.DELRANGE IS '배달범위';

COMMENT ON COLUMN COMPANY.COMCOL IS '전화번호';

CREATE UNIQUE INDEX PK_COMPANY
	ON COMPANY (
		COMNO ASC
	);

ALTER TABLE COMPANY
	ADD
		CONSTRAINT PK_COMPANY
		PRIMARY KEY (
			COMNO
		);

/* 리뷰 */
CREATE TABLE REVIEW (
	RENO NUMBER NOT NULL, /* 리뷰번호 */
	RESENTENCE VARCHAR2(4000), /* 리뷰내용 */
	SCORE NUMBER, /* 평점 */
	COMNO NUMBER NOT NULL, /* 업체번호 */
	USER_ID VARCHAR2(50) NOT NULL /* 아이디 */
);

COMMENT ON TABLE REVIEW IS '리뷰';

COMMENT ON COLUMN REVIEW.RENO IS '리뷰번호';

COMMENT ON COLUMN REVIEW.RESENTENCE IS '리뷰내용';

COMMENT ON COLUMN REVIEW.SCORE IS '평점';

COMMENT ON COLUMN REVIEW.COMNO IS '업체번호';

COMMENT ON COLUMN REVIEW.USER_ID IS '아이디';

CREATE UNIQUE INDEX PK_REVIEW
	ON REVIEW (
		RENO ASC
	);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT PK_REVIEW
		PRIMARY KEY (
			RENO
		);

/* 카테고리 */
CREATE TABLE CATEGORY (
	CATNO NUMBER NOT NULL, /* 카테고리번호 */
	CATNM VARCHAR2(50) NOT NULL /* 카테고리이름 */
);

COMMENT ON TABLE CATEGORY IS '카테고리';

COMMENT ON COLUMN CATEGORY.CATNO IS '카테고리번호';

COMMENT ON COLUMN CATEGORY.CATNM IS '카테고리이름';

CREATE UNIQUE INDEX PK_CATEGORY
	ON CATEGORY (
		CATNO ASC
	);

ALTER TABLE CATEGORY
	ADD
		CONSTRAINT PK_CATEGORY
		PRIMARY KEY (
			CATNO
		);

/* 메뉴 */
CREATE TABLE MENU (
	MENO NUMBER NOT NULL, /* 메뉴번호 */
	MENM VARCHAR2(50) NOT NULL, /* 메뉴이름 */
	PRICE NUMBER NOT NULL, /* 가격 */
	COMNO NUMBER NOT NULL /* 업체번호 */
);

COMMENT ON TABLE MENU IS '메뉴';

COMMENT ON COLUMN MENU.MENO IS '메뉴번호';

COMMENT ON COLUMN MENU.MENM IS '메뉴이름';

COMMENT ON COLUMN MENU.PRICE IS '가격';

COMMENT ON COLUMN MENU.COMNO IS '업체번호';

CREATE UNIQUE INDEX PK_MENU
	ON MENU (
		MENO ASC
	);

ALTER TABLE MENU
	ADD
		CONSTRAINT PK_MENU
		PRIMARY KEY (
			MENO
		);

/* 주문 */
CREATE TABLE DELIVER (
	DELNO NUMBER NOT NULL, /* 배달번호 */
	USER_ID VARCHAR2(50) NOT NULL, /* 아이디 */
	COMNO NUMBER NOT NULL, /* 업체번호 */
	DELDATE DATE NOT NULL, /* 주문시간 */
	PAYWAY VARCHAR2(50) NOT NULL /* 계산방법 */
);

COMMENT ON TABLE DELIVER IS '주문';

COMMENT ON COLUMN DELIVER.DELNO IS '배달번호';

COMMENT ON COLUMN DELIVER.USER_ID IS '아이디';

COMMENT ON COLUMN DELIVER.COMNO IS '업체번호';

COMMENT ON COLUMN DELIVER.DELDATE IS '주문시간';

COMMENT ON COLUMN DELIVER.PAYWAY IS '계산방법';

CREATE UNIQUE INDEX PK_DELIVER
	ON DELIVER (
		DELNO ASC
	);

ALTER TABLE DELIVER
	ADD
		CONSTRAINT PK_DELIVER
		PRIMARY KEY (
			DELNO
		);

/* 주문메뉴목록 */
CREATE TABLE ORDERMENU (
	MENO NUMBER NOT NULL, /* 메뉴번호 */
	DELNO NUMBER NOT NULL, /* 배달번호 */
	COUNT NUMBER NOT NULL /* 갯수 */
);

COMMENT ON TABLE ORDERMENU IS '주문메뉴목록';

COMMENT ON COLUMN ORDERMENU.MENO IS '메뉴번호';

COMMENT ON COLUMN ORDERMENU.DELNO IS '배달번호';

COMMENT ON COLUMN ORDERMENU.COUNT IS '갯수';

/* 공지사항 */
CREATE TABLE NOTICE (
	NOTICENO NUMBER NOT NULL, /* 공지번호 */
	NOTICE VARCHAR2(4000), /* 공지사항 */
	COMNO NUMBER NOT NULL, /* 업체번호 */
	NODATE DATE NOT NULL /* 작성날짜 */
);

COMMENT ON TABLE NOTICE IS '공지사항';

COMMENT ON COLUMN NOTICE.NOTICENO IS '공지번호';

COMMENT ON COLUMN NOTICE.NOTICE IS '공지사항';

COMMENT ON COLUMN NOTICE.COMNO IS '업체번호';

COMMENT ON COLUMN NOTICE.NODATE IS '작성날짜';

CREATE UNIQUE INDEX PK_NOTICE
	ON NOTICE (
		NOTICENO ASC
	);

ALTER TABLE NOTICE
	ADD
		CONSTRAINT PK_NOTICE
		PRIMARY KEY (
			NOTICENO
		);

ALTER TABLE COMPANY
	ADD
		CONSTRAINT FK_CATEGORY_TO_COMPANY
		FOREIGN KEY (
			CATNO
		)
		REFERENCES CATEGORY (
			CATNO
		);

ALTER TABLE COMPANY
	ADD
		CONSTRAINT FK_USERS_TO_COMPANY
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_COMPANY_TO_REVIEW
		FOREIGN KEY (
			COMNO
		)
		REFERENCES COMPANY (
			COMNO
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_USERS_TO_REVIEW
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);

ALTER TABLE MENU
	ADD
		CONSTRAINT FK_COMPANY_TO_MENU
		FOREIGN KEY (
			COMNO
		)
		REFERENCES COMPANY (
			COMNO
		);

ALTER TABLE DELIVER
	ADD
		CONSTRAINT FK_USERS_TO_DELIVER
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USERS (
			USER_ID
		);

ALTER TABLE DELIVER
	ADD
		CONSTRAINT FK_COMPANY_TO_DELIVER
		FOREIGN KEY (
			COMNO
		)
		REFERENCES COMPANY (
			COMNO
		);

ALTER TABLE ORDERMENU
	ADD
		CONSTRAINT FK_MENU_TO_ORDERMENU
		FOREIGN KEY (
			MENO
		)
		REFERENCES MENU (
			MENO
		);

ALTER TABLE ORDERMENU
	ADD
		CONSTRAINT FK_DELIVER_TO_ORDERMENU
		FOREIGN KEY (
			DELNO
		)
		REFERENCES DELIVER (
			DELNO
		);

ALTER TABLE NOTICE
	ADD
		CONSTRAINT FK_COMPANY_TO_NOTICE
		FOREIGN KEY (
			COMNO
		)
		REFERENCES COMPANY (
			COMNO
		);
        
        
        
SELECT *
FROM REVIEW;
DESC review;

ALTER TABLE review
MODIFY (redate NOT NULL);


ALTER TABLE review
ADD (redate DATE);

COMMIT;

SELECT *
FROM category;
DESC category;

SELECT *
FROM notice;
DESC notice;


SELECT *
FROM MENU;
DESC MENU;

SELECT *
FROM Company;

DESC Company;

ALTER TABLE company
DROP COLUMN user_id;

commit;

SELECT *
FROM menu;
DESC menu;


SELECT *
FROM category;
DESC category;

INSERT INTO category values(1, '분식');
INSERT INTO category values(2, '카페*디저트');
INSERT INTO category values(3, '돈까스*회*일식');
INSERT INTO category values(4, '치킨');
INSERT INTO category values(5, '피자');
INSERT INTO category values(6, '아시안*양식');
INSERT INTO category values(7, '중국집');
INSERT INTO category values(8, '족발*보쌈');
INSERT INTO category values(9, '야식');
INSERT INTO category values(10, '찜*탕');
INSERT INTO category values(11, '도시락');
INSERT INTO category values(12, '패스트푸드');

SELECT *
FROM Company;
DESC Company;


INSERT INTO Company values(1, '분식a', '위치a', 1, '배달범위a', '01011112222');
INSERT INTO Company values(2, '분식b', '위치b', 1, '배달범위b', '01033334444');
INSERT INTO Company values(3, '분식c', '위치c', 1, '배달범위c', '01055556666');

COMMIT;

SELECT *
FROM users;


SELECT *
FROM review;
DESC review;

COMMIT;

INSERT INTO review values(1, 'test댓글', 5, 1, 'test', SYSDATE, '');
INSERT INTO review values(2, '1번째의 1번째 댓댓글', 4, 1, 'test', SYSDATE, 1);
INSERT INTO review values(3, '1번째의 2번째 댓댓글', 3, 1, 'test', SYSDATE, 1);
INSERT INTO review values(4, '2번째의 댓글', 1, 1, 'test', SYSDATE/*REDATE*/, '');

INSERT INTO review values(5, '2번째의 1번째 댓댓글', 1, 1, 'test', SYSDATE, 4);
INSERT INTO review values(6, '2번째의 2번째 댓댓글', 1, 1, 'test', SYSDATE, 4);

INSERT INTO review values(7, '3번째의 댓글', 1, 1, 'test', SYSDATE, '');
INSERT INTO review values(8, '3번째의 1첫번째 댓댓글', 1, 1, 'test', SYSDATE, 7);


INSERT INTO review values(9, '3번째의 2번째 댓댓글', 1, 1, 'test', SYSDATE, 7);

INSERT INTO review values(10, '3번째의 3번째 댓댓글', 1, 1, 'test', SYSDATE, 7);

/*ALTER TABLE review
ADD (rereno number);*/
DELETE review;

--parent_seq 부분이 어디 댓글에 달았는지 구별
SELECT seq, LPAD(' ', (LEVEL-1)*3) || title title
FROM board_test
START WITH parent_seq IS NULL
CONNECT BY PRIOR seq = parent_seq;

SELECT *
FROM review;
DESC review;
,
        score, comno, user_id, redate, rereno;
/*밑에 댓글/댓댓글 완료*/       
SELECT reno, LPAD(' ', (LEVEL-1)*3) || resentence
FROM REVIEW
START WITH rereno IS NULL
CONNECT BY PRIOR reno = rereno
ORDER SIBLINGS BY reno DESC;

DESC review;
SELECT *
FROM review
ORDER BY redate;

COMMIT;

ORDER BY rereno DESC, redate DESC

ORDER

SELECT a.reno, LPAD(' ', (LEVEL-1)*3) || a.resentence resentence
FROM (SELECT rereno, resentence, score, user_id, redate
        FROM REVIEW
        ORDER BY rereno DESC, redate DESC) a
START WITH a.rereno IS NULL
CONNECT BY PRIOR a.reno = a.rereno;

order sibinings BY


select reno, LPAD(' ', (LEVEL-1)*3) || a.resentence resentence
from(
SELECT reno, LPAD(' ', (LEVEL-1)*3) || resentence resentence,
        score, user_id, redate
FROM REVIEW
START WITH rereno IS NULL
CONNECT BY PRIOR reno = rereno
ORDER BY rereno DESC, redate DESC) a
START WITH a.reno IS NULL
CONNECT BY PRIOR reno = a.reno;

select COUNT(A.comno)
from company A LEFT OUTER JOIN CATEGORY B ON B.catno = A.catno
WHERE B.catno = 1;

SELECT *
FROM category;



SELECT A.COMNM, ROUND(AVG(C.SCORE),2)
FROM COMPANY A LEFT OUTER JOIN CATEGORY B ON B.CATNO = A.CATNO 
                LEFT OUTER JOIN REVIEW C ON A.COMNO = C.COMNO 
                 
GROUP BY A.COMNM 
ORDER BY AVG(SCORE) DESC;

SELECT *
FROM company;


SELECT choose
FROM users
WHERE user_id = 'test'
AND password = 1234;



SELECT *
FROM DELIVER;
WHERE delcheck = '확인';

SELECT DELNO, DELDATE, DELCHECK "
				+ "FROM DELIVER "
				+ "WHERE DELCHECK = '미확인'

DELETE FROM deliver where delcheck = '2';

COMMIT;

UPDATE DELIVER SET delcheck = '확인' WHERE delno = 1;

Update Tbl Set Tbl.N = Tbl.N+1

UPDATE deliver set delcheck = 'N';

DESC deliver;

INSERT INTO DELIVER values(1, 'test', 1, SYSDATE, '카드', '미확인');
INSERT INTO DELIVER values(2, 'test', 1, SYSDATE, '카드', '미확인');
INSERT INTO DELIVER values(3, 'test', 2, SYSDATE, '현금', '미확인');
INSERT INTO DELIVER values(4, 'test', 3, SYSDATE, '카드', '확인');
INSERT INTO DELIVER values(5, 'test', 3, SYSDATE, '카드', '확인');

SELECT delno, deldate, delcheck
FROM deliver;


ALTER TABLE deliver
update (delcheck char(1));

ALTER TABLE

COMMIT;
/*주문번호입력*/
/*주문메뉴목록 : 메뉴번호, 주문번호, 갯수*/
SELECT *
FROM ordermenu;

DESC ordermenu;

INSERT INTO ORDERMENU values(1, 1, 1);

/*메뉴 : 메뉴번호, 메뉴이름, 가격, 업체번호*/
SELECT *
FROM MENU;
DESC MENU;

SELECT *
FROM ORDERMENU;
DESC ORDERMENU;
COMMIT;
rollback;


/*자동주문번호*/
SELECT NVL(MAX(delno),0)+1
FROM deliver;

/*주문추가*/
INSERT INTO ORDERMENU VALUES(1, 1, 1, 'test');
INSERT INTO ORDERMENU(COUNT) VALUES(1) WHERE  = 1;

/*같은 메뉴 추가*/
UPDATE ORDERMENU SET COUNT = COUNT+1 WHERE meno = 1 AND delno = 1;

/*나중에 메뉴선정 끝나면 주문에다가추가*/
INSERT INTO DELIVER VALUES(?, USER_ID, COMNO, DELDATE, PAYWAY, DELCHECK);

DESC deliver;

SELECT meno, menm, price
FROM menu
WHERE comno = 1;

SELECT *
FROM ordermenu;

SELECT adm
FROM users;


UPDATE ORDERMENU SET COUNT = COUNT + 1 WHERE meno = 1 AND delno = 1;

commit;

ALTER TABLE ORDERMENU
ADD (oradm varchar2(255));

INSERT INTO MENU values(1, '떡볶이', 1000, 1);

SELECT *
FROM company;
DESC company;

ALTER TABLE company
ADD (sal number);

SELECT *
FROM ordermenu;
DESC ordermenu;


DELETE ordermenu;

INSERT INTO ordermenu values(2, 1, 1, 'test주소');
INSERT INTO ordermenu values(3, 1, 1, 'test주소');
INSERT INTO ordermenu values(4, 1, 1, 'test주소');

SELECT *
FROM menu;
DESC menu;

INSERT INTO MENU values(2, '김말이튀김', 1000, 1);
INSERT INTO MENU values(3, '모둠떡뽁이 세트', 5000, 1);
INSERT INTO MENU values(4, '모둠튀김 세트', 3000, 1);

COMMIT;

SELECT TITLE FROM TB_JDBC_BOARD WHERE = '안녕하세요';


SELECT *
FROM deliver;

DELETE deliver;

SELECT *
FROM ordermenu;

INSERT INTO ORDERMUNU VALUES(?, ?, 1);

/*자동주문번호*/
SELECT NVL(MAX(delno),0)+1
FROM deliver;

COMMIT;

SELECT *
FROM dept_test;
DESC dept_test;

deptno

SELECT *
FROM emp_test;
DESC emp_test;


SELECT *
FROM ordermenu;

DESC ordermenu;

INSERT INTO ORDERMENU VALUES(SELECT NVL(MAX(meno),0)+1 FROM ordermenu, 1);

SELECT NVL(MAX(meno),0)+1
FROM ordermenu;

empno, dname, job, mgr, hiredate, sal, comm, deptno
deptno, dname, loc

/*2개 테이블 추가 예시*/
INSERT ALL
    INTO dept_test VALUES(1, '중복test', '중복test')
    INTO emp_test VALUES(1111, 'test', 'test', 1111, sysdate, 1000, 1, 50)
    SELECT *
    FROM dual;

INSERT ALL INTO emp_test
            INTO emp_test2
SELECT 9999, 'brown' FROM dual UNION ALL
SELECT 9999, 'sally' FROM dual;

INSERT ALL INTO dept_test
            INTO emp_test
SELECT 1, '중복test', '중복test' FROM dual UNION ALL
SELECT 1, '중복test', '중복test', 1, sysdate, 1, 1, 1 FROM dual;
    
SELECT *
FROM dept_test d, emp_test e
WHERE d.deptno = e.deptno;

/*주문, 주문메뉴목록, 메뉴*/

SELECTA.MENM, B.COUNT, B.ORADM, C.USER_ID, C.DELDATE, C.PAYWAY
FROM MENU A LEFT OUTER JOIN ORDERMENU B ON A.MENO = B.MENO
LEFT OUTER JOIN DELIVER C ON C.DELNO = B.DELNO
WHERE C.DELNO = 1;

SELECT *
FROM ordermenu o, deliver d, menu m
WHERE o.delno = d.delno
AND o.meno = m.meno;

SELECT *
FROM ordermenu;
SELECT *
FROM deliver;
SELECT *
FROM menu;

 VALUES (SELECT NVL(MAX(RENO),0)+1 FROM REVIEW, '괜찮아요', 4, SYSDATE, 1, 1, 'bbb')


INSERT INTO REVIEW(RENO, RESENTENCE, SCORE, REDATE, RERENO, COMNO,USER_ID)
        SELECT A.RENO, A.RESENTENCE, A.SCORE, A.REDATE, A.RERENO, A.COMNO, A.USER_ID
        FROM REVIEW A LEFT OUTER JOIN COMPANY B ON B.COMNO = A.COMNO
                      LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO
                      WHERE A.COMNO =1 AND C.CATNO =1;
































