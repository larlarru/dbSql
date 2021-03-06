/* 사용자 */
CREATE TABLE USERS (
	USER_ID VARCHAR2(50) NOT NULL, /* 아이디 */
	PASSWORD VARCHAR2(50) NOT NULL, /* 패스워드 */
	NICK VARCHAR2(50) NOT NULL, /* 닉네임 */
	COL VARCHAR2(50) NOT NULL, /* 전화번호 */
	ADM VARCHAR2(255) NOT NULL, /* 주소 */
	BIR VARCHAR2(50) NOT NULL, /* 생년월일 */
	CHOOSE NUMBER NOT NULL /* 사용자종류 */
);

COMMENT ON TABLE USERS IS '사용자';

COMMENT ON COLUMN USERS.USER_ID IS '아이디';

COMMENT ON COLUMN USERS.PASSWORD IS '패스워드';

COMMENT ON COLUMN USERS.NICK IS '닉네임';

COMMENT ON COLUMN USERS.COL IS '전화번호';

COMMENT ON COLUMN USERS.ADM IS '주소';

COMMENT ON COLUMN USERS.BIR IS '생년월일';

COMMENT ON COLUMN USERS.CHOOSE IS '사용자종류';

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
	DELRANGE VARCHAR2(4000) NOT NULL, /* 배달범위 */
	COMCOL VARCHAR2(50) NOT NULL, /* 전화번호 */
	SAL NUMBER /* 업체매출 */
);

COMMENT ON TABLE COMPANY IS '업체';

COMMENT ON COLUMN COMPANY.COMNO IS '업체번호';

COMMENT ON COLUMN COMPANY.COMNM IS '업체이름';

COMMENT ON COLUMN COMPANY.LOC IS '업체위치';

COMMENT ON COLUMN COMPANY.CATNO IS '카테고리번호';

COMMENT ON COLUMN COMPANY.DELRANGE IS '배달범위';

COMMENT ON COLUMN COMPANY.COMCOL IS '전화번호';

COMMENT ON COLUMN COMPANY.SAL IS '업체매출';

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
	REDATE DATE NOT NULL, /* 리뷰날짜 */
	RERENO NUMBER, /* 답글번호 */
	COMNO NUMBER NOT NULL, /* 업체번호 */
	USER_ID VARCHAR2(50) NOT NULL /* 아이디 */
);

COMMENT ON TABLE REVIEW IS '리뷰';

COMMENT ON COLUMN REVIEW.RENO IS '리뷰번호';

COMMENT ON COLUMN REVIEW.RESENTENCE IS '리뷰내용';

COMMENT ON COLUMN REVIEW.SCORE IS '평점';

COMMENT ON COLUMN REVIEW.REDATE IS '리뷰날짜';

COMMENT ON COLUMN REVIEW.RERENO IS '답글번호';

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

/* 매출 */
CREATE TABLE COMSAL (
	SAL NUMBER, /* 매출 */
	COMNO NUMBER NOT NULL /* 업체번호 */
);

COMMENT ON TABLE COMSAL IS '매출';

COMMENT ON COLUMN COMSAL.SAL IS '매출';

COMMENT ON COLUMN COMSAL.COMNO IS '업체번호';

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
	DELNO NUMBER NOT NULL, /* 주문번호 */
	USER_ID VARCHAR2(50) NOT NULL, /* 아이디 */
	COMNO NUMBER NOT NULL, /* 업체번호 */
	DELDATE DATE NOT NULL, /* 주문시간 */
	PAYWAY VARCHAR2(50) NOT NULL, /* 계산방법 */
	DELCHECK VARCHAR2(10) NOT NULL, /* 활성화 */
	ALLMENU VARCHAR2(255) NOT NULL, /* 총시킨메뉴 */
	ADM VARCHAR2(255) NOT NULL, /* 주소 */
	SAL NUMBER /* 총가격 */
);

COMMENT ON TABLE DELIVER IS '주문';

COMMENT ON COLUMN DELIVER.DELNO IS '주문번호';

COMMENT ON COLUMN DELIVER.USER_ID IS '아이디';

COMMENT ON COLUMN DELIVER.COMNO IS '업체번호';

COMMENT ON COLUMN DELIVER.DELDATE IS '주문시간';

COMMENT ON COLUMN DELIVER.PAYWAY IS '계산방법';

COMMENT ON COLUMN DELIVER.DELCHECK IS '활성화';

COMMENT ON COLUMN DELIVER.ALLMENU IS '총시킨메뉴';

COMMENT ON COLUMN DELIVER.ADM IS '주소';

COMMENT ON COLUMN DELIVER.SAL IS '총가격';

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
	COUNT NUMBER NOT NULL /* 갯수 */
);

COMMENT ON TABLE ORDERMENU IS '주문메뉴목록';

COMMENT ON COLUMN ORDERMENU.MENO IS '메뉴번호';

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

ALTER TABLE COMSAL
	ADD
		CONSTRAINT FK_COMPANY_TO_COMSAL
		FOREIGN KEY (
			COMNO
		)
		REFERENCES COMPANY (
			COMNO
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
FROM ordermenu;
DESC ordermenu;

SELECT *
FROM category;

SELECT *
FROM COMPANY;

SELECT *
FROM menu;
DESC menu;


INSERT INTO Company values(1, '분식a', '위치a', 1, '배달범위a', '01011112222', '');

INSERT INTO MENU VALUES(1, '떡볶이', 1000, 1);
INSERT INTO MENU VALUES(2, '김말이', 2000, 1);
INSERT INTO MENU VALUES(3, '모듬튀김 세트', 4000, 1);
INSERT INTO MENU VALUES(4, '모듬 세트', 10000, 1);

COMMIT;

SELECT *
FROM users;
DESC users;

SELECT *
FROM REVIEW;
DESC REVIEW;

INSERT INTO USERS VALUES('test', '1234', 'test', '010', '주소', '111111', '1');

select *
FROM ordermenu;
DESC ordermenu;

INSERT INTO ordermenu VALUES(1, 2);
INSERT INTO ordermenu VALUES(2, 3);
INSERT INTO ordermenu VALUES(3, 1);
INSERT INTO ordermenu VALUES(4, 1);


SELECT A.MENM || ' ' || B.COUNT || '개 ' || A.PRICE
    || ' 총가격 : ' || A.PRICE*B.COUNT ordermenu
FROM MENU A LEFT OUTER JOIN ORDERMENU B ON A.MENO = B.MENO
WHERE A.MENO = 1;

SELECT A.MENM || ' ' || B.COUNT || '개 ' ordermenu
FROM MENU A LEFT OUTER JOIN ORDERMENU B ON A.MENO = B.MENO
WHERE A.MENO = 1;

SELECT A.MENM || ' ' || B.COUNT || '개 ' ordermenu
FROM MENU A LEFT OUTER JOIN ORDERMENU B ON A.MENO = B.MENO;

SELECT *
FROM (SELECT A.MENM || ' ' || B.COUNT || '개 '
        FROM MENU A LEFT OUTER JOIN ORDERMENU B ON A.MENO = B.MENO);

/*메뉴 조건 주면 그 메뉴와 갯수 가격, 총가격 나오기*/
SELECT A.MENM || ' ' || B.COUNT || '개 ' menulist, 
        A.PRICE, A.PRICE*B.COUNT sal
FROM MENU A LEFT OUTER JOIN ORDERMENU B ON A.MENO = B.MENO
WHERE A.MENO = 1;



SELECT A.MENM || ' ' || B.COUNT || '개 ' MENULIST,
        A.PRICE, A.PRICE*B.COUNT ALLSAL
FROM MENU A LEFT OUTER JOIN ORDERMENU B ON A.MENO = B.MENO;

SELECT A.MENM || ' ' || B.COUNT || '개 ' MENULIST,
        A.PRICE, SUM(A.PRICE*B.COUNT) ALLSAL
FROM MENU A LEFT OUTER JOIN ORDERMENU B ON A.MENO = B.MENO
GROUP BY A.MENM || ' ' || B.COUNT || '개 ', A.PRICE;


SELECT Q.MENULIST, Q.PRICE
FROM (SELECT A.MENM || ' ' || B.COUNT || '개 ' MENULIST, A.PRICE
      FROM MENU A LEFT OUTER JOIN ORDERMENU B ON A.MENO = B.MENO) Q
GROUP BY Q.MENULIST, Q.price;

SELECT *
FROM DELIVER;
DESC DELIVER;

INSERT INTO DELIVER VALUES(1, 'test', 1, SYSDATE, 
                    '현금', 'F', '메뉴||메뉴', 'test주소', 1);

SELECT NVL(MAX(delno),0)+1
FROM DELIVER;

SELECT *
FROM ORDERMENU;

SELECT *
FROM MENU;


/*메뉴 총가격*/
SELECT  SUM(A.PRICE*B.COUNT) ALLSAL
FROM MENU A left OUTER JOIN ORDERMENU B ON A.MENO = B.MENO;

SELECT A.ALLSAL
FROM (SELECT  SUM(A.PRICE*B.COUNT) ALLSAL
    FROM MENU A left OUTER JOIN ORDERMENU B ON A.MENO = B.MENO) A;


/*메뉴와 갯수가 묵어서 한번에 나오고 그다음에 가격, 매뉴*/
SELECT A.MENM || ' ' || B.COUNT || '개 ' MENULIST, A.PRICE*B.COUNT ALLSAL
FROM MENU A LEFT OUTER JOIN ORDERMENU B ON A.MENO = B.MENO;

/* || ' 가격 : ' || A.PRICE */

/*메뉴와 갯수가 묵어서 한번에 나옴*/
SELECT A.MENM || ' ' || B.COUNT || '개 ' MENULIST
FROM MENU A LEFT OUTER JOIN ORDERMENU B ON A.MENO = B.MENO;

SELECT *
FROM DELIVER;

SELECT *
FROM USERS;

SELECT A.reno,
    LPAD(' ', (LEVEL-1)*3) || A.RESENTENCE RESENTENCE,
    A.SCORE, A.COMNO, A.USER_ID, A.REDATE 
FROM REVIEW A LEFT OUTER JOIN COMPANY B ON B.COMNO = A.COMNO
              LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO
              WHERE A.COMNO =1 AND C.CATNO =1
    START WITH A.RERENO IS NULL CONNECT BY PRIOR A.RENO = A.RERENO 
ORDER SIBLINGS BY reno DESC;


String sql = "INSERT INTO review VALUES (SELECT NVL(MAX(reno),0) + 1 reno, "
						+ "?, ?, ?, '', SYSDATE, ? "
						+ "FROM review";

join review, company,category
where comno =?, catno= ?
***********************************************************************************;
INSERT INTO REVIEW VALUES(SELECT NVL(MAX(RENO),0) AS RENO FROM REVIEW, 'testTest', '', SYSDATE, 4, 1, 'test');--
            SELECT *
            FROM REVIEW A LEFT OUTER JOIN COMPANY B ON B.COMNO = A.COMNO
                          LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO
                          WHERE A.COMNO =1 AND C.CATNO =1;

INSERT INTO REVIEW VALUES(5, 'testTest', '', SYSDATE, 4, 1, 'test')
            SELECT *
            
            FROM REVIEW A LEFT OUTER JOIN COMPANY B ON B.COMNO = A.COMNO
                          LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO
                          WHERE A.COMNO =1 AND C.CATNO =1;

/*실험 하는 조회 부분*/
SELECT *
FROM REVIEW A LEFT OUTER JOIN COMPANY B ON B.COMNO = A.COMNO
              LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO
WHERE A.COMNO =1 AND C.CATNO =1;
/*실험 하는 등록 부분*/
INSERT INTO REVIEW VALUES(5, 'testTest', '', SYSDATE, 4, 1, 'test');
                          
SELECT *
FROM REVIEW;
DESC REVIEW;


SELECT *
FROM CATEGORY;

catno

SELECT *
FROM COMPANY;

comno

SELECT *
FROM MENU;


SELECT  MENO, MENM, PRICE
FROM CATEGORY A LEFT OUTER JOIN COMPANY B ON A.CATNO = B.CATNO
                LEFT OUTER JOIN MENU C ON B.COMNO = C.COMNO
WHERE A.CATNO = 1
AND B.COMNO = 1;



 SELECT A.*
            FROM REVIEW A LEFT OUTER JOIN COMPANY B ON B.COMNO = A.COMNO
                          LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO
                          WHERE A.COMNO =1 AND C.CATNO =1;
                          
                          
SELECT *
FROM CATEGORY;


SELECT  *
FROM MENU A left OUTER JOIN ORDERMENU B ON A.MENO = B.MENO;
********************************************************************;

INSERT INTO REVIEW(RENO, RESENTENCE,SCORE, REDATE, RERENO, COMNO, USER_ID); 
        SELECT A.RENO, A.RESENTENCE, A.SCORE, A.REDATE, A.RERENO, A.COMNO, A.USER_ID
        FROM REVIEW A LEFT OUTER JOIN COMPANY B ON B.COMNO = A.COMNO
                      LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO
                      WHERE A.COMNO =1 AND C.CATNO =1;
SELECT CATNO, CATNM
FROM CATEGORY;


DELETE REVIEW;

COMMIT;

SELECT *
FROM REVIEW;
SELECT *
FROM ORDERMENU;
INSERT INTO ORDERMENU VALUES(SELECT NVL(MAX(MENO)FROM ORDERMENU,0)+1, 1);
SELECT NVL(MAX(RENO),0)+1
FROM REVIEW;

SELECT *
 FROM REVIEW A LEFT OUTER JOIN COMPANY B ON B.COMNO = A.COMNO
                      LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO
                      WHERE A.COMNO =1 AND C.CATNO =1;


**************************************************
INSERT INTO REVIEW(RENO,RESENTENCE,SCORE, REDATE, RERENO, COMNO, USER_ID)
        VALUES (5, '괜찮아요', 4, SYSDATE, '', 1, 'test')
        SELECT A.*
        FROM REVIEW A LEFT OUTER JOIN COMPANY B ON B.COMNO = A.COMNO
                      LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO
                  WHERE A.COMNO =1 AND C.CATNO =1;

INSERT INTO REVIEW VALUES (5, '괜찮아요', 4, SYSDATE, 1, 1, 'test');

ROLLBACK;


SELECT *
FROM dual;

SELECT *
FROM review;


COMMIT;




INSERT INTO REVIEW
SELECT *
FROM review;
DESC review;

/*밑에 댓글/댓댓글 완료*/       
SELECT reno, LPAD(' ', (LEVEL-1)*3) || resentence
FROM REVIEW
START WITH rereno IS NULL
CONNECT BY PRIOR reno = rereno
ORDER SIBLINGS BY reno DESC;

COMMIT;

SELECT *
FROM review;
DESC review;
SELECT NVL(MAX(reno),0) + 1 reno FROM review;

INSERT INTO review values(1, 'test댓글', 5, SYSDATE, '', 1, 'test');
INSERT INTO review values(2, '1번째의 1번째 댓댓글', 4, SYSDATE, 1, 1, 'test');


INSERT INTO review values(3, '1번째의 2번째 댓댓글', '', SYSDATE, 1, 1, 'test');
INSERT INTO review values(4, '1번째의 1번째의 1번째 댓글', '', SYSDATE, 3, 1, 'test');




INSERT INTO review values(5, '2번째의 1번째 댓댓글', 1, 1, 'test', SYSDATE, 4);
INSERT INTO review values(6, '2번째의 2번째 댓댓글', 1, 1, 'test', SYSDATE, 4);

INSERT INTO review values(7, '3번째의 댓글', 1, 1, 'test', SYSDATE, '');
INSERT INTO review values(8, '3번째의 1첫번째 댓댓글', 1, 1, 'test', SYSDATE, 7);


INSERT INTO review values(9, '3번째의 2번째 댓댓글', 1, 1, 'test', SYSDATE, 7);

INSERT INTO review values(10, '3번째의 3번째 댓댓글', 1, 1, 'test', SYSDATE, 7);


SELECT *
FROM deliver;
DESC deliver;

INSERT INTO DELIVER VALUES(1, 'test', 1, SYSDATE, 
                    '현금', 'F', '메뉴||메뉴', 'test주소', 20000);




SELECT *
FROM TB_JDBC_BOARD;


DESC TB_JDBC_BOARD;

INSERT INTO TB_JDBC_BOARD VALUES(1, 'test1', '', 'test', SYSDATE);
INSERT INTO TB_JDBC_BOARD VALUES(2, 'test2', '', 'test', SYSDATE);
INSERT INTO TB_JDBC_BOARD VALUES(3, 'test3', '', 'test', SYSDATE);
INSERT INTO TB_JDBC_BOARD VALUES(4, 'test4', '', 'test', SYSDATE);
INSERT INTO TB_JDBC_BOARD VALUES(5, 'test5', '', 'test', SYSDATE);

SELECT *
FROM TB_JDBC_USER;

COMMIT;


DESC MENU;

DESC ORDERMENU;


SELECT *
FROM

SELECT *
FROM review;

DESC review;

COMMIT;

SELECT *
FROM USERS;

SELECT *
FROM COMPANY;

DELETE REVIEW;

COMMIT;

INSERT INTO REVIEW VALUES(1, '', '', SYSDATE, '', 1, 'test');


SELECT *
FROM deliver;


DESC deliver;

INSERT INTO DELIVER VALUES(1, 'test', 1, SYSDATE, '카드', 'F', '고른 메뉴 목록들', 'testADM', 22000);


SELECT *
FROM users;

SELECT *
FROM COMPANY;

SELECT *
FROM DELIVER
WHERE USER_ID = 'test';

COMMIT;
DELETE DELIVER WHERE USER_ID = 'testc';

UPDATE USERS SET DELCANCLE = '취소' WHERE USER_ID = 'test';


SELECT *
FROM menu;
DESC MENU;

COMMIT;

INSERT INTO MENU VALUES((SELECT NVL(MAX(MENO),0)+1 FROM MENU), 'test메뉴번호', 1000, 1);

rollback;



INSERT INTO REVIEW(RENO, RESENTENCE,SCORE, REDATE, RERENO, COMNO, USER_ID); 
SELECT A.RENO, A.RESENTENCE, A.SCORE, A.REDATE, A.RERENO, A.COMNO, A.USER_ID
FROM REVIEW A LEFT OUTER JOIN COMPANY B ON B.COMNO = A.COMNO
LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO
WHERE A.COMNO =1 AND C.CATNO =1;


SELECT *
FROM REVIEW A LEFT OUTER JOIN COMPANY B ON A.COMNO = B.COMNO
WHERE A.COMNO =1;

SELECT *
FROM CATEGORY
WHERE CATNO = ?;

DESC review;

SELECT * FROM MENU;

SELECT * FROM CATEGORY;


SELECT MENO, MENM, PRICE
FROM MENU A LEFT OUTER JOIN CATEGORY B ON A.COMNO = B.COMNO
WHERE A.COMNO =1;

SELECT MENO, MENM, PRICE 
FROM MENU
WHERE COMNO = 1;

SELECT *
FROM MENU;
WHERE COMNO = 1;

SELECT *
FROM ORDERMENU;

DELETE ORDERMENU;

COMMIT;
rollback;

SELECT A.MENM || ' ' || B.COUNT || '개 ' MENULIST,
A.PRICE*B.COUNT ALLSAL
FROM MENU A LEFT OUTER
JOIN ORDERMENU B ON A.MENO = B.MENO;
WHERE B.COUNT IS NOT NULL;

SELECT *
FROM MENU;

INSERT INTO ORDERMENU VALUES(1,1);


SELECT A.MENM || ' ' || B.COUNT || '개 ' MENULIST, "
				+ "A.PRICE*B.COUNT ALLSAL "
				+ "FROM MENU A LEFT OUTER "
				+ "JOIN ORDERMENU B ON A.MENO = B.MENO "
				+ "WHERE B.COUNT IS NOT NULL";

SELECT *
FROM ORDERMENU;
DESC ORDERMENU;
INSERT INTO ORDERMENU VALUES(?, 1)
INSERT INTO ORDERMENU VALUES (1, 1)

SELECT *
FROM ORDERMENU;

DELETE ORDERMENU;

rollback;

commit;


SELECT *
FROM DELIVER;
DESC DELIVER;
DELETE DELIVER;

SELECT *
FROM ORDERMENU;
DELETE ORDERMENU;

COMMIT;


SELECT A.MENM || ' ' || B.COUNT || '개 ' MENULIST,
        A.PRICE*B.COUNT ALLSAL
FROM MENU A LEFT OUTER JOIN ORDERMENU B ON A.MENO = B.MENO
WHERE B.COUNT IS NOT NULL;

SELECT NVL(MAX(DELNO),0) + 1 FROM DELIVER;


(SELECT NVL(MAX(DELNO),0)+1 FROM DELIVER);


SELECT *
FROM COMPANY;
DESC COMPANY;
SELECT *
FROM CATEGORY;

INSERT INTO COMPANY VALUES((SELECT NVL(MAX(COMNO),0)+1 FROM COMPANY), '카페*디저트1'
, 'test주소', 2, '대전', '01012345678', '');


INSERT INTO COMPANY VALUES((SELECT NVL(MAX(COMNO),0)+1 FROM COMPANY), '돈까스*회*일식1'
, 'test주소', 3, '대전', '01012345678', '');

SELECT * 
FROM USERS;
DESC USERS;


       
SELECT reno, LPAD(' ', (LEVEL-1)*3) || resentence
FROM REVIEW
START WITH rereno IS NULL
CONNECT BY PRIOR reno = rereno
ORDER SIBLINGS BY reno DESC;

SELECT A.RENO, A.RESENTENCE, A.SCORE,
A.REDATE, A.RERENO, A.COMNO, A.USER_ID
FROM REVIEW A LEFT OUTER JOIN
COMPANY B ON B.COMNO = A.COMNO
LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO
WHERE C.CATNO =1 AND A.COMNO =1;


SELECT reno, LPAD(' ', (LEVEL-1)*3) || resentence
FROM REVIEW
START WITH rereno IS NULL
CONNECT BY PRIOR reno = rereno
ORDER SIBLINGS BY reno DESC;

/***********************************************/
SELECT A.RENO, LPAD(' ', (LEVEL-1)*3) || A.RESENTENCE, A.SCORE,
    A.REDATE, A.RERENO, A.COMNO, A.USER_ID
FROM REVIEW A LEFT OUTER JOIN COMPANY B ON B.COMNO = A.COMNO
LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO;
START WITH A.RERENO IS NULL
CONNECT BY PRIOR A.RENO = A.RERENO
WHERE C.CATNO = 1 AND A.COMNO = 1;
ORDER SIBLINGS BY RENO DESC;













