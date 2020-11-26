
CREATE TABLE BANKINFO(
    BANK_NO VARCHAR2(40) NOT NULL,          -- 계좌번호
    BANK_NAME VARCHAR2(40) NOT NULL,        -- 은행명
    BANK_USER_NAME VARCHAR2(30) NOT NULL,   -- 예금주 명
    BANK_DATE DATE NOT NULL,                -- 계설 날짜
    CONSTRAINT PK_BANKINFO PRIMARY KEY(BANK_NO)
);

SELECT *
FROM BANKINFO;

INSERT INTO BANKINFO VALUES('1', '1', '1', SYSDATE);

SELECT NVL(MAX(LPROD_ID), 0) + 1
FROM LPROD;

SELECT *
FROM LPROD;

SELECT COUNT(*)
FROM LPROD
WHERE LPROD_GU = 'P100';

DELETE LPROD WHERE LPROD_ID > 9;

DESC LPROD;

COMMIT;
/*___________________________________*/

CREATE TABLE MYMEMBER (
    mem_id varchar(15) not null,
    mem_name varchar(30) not null,
    mem_tel varchar(14) not null,
    mem_addr varchar(90) not null,
    CONSTRAINT pk_mymember PRIMARY KEY (MEM_ID)
);

DESC MYMEMBER;

SELECT *
FROM MYMEMBER;

DELETE MYMEMBER;

COMMIT;

INSERT INTO MYMEMBER VALUES('test', 'A', 'A', 'A');

SELECT * FROM MYMEMBER WHERE MEM_ID = 'test';

UPDATE MYMEMBER SET MEM_NAME ='a', MEM_TEL ='a';

UPDATE MYMEMBER SET MEM_NAME = ?, MEM_TEL = ?, MEM_ADDR = ? WHERE MEM_ID = ?

create table jdbc_board(
    board_no number not null,  -- 번호(자동증가)
    board_title varchar2(100) not null, -- 제목
    board_writer varchar2(50) not null, -- 작성자
    board_date date not null,   	-- 작성날짜
    board_cnt number default 0, -- 조회수
    board_content clob,     	-- 내용
    constraint pk_jdbc_board primary key (board_no)
);


SELECT *
FROM JDBC_BOARD;

DELETE JDBC_BOARD;

SELECT board_cnt
FROM jdbc_board;

DESC jdbc_board;

INSERT INTO JDBC_BOARD(BOARD_NO, BOARD_TITLE, 
            BOARD_WRITER, BOARD_DATE, BOARD_CNT, BOARD_CONTENT)
            VALUES((SELECT NVL(MAX(BOARD_NO),0)+1 FROM JDBC_BOARD),
            '첫번째 게시글', 'test', SYSDATE, NULL, 'test내용');
INSERT INTO JDBC_BOARD(BOARD_NO, BOARD_TITLE, 
            BOARD_WRITER, BOARD_DATE, BOARD_CNT, BOARD_CONTENT)
            VALUES((SELECT NVL(MAX(BOARD_NO),0)+1 FROM JDBC_BOARD),
            '두번째 게시글', 'test', SYSDATE, NULL, 'test내용');
INSERT INTO JDBC_BOARD(BOARD_NO, BOARD_TITLE, 
            BOARD_WRITER, BOARD_DATE, BOARD_CNT, BOARD_CONTENT)
            VALUES((SELECT NVL(MAX(BOARD_NO),0)+1 FROM JDBC_BOARD),
            '세번째 게시글', 'test', SYSDATE, NULL, 'test내용');
COMMIT;

SELECT *
FROM JDBC_BOARD
WHERE BOARD_TITLE LIKE '첫%';

UPDATE JDBC_BOARD SET BOARD_TITLE = '수정한test', BOARD_CONTENT = '수정함'
WHERE BOARD_NO = 4;

DELETE board_seq;
DROP SEQUENCE board_seq;

ALTER SEQUENCE board_seq INCREMENT BY 1;

SELECT board_seq.nextVal FROM DUAL;
create sequence board_seq 
    start with 1   -- 시작번호
    increment by 1; -- 증가값

SELECT *
FROM JDBC_BOARD
ORDER BY BOARD_NO DESC;

DESC JDBC_BOARD;

UPDATE JDBC_BOARD SET BOARD_CNT = (SELECT board_seq.nextVal FROM DUAL)
WHERE BOARD_NO = 5;

currVal--현재시퀀스

SELECT NVL(MAX(BOARD_CNT),0)+1 FROM JDBC_BOARD WHERE BOARD_NO = 1;

UPDATE JDBC_BOARD SET 
    BOARD_CNT = (SELECT NVL(MAX(BOARD_CNT),0)+1
    FROM JDBC_BOARD WHERE BOARD_NO = 5)
    WHERE BOARD_NO = 5;
COMMIT;

DESC MYMEMBER;

SELECT *
FROM MYMEMBER;

DELETE MYMEMBER;

UPdate MYMEMBER SET mem_name ='a' WHERE mem_id = 'test';

INSERT INTO MYMEMBER(MEM_ID, MEM_NAME, MEM_TEL, MEM_ADDR) 
VALUES('test', 'test', '1234', '지구어딘가에');

COMMIT;

--VO객체의 맴버변수 자동으로 만들기(DB연동용)
SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'jdbc_board';

DESC jdbc_board;

DESC JDBC_BOARD;

SELECT *
FROM JDBC_BOARD;

COMMIT;

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'lprod';


SELECT *
FROM LPROD;

DESC LPROD;

INSERT INTO LPROD VALUES((SELECT NVL(MAX(lprod_id),0)+1 FROM LPROD),
                            'P999', 'test');

COMMIT;

DELETE LPROD WHERE lprod_id = 88;

SELECT * FROM JDBC_BOARD ORDER BY board_no DESC;

UPDATE JDBC_BOARD SET board_cnt = board_cnt + 1
 						WHERE board_no = 1;
DESC JDBC_BOARD;

SELECT * 
FROM JDBC_BOARD;

SELECT board_no, board_title, board_writer,
 				to_char(board_date, 'YYYY-MM-DD') board_date,
 				board_cnt, board_content
 				FROM JDBC_BOARD
 				WHERE board_title like '%번째%'
 				ORDER BY board_no DESC;

SELECT board_no, board_title, board_writer,
 				to_char(board_date, 'YYYY-MM-DD') board_date,
 				board_cnt, board_content
 				FROM JDBC_BOARD
 				WHERE board_no = 1;


create table hotelroom(
    room_no number not null,  -- 번호(자동증가)
    room_type varchar2(50) not null, -- 제목
    room_user varchar2(50) null, -- 작성자
    room_date date null,   	-- 작성날짜
    constraint pk_hotelroom primary key (room_no)
);

COMMIT;
DELETE hotelroom;
SELECT *
FROM hotelroom
ORDER BY room_no;
DESC hotelroom;

INSERT INTO HOTELROOM(room_no, room_type, room_user, room_date)
            VALUES(201, '싱글룸', '-', null);
            
INSERT INTO HOTELROOM(room_no, room_type, room_user, room_date)
            VALUES(301, '더블룸', '-', null);
    
INSERT INTO HOTELROOM(room_no, room_type, room_user, room_date)
            VALUES(401, '스위트룸', '-', null);

INSERT INTO HOTELROOM(room_no, room_type, room_user, room_date)
            VALUES((SELECT NVL(MAX(room_no),0)+1 FROM HOTELROOM), 
                    '싱글룸', '-', null);

INSERT INTO HOTELROOM(room_no, room_type, room_user, room_date)
            VALUES((SELECT NVL(MAX(room_no),0)+1 FROM HOTELROOM), 
                    '더블룸', '-', null);
                    
INSERT INTO HOTELROOM(room_no, room_type, room_user, room_date)
            VALUES((SELECT NVL(MAX(room_no),0)+1 FROM HOTELROOM), 
                    '스위트룸', '-', null);


COMMIT;

SELECT *
FROM hotelroom;
ORDER BY room_no;
DESC hotelroom;

UPDATE HOTELROOM SET room_user = 'a', room_date = sysdate WHERE room_no = 201;

SELECT *
FROM hotelroom;
WHERE room_user = 'a';
SELECT COUNT(*) FROM HOTELROOM WHERE room_user = 'a';

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'hotelroom';

UPDATE HOTELROOM SET room_user = '-', 
 							room_date = null 
 				WHERE room_no = 201;


SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'member';

SELECT *
FROM MEMBER;

COMMIT;





