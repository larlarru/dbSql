DESC tb_jdbc_board;

SELECT *
FROM tb_jdbc_board;

SELECT *
FROM tb_jdbc_user;
DESC tb_jdbc_user;

DELETE tb_jdbc_user;

DELETE tb_jdbc_board;

COMMIT;

SELECT *
FROM tb_jdbc_board;
DESC tb_jdbc_board;

DESC company;

Insert Into P Values (1);
Insert Into T(C) Values(S);
Insert Into T Values (Null);
Insert Into Students Values('Dodd', 364);

INSERT INTO tb_jdbc_board VALUES (3,'a','a','a', SYSDATE);

INSERT INTO 테이블명 (COLUMN_LIST)
VALUES (COLUMN_LIST에 넣을 VALUE_LIST);

INSERT INTO PLAYER (PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, HEIGHT, WEIGHT, BACK_NO)
VALUES ('2002007', ' 박지성', 'K07', 'MF' ,178, 73, 7);

SELECT *
FROM TB_JDBC_BOARD;
DESC TB_JDBC_BOARD;

DELETE TB_JDBC_BOARD  WHERE board_no = 2;

COMMIT;

SELECT NVL(MAX(board_no),0) + 1 
FROM ;
SELECT NVL(MAX(board_no),0) + 1 board_no FROM TB_JDBC_BOARD;
INSERT INTO TB_JDBC_BOARD values(3, '?', '?', '?', SYSDATE);

UPDATE TB_JDBC_BOARD SET board_no = 1, 
title = 'a', content = 'a', user_id = 'a',
reg_date = SYSDATE;


SELECT deptcd, LPAD(' ', (LEVEL-1) * 3) || deptnm
FROM dept_h
START WITH deptcd = 'dept0'
CONNECT BY PRIOR deptcd = p_deptcd;

SELECT *
FROM dept_h;


SELECT LPAD(' ', (LEVEL-1) * 3) || deptnm
FROM dept_h
START WITH deptcd = 'dept0'
CONNECT BY PRIOR deptcd = p_deptcd;


--parent_seq 부분이 어디 댓글에 달았는지 구별
SELECT deptno, LEVEL, LTRIM(SYS_CONNECT_BY_PATH(deptno, '-'), '-') scbp
FROM (SELECT deptno
        FROM dept
        WHERE deptno IN (10, 20))
CONNECT BY LEVEL < 5
CONNECT BY LEVEL, deptno;

SELECT *
FROM board_test;

계층쿼리 (게시글 계층형쿼리 샘플 자료.sql 실습 h6)
답 : 
--parent_seq 부분이 어디 댓글에 달았는지 구별
SELECT seq, LPAD(' ', (LEVEL-1)*3) || title title
FROM board_test
START WITH parent_seq IS NULL
CONNECT BY PRIOR seq = parent_seq;

DESC board_test;


