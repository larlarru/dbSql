/* 게시글 */
CREATE TABLE POST (
	POST_NUM NUMBER NOT NULL, /* 게시글 번호 */
	POST_TITLE VARCHAR2(50) NOT NULL, /* 제목 */
	POST_CONTENT VARCHAR2(4000), /* 내용 */
	POST_WRITER VARCHAR2(50), /* 작성자 */
	POST_REG_DT DATE NOT NULL, /* 작성일 */
	POST_RENUM NUMBER, /* 답글게시글 번호 */
	FILE_NO VARCHAR2(4000), /* 파일번호1 */
	FILE_NO2 VARCHAR2(4000), /* 파일번호2 */
	FILE_NO3 VARCHAR2(4000), /* 파일번호3 */
	FILE_NO4 VARCHAR2(4000), /* 파일번호4 */
	FILE_NO5 VARCHAR2(4000), /* 파일번호5 */
	POWER NUMBER NOT NULL, /* 활성화 */
	BOARD_NUM NUMBER NOT NULL /* 게시판번호 */
);

COMMENT ON TABLE POST IS '게시글';

COMMENT ON COLUMN POST.POST_NUM IS '게시글 번호';

COMMENT ON COLUMN POST.POST_TITLE IS '제목';

COMMENT ON COLUMN POST.POST_CONTENT IS '내용';

COMMENT ON COLUMN POST.POST_WRITER IS '작성자';

COMMENT ON COLUMN POST.POST_REG_DT IS '작성일';

COMMENT ON COLUMN POST.POST_RENUM IS '답글게시글 번호';

COMMENT ON COLUMN POST.FILE_NO IS '파일번호1';

COMMENT ON COLUMN POST.FILE_NO2 IS '파일번호2';

COMMENT ON COLUMN POST.FILE_NO3 IS '파일번호3';

COMMENT ON COLUMN POST.FILE_NO4 IS '파일번호4';

COMMENT ON COLUMN POST.FILE_NO5 IS '파일번호5';

COMMENT ON COLUMN POST.POWER IS '활성화';

COMMENT ON COLUMN POST.BOARD_NUM IS '게시판번호';

CREATE UNIQUE INDEX PK_POST
	ON POST (
		POST_NUM ASC
	);

ALTER TABLE POST
	ADD
		CONSTRAINT PK_POST
		PRIMARY KEY (
			POST_NUM
		);

/* 게시판 */
CREATE TABLE TABLE (
	TABLE_NO NUMBER NOT NULL, /* 게시판 번호 */
	TABLE_TITLE VARCHAR2(50) NOT NULL, /* 게시판 제목 */
	TABLE_CHECK CHAR(1) NOT NULL /* 게시판활성화 */
);

COMMENT ON TABLE TABLE IS '게시판';

COMMENT ON COLUMN TABLE.TABLE_NO IS '게시판 번호';

COMMENT ON COLUMN TABLE.TABLE_TITLE IS '게시판 제목';

COMMENT ON COLUMN TABLE.TABLE_CHECK IS '게시판활성화';

CREATE UNIQUE INDEX PK_TABLE
	ON TABLE (
		TABLE_NO ASC
	);

ALTER TABLE TABLE
	ADD
		CONSTRAINT PK_TABLE
		PRIMARY KEY (
			TABLE_NO
		);

/* 첨부파일 */
CREATE TABLE FILE (
	FILE_NO NUMBER NOT NULL, /* 파일번호 */
	FILE_FI VARCHAR2(100), /* 첨부파일 */
	FILE_FI2 VARCHAR2(100), /* 첨부파일2 */
	FILE_FI3 VARCHAR2(100), /* 첨부파일3 */
	FILE_FI4 VARCHAR2(100), /* 첨부파일4 */
	FILE_FI5 VARCHAR2(100) /* 첨부파일5 */
);

COMMENT ON TABLE FILE IS '첨부파일';

COMMENT ON COLUMN FILE.FILE_NO IS '파일번호';

COMMENT ON COLUMN FILE.FILE_FI IS '첨부파일';

COMMENT ON COLUMN FILE.FILE_FI2 IS '첨부파일2';

COMMENT ON COLUMN FILE.FILE_FI3 IS '첨부파일3';

COMMENT ON COLUMN FILE.FILE_FI4 IS '첨부파일4';

COMMENT ON COLUMN FILE.FILE_FI5 IS '첨부파일5';

CREATE UNIQUE INDEX PK_FILE
	ON FILE (
		FILE_NO ASC
	);

ALTER TABLE FILE
	ADD
		CONSTRAINT PK_FILE
		PRIMARY KEY (
			FILE_NO
		);

/* 댓글 */
CREATE TABLE COMMENT (
	COM_NO NUMBER NOT NULL, /* 댓글번호 */
	COM_USER VARCHAR2(50) NOT NULL, /* 댓글 작성자 */
	COM_DATE DATE NOT NULL, /* 댓글 작성일 */
	COM_CHECK CHAR(1) NOT NULL, /* 댓글활성화 */
	POST_NUM NUMBER NOT NULL, /* 게시글 번호 */
	USER_ID VARCHAR2(20) NOT NULL, /* 아이디 */
	COM_NO2 NUMBER /* 댓글번호2 */
);

COMMENT ON TABLE COMMENT IS '댓글';

COMMENT ON COLUMN COMMENT.COM_NO IS '댓글번호';

COMMENT ON COLUMN COMMENT.COM_USER IS '댓글 작성자';

COMMENT ON COLUMN COMMENT.COM_DATE IS '댓글 작성일';

COMMENT ON COLUMN COMMENT.COM_CHECK IS '댓글활성화';

COMMENT ON COLUMN COMMENT.POST_NUM IS '게시글 번호';

COMMENT ON COLUMN COMMENT.USER_ID IS '아이디';

COMMENT ON COLUMN COMMENT.COM_NO2 IS '댓글번호2';

CREATE UNIQUE INDEX PK_COMMENT
	ON COMMENT (
		COM_NO ASC
	);

ALTER TABLE COMMENT
	ADD
		CONSTRAINT PK_COMMENT
		PRIMARY KEY (
			COM_NO
		);

/* 회원 */
CREATE TABLE USER (
	USER_ID VARCHAR2(20) NOT NULL, /* 아이디 */
	USER_PW NUMBER NOT NULL, /* 비밀번호 */
	USER_NM VARCHAR2(50) NOT NULL /* 이름 */
);

COMMENT ON TABLE USER IS '회원';

COMMENT ON COLUMN USER.USER_ID IS '아이디';

COMMENT ON COLUMN USER.USER_PW IS '비밀번호';

COMMENT ON COLUMN USER.USER_NM IS '이름';

CREATE UNIQUE INDEX PK_USER
	ON USER (
		USER_ID ASC
	);

ALTER TABLE USER
	ADD
		CONSTRAINT PK_USER
		PRIMARY KEY (
			USER_ID
		);

/* 게시판목록 */
CREATE TABLE TABLE2 (
);

COMMENT ON TABLE TABLE2 IS '게시판목록';

/* 게시판2 */
CREATE TABLE POST2 (
	BOARD_NUM NUMBER NOT NULL, /* 게시글 번호 */
	BOARD_TITLE VARCHAR2(50) NOT NULL, /* 제목 */
	BOARD_TXT VARCHAR2(4000) NOT NULL, /* 내용 */
	BOARD_DATE DATE NOT NULL, /* 작성일 */
	WRITER VARCHAR2(20) NOT NULL, /* 작성자 */
	BOARD_NUM_NUM NUMBER NOT NULL, /* 답글게시판 번호 */
	BOARD_COMNO NUMBER, /* 댓글번호 */
	FILE_NO NUMBER, /* 파일번호 */
	POST_COMNO2 NUMBER, /* 답글2 */
	POST_COMNO NUMBER /* 답글 */
);

COMMENT ON TABLE POST2 IS '게시판2';

COMMENT ON COLUMN POST2.BOARD_NUM IS '게시글 번호';

COMMENT ON COLUMN POST2.BOARD_TITLE IS '제목';

COMMENT ON COLUMN POST2.BOARD_TXT IS '내용';

COMMENT ON COLUMN POST2.BOARD_DATE IS '작성일';

COMMENT ON COLUMN POST2.WRITER IS '작성자';

COMMENT ON COLUMN POST2.BOARD_NUM_NUM IS '답글게시판 번호';

COMMENT ON COLUMN POST2.BOARD_COMNO IS '댓글번호';

COMMENT ON COLUMN POST2.FILE_NO IS '파일번호';

COMMENT ON COLUMN POST2.POST_COMNO2 IS '답글2';

COMMENT ON COLUMN POST2.POST_COMNO IS '답글';

CREATE UNIQUE INDEX PK_POST2
	ON POST2 (
		BOARD_NUM ASC
	);

ALTER TABLE POST2
	ADD
		CONSTRAINT PK_POST2
		PRIMARY KEY (
			BOARD_NUM
		);

/* 댓글 */
CREATE TABLE REVIEW (
	REVIEW_NUM NUMBER NOT NULL, /* 댓글번호 */
	REVIEW_CONTENT VARCHAR(1500) NOT NULL, /* 댓글내용 */
	REVIEW_REG_DT DATE NOT NULL, /* 댓글날짜 */
	REVIEW_WRITER VARCHAR2(50) NOT NULL, /* 댓글작성자 */
	POST_NUM NUMBER NOT NULL /* 게시글 번호 */
);

COMMENT ON TABLE REVIEW IS '댓글';

COMMENT ON COLUMN REVIEW.REVIEW_NUM IS '댓글번호';

COMMENT ON COLUMN REVIEW.REVIEW_CONTENT IS '댓글내용';

COMMENT ON COLUMN REVIEW.REVIEW_REG_DT IS '댓글날짜';

COMMENT ON COLUMN REVIEW.REVIEW_WRITER IS '댓글작성자';

COMMENT ON COLUMN REVIEW.POST_NUM IS '게시글 번호';

CREATE UNIQUE INDEX PK_REVIEW
	ON REVIEW (
		REVIEW_NUM ASC
	);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT PK_REVIEW
		PRIMARY KEY (
			REVIEW_NUM
		);

/* 게시판 */
CREATE TABLE MYBOARD (
	BOARD_NUM NUMBER NOT NULL, /* 게시판번호 */
	BOARD_TYPE VARCHAR2(50) NOT NULL, /* 게시판종류 */
	POWER NUMBER NOT NULL /* 활성화 */
);

COMMENT ON TABLE MYBOARD IS '게시판';

COMMENT ON COLUMN MYBOARD.BOARD_NUM IS '게시판번호';

COMMENT ON COLUMN MYBOARD.BOARD_TYPE IS '게시판종류';

COMMENT ON COLUMN MYBOARD.POWER IS '활성화';

CREATE UNIQUE INDEX PK_MYBOARD
	ON MYBOARD (
		BOARD_NUM ASC
	);

ALTER TABLE MYBOARD
	ADD
		CONSTRAINT PK_MYBOARD
		PRIMARY KEY (
			BOARD_NUM
		);

ALTER TABLE POST
	ADD
		CONSTRAINT FK_MYBOARD_TO_POST
		FOREIGN KEY (
			BOARD_NUM
		)
		REFERENCES MYBOARD (
			BOARD_NUM
		);

ALTER TABLE COMMENT
	ADD
		CONSTRAINT FK_POST_TO_COMMENT
		FOREIGN KEY (
			POST_NUM
		)
		REFERENCES POST (
			POST_NUM
		);

ALTER TABLE COMMENT
	ADD
		CONSTRAINT FK_USER_TO_COMMENT
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES USER (
			USER_ID
		);

ALTER TABLE COMMENT
	ADD
		CONSTRAINT FK_COMMENT_TO_COMMENT
		FOREIGN KEY (
			COM_NO2
		)
		REFERENCES COMMENT (
			COM_NO
		);

ALTER TABLE POST2
	ADD
		CONSTRAINT FK_POST2_TO_POST2
		FOREIGN KEY (
			POST_COMNO
		)
		REFERENCES POST2 (
			BOARD_NUM
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_POST_TO_REVIEW
		FOREIGN KEY (
			POST_NUM
		)
		REFERENCES POST (
			POST_NUM
		);

select *
from myboard;
desc myboard;

select *
from review;
desc review;

select *
from post;
desc post;

select *
from review;
desc review;

DROP TABLE myboard;
DROP TABLE post;
DROP TABLE post2;
DROP TABLE review;

commit;

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'myboard';

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'post';

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'review';

desc myboard;

select *
from myboard;

commit;

select * 
from myboard;

select count(*)
from myboard
where board_type = '자유게시판';

desc myboard;

insert into myboard values( board_seq.NEXTVAL, '자유게시판', 1);

select * 
from myboard;

update myboard set power = 0
			where board_num = 1;

commit;

delete from post;
delete from post2;
delete from myboard;
delete from review;

select *
from post;
desc post;

commit;

select *
from dual;

insert into post values( 
        post_seq.NEXTVAL,
        'test_brown게시판2', null, 'brown', sysdate, 0,
        null, null, null, null, null, 1, 1        
);

select *
from post;
desc post;
insert into post values( 
        post_seq.NEXTVAL,
        'test질문게시판1', null, 'brown', sysdate, 2,
        null, null, null, null, null, 1, 1        
);

select *
from post;
desc post;
commit;

insert into post values( 
        post_seq.NEXTVAL,
        'test답글게시글1', null, 'brown', sysdate, 2,
        null, null, null, null, null, 1, 1        
);
desc post;

select *
from users;

select *
from post
order by post_reg_dt desc;
desc post;

commit;

SELECT board_seq.CURRVAL 
FROM DUAL;

SELECT board_seq.nextval
FROM DUAL;

delete from myboard;
delete from post;

commit;

SELECT board_seq.nextVal FROM DUAL;

create sequence myboard_seq 
    start with 1   -- 시작번호
    increment by 1; -- 증가값

create sequence board_seq 
    start with 1   -- 시작번호
    increment by 1; -- 증가값

create sequence post_seq 
    start with 1   -- 시작번호
    increment by 1; -- 증가값

create sequence review_seq 
    start with 1   -- 시작번호
    increment by 1; -- 증가값

commit;

select myboard_seq.currval from dual;

drop sequence board_seq;
drop sequence post_seq;
drop sequence review_seq;

create sequence review_seq 
    start with 1   -- 시작번호
    increment by 1; -- 증가값

SELECT *
	    FROM
	    (SELECT ROWNUM rn, a.*
	    FROM
		        (SELECT *
		        FROM post
		        ORDER BY post_reg_dt desc) a
		    WHERE ROWNUM <= 1*10)
		WHERE rn BETWEEN (1-1)*10 + 1 AND 1*10;


select *
from post;
desc post;

update post set power = 0 where post_num = 5;

update myboard set power = 0 where board_num = 1;

select *
from myboard;

select *
from post;
desc post;

desc review;


commit;

SELECT *
	    FROM
	    (SELECT ROWNUM rn, a.*
	    FROM
		        (SELECT *
		        FROM post
		        ORDER BY post_reg_dt desc) a
		    WHERE ROWNUM <= 1*10)
		WHERE rn BETWEEN (1-1)*10 + 1 AND 1*10;
    
select *
from
    (select rownum rn, a.*
    from
        (select post_num,
            LPAD('- ', (LEVEL-1)*3) || post_title post_title, 
            post_writer, post_reg_dt
        from post
        where board_num = 1
        START WITH post_renum IS NULL 
        CONNECT BY PRIOR post_num = post_renum 
        order by post_reg_dt, post_renum desc) a
    where rownum <= 1*10)
WHERE rn BETWEEN (1-1)*10 + 1 AND 1*10;

/*답글 -잘못된거*/
select post_num,
    LPAD('- ', (LEVEL-1)*3) || post_title post_title, 
    post_writer, post_reg_dt, post_renum, board_num
from post
where board_num = 1
START WITH post_renum is not null
CONNECT BY PRIOR post_num = post_renum 
order by post_renum desc;

/*답글*/
select post_num,
    LPAD('- ', (LEVEL-1)*3) || post_title post_title, 
    post_writer, post_reg_dt, post_renum, board_num
from post
where board_num = 1
START WITH post_renum = 0
CONNECT BY PRIOR post_num = post_renum;
order by post_num;

select post_num,
    LPAD(' - ', (LEVEL-1)*3, '-') || post_title post_title, 
    post_writer, post_reg_dt, post_renum, board_num
from post
where board_num = 1
START WITH post_renum = 0
CONNECT BY PRIOR post_num = post_renum;
order by post_renum, post_reg_dt desc;

select post_num,
    LPAD('┖', (LEVEL-1)*3) || post_title post_title, 
    post_writer, post_reg_dt, post_renum, board_num
from post
where board_num = 1
START WITH post_renum = 0
CONNECT BY PRIOR post_num = post_renum
order siblings by post_reg_dt desc;



select post_num,
    LPAD(' - ', (LEVEL-1)*3, '-') || post_title post_title, 
    post_writer, post_reg_dt, post_renum, board_num
from post
where board_num = 1
START WITH post_renum = 0
CONNECT BY PRIOR post_num = post_renum
order siblings by post_reg_dt desc;

ORDER SIBLINGS BY REF_SEQ DESC, BOARD_SEQ ASC;

/* 답글 xml 백업 20210127 17:24 */
select *
		from
		    (select rownum rn, a.*
		    from
		        (select post_num,
		            LPAD('- ', (LEVEL-1)*2, '-') || post_title post_title, 
		            post_writer, post_reg_dt, post_renum, board_num, power
		        from post
		        where board_num = #{board_num}
		        START WITH post_renum = 0 
		        CONNECT BY PRIOR post_num = post_renum
		        order siblings by post_reg_dt desc) a
		    where rownum &lt;= #{page}*#{pageSize})
		WHERE rn BETWEEN (#{page}-1)*#{pageSize} + 1 AND #{page}*#{pageSize}

/* 답글 xml 백업 20210126 19:30*/
select *
		from
		    (select rownum rn, a.*
		    from
		        (select post_num,
		            LPAD('- ', (LEVEL-1)*3) || post_title post_title, 
		            post_writer, post_reg_dt, post_renum, board_num, power
		        from post
		        where board_num = #{board_num}
		        START WITH post_renum = 0 
		        CONNECT BY PRIOR post_num = post_renum 
		        order by post_reg_dt, post_renum desc) a
		    where rownum &lt;= #{page}*#{pageSize})
		WHERE rn BETWEEN (#{page}-1)*#{pageSize} + 1 AND #{page}*#{pageSize}


/*답글 견본*/
SELECT A.reno,
    LPAD(' ', (LEVEL-1)*3) || A.RESENTENCE RESENTENCE,
    A.SCORE, A.COMNO, A.USER_ID, A.REDATE 
FROM REVIEW A LEFT OUTER JOIN COMPANY B ON B.COMNO = A.COMNO
              LEFT OUTER JOIN CATEGORY C ON C.CATNO = B.CATNO
              WHERE A.COMNO =1 AND C.CATNO =1
    START WITH A.RERENO IS NULL CONNECT BY PRIOR A.RENO = A.RERENO 
ORDER SIBLINGS BY reno DESC;

select *
from myboard;

select *
from post;
desc post;

desc review;
select *
from review;
desc review;

select *
from review
order by review_reg_dt desc;

update review set power = 1 where review_num = 7;

desc review;

commit;

select *
from post
order by post_reg_dt;
desc post;

select *
from post
where board_num = 1
order by post_reg_dt;

update post set post_renum = 0 where post_renum is null;

select *
from post
where board_num = 2;
commit;

select *
from review
order by review_reg_dt desc;

select *
from users;

delete users where userid = 'brown_test';
commit;

update users set filename='brown.png', realfilename='d:\\upload\\brown.png'
where userid ='brown';

List<String>
<select id="" resultType="String" parameterType="String"
SELECT  b.comments
FROM user_tab_columns a, user_col_comments b
WHERE a.table_name = b.table_name
AND a.column_name = b.column_name
AND a.table_name = 'EMP'
ORDER BY a.column_id;

SELECT *
FROM user_col_comments
WHERE table_name = 'EMP';

select *
from users;

select *
from cycle;

cid, pid, day, cnt ==> 2021 02월 일시적으로 생성하며
1   100 2   1           1   100 20210201    1
                        1   100 20210208    1
                        1   100 20210215    1
                        1   100 20210222    1
                        
select *
from daily;

desc daily;





















        