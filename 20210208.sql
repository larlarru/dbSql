
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
from post
where board_num = 7;

desc myboard;
desc post;
desc review;

select *
from myboard
order by board_num;

delete myboard where board_num = 37;

commit;

desc myboard;

select *
from review
where post_num = 37;
select * From post;

commit;

select *
from post;

select*
from review;


select *
from users;

select *
from review
where post_num = 33;

update review set power = 1 where review_num = 64;

commit;
























