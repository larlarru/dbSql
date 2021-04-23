
SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'cycle';

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'daily';

select *
from daily;

delete daily;
select *
from users;
where userid = 'brown';


commit;

select *
from cycle;

INSERT INTO daily
SELECT cid, pid, a.dt, cnt
FROM cycle,
    (SELECT TO_CHAR(TO_DATE('202102', 'YYYYMM') + (LEVEL-1), 'YYYYMMDD') DT,
            TO_CHAR(TO_DATE('202102', 'YYYYMM') + (LEVEL-1), 'D') D
    FROM dual
    CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(TO_DATE('202102', 'YYYYMM')), 'DD'))a
WHERE cycle.day = a.d;

SELECT LAST_DAY(TO_DATE('202102'), 'YYYYMM'))
FROM dual;

select *
from post
where board_num = 1;

select *
from post
where post_num = 24;

select *
from review;
where post_num = 24;

select *
from myboard;

select *
from post;
where board_num = 7;
commit;

desc myboard;
desc post;
desc review;

select *
from myboard
order by board_num;

delete myboard where board_num = 69;

commit;

desc myboard;
desc post;

select *
from review
where post_num = 37;
select * From post;

commit;

select *
from post;

desc post;

desc users;

select*
from review;


select *
from users;

select *
from review
where post_num = 33;

update review set power = 1 where review_num = 64;

commit;



select * from dba_profiles
 
where resource_type='PASSWORD';

ALTER PROFILE default LIMIT
 
FAILED_LOGIN_ATTEMPTS 5
 
PASSWORD_LIFE_TIME UNLIMITED
 
PASSWORD_GRACE_TIME  10;

commit;

SELECT USERNAME,ACCOUNT_STATUS, EXPIRY_DATE FROM DBA_USERS;

select * from dba_profiles where profile='DEFAULT' and resource_name='PASSWORD_LIFE_TIME';

 ALTER USER larlarru IDENTIFIED BY humeccapassword;
 
ALTER USER larlarru ACCOUNT UNLOCK;

ALTER user larlarru identified by java;

CREATE TABLE TB_CMM_DEPT
( 
   DEPT_CD     VARCHAR2(8) NOT NULL PRIMARY KEY,
   PAR_DEPT_CD VARCHAR2(8),
   DEPT_NM     VARCHAR2(50),
   USE_YN      CHAR(1),
   REG_DTM     DATE,
   REG_USER    VARCHAR2(30),
   MOD_DTM     DATE,
   MOD_USER    VARCHAR2(30)
);

SELECT   DEPT_CD, 
         PAR_DEPT_CD,
         DEPT_NM,
         USE_YN
	
   FROM TB_CMM_DEPT;

SELECT *
FROM TB_CMM_DEPT;
   
SELECT * 
FROM TB_CMM_DEPT
START WITH PAR_DEPT_CD IS NULL;   

SELECT * 
       FROM TB_CMM_DEPT
       START WITH PAR_DEPT_CD = 'DEPT_002';

SELECT * 
FROM TB_CMM_DEPT
START WITH PAR_DEPT_CD = (   SELECT DEPT_CD 
                              FROM  TB_CMM_DEPT
                             WHERE DEPT_NM  = '경영지원부'
                            );















