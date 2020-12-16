
SELECT *
FROM HAWAIIROOMINFO;
DESC HAWAIIROOMINFO;

SELECT NVL(MAX(room_no),0)+1
FROM HAWAIIROOMINFO;

INSERT INTO HAWAIIROOMINFO VALUES(
        (SELECT NVL(MAX(room_no),0)+1 FROM HAWAIIROOMINFO),
        '대전', '킹', '빈방');
INSERT INTO HAWAIIROOMINFO VALUES(
        (SELECT NVL(MAX(room_no),0)+1 FROM HAWAIIROOMINFO),
        '서울', '더블', '투숙');
INSERT INTO HAWAIIROOMINFO VALUES(
        (SELECT NVL(MAX(room_no),0)+1 FROM HAWAIIROOMINFO),
        '서울', '킹', '청소');
INSERT INTO HAWAIIROOMINFO VALUES(
        (SELECT NVL(MAX(room_no),0)+1 FROM HAWAIIROOMINFO),
        '서울', '킹', '공사');


COMMIT;
SELECT *
FROM HAWAIIROOMINFO
WHERE room_status = '빈방';

SELECT room_pl
FROM HAWAIIROOMINFO
GROUP BY room_pl;

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'hawaiiroominfo';


SELECT room_type
FROM HAWAIIROOMINFO
WHERE room_pl = '서울';

SELECT *
FROM HAWAIIROOMINFO;

DESC HAWAIIROOMINFO;

SELECT room_type
FROM HAWAIIROOMINFO
GROUP BY room_type;

SELECT * 
FROM HawaiiRoomInfo;

SELECT *
FROM headRoomInfo;

SELECT head.room_pl
FROM HawaiiRoomInfo hawaii , headRoomInfo head
WHERE hawaii.room_no = head.room_no
GROUP BY head.Room_Pl, hawaii.room_pl;

SELECT *
FROM HawaiiRoomInfo hawaii , headRoomInfo head
WHERE hawaii.room_no = head.room_no;

SELECT head.room_pl, hawaii.room_pl
FROM HawaiiRoomInfo hawaii , headRoomInfo head
WHERE hawaii.room_no = head.room_no;
GROUP BY head.room_pl;

SELECT *
FROM headRoomInfo;
DESC headRoomInfo;


SELECT head.room_pl
FROM headRoomInfo head 
JOIN HawaiiRoomInfo hawaii ON hawaii.room_no = head.room_no
GROUP BY head.room_pl;


DESC HawaiiRoomInfo;

SELECT room_type
		FROM HAWAIIROOMINFO
        WHERE room_pl = '하와이'
		GROUP BY room_type;
		
SELECT product.pid, product.pnm, sum(cycle.cnt)cnt
FROM cycle, product
WHERE cycle.pid = product.pid
GROUP BY product.pid, product.pnm
ORDER BY product.pnm ;

SELECT head.room_pl
FROM HawaiiRoomInfo hawaii , headRoomInfo head
WHERE hawaii.room_no = head.room_no;
GROUP BY head.room_pl;

SELECT hawaii.room_pl
FROM hawaiiroominfo hawaii
UNION
SELECT head.room_pl
FROM headroominfo head;

SELECT *
FROM hawaiiroominfo hawaii, headroominfo head
WHERE hawaii.room_no = head.room_no
AND hawaii.room_pl = '하와이';


SELECT *
FROM hawaiiroominfo hawaii
WHERE hawaii.room_status = '빈방'
UNION
SELECT *
FROM headroominfo head
WHERE head.room_status = '빈방';


SELECT *
FROM hawaiiroominfo hawaii
WHERE hawaii.room_status = '빈방'
AND hawaii.room_pl = null
UNION
SELECT *
FROM headroominfo head
WHERE head.room_status = '빈방'
AND head.room_pl = '본점';

SELECT *
FROM hawaiiroominfo hawaii
WHERE hawaii.room_status = '빈방'
UNION
SELECT *
FROM headroominfo head
WHERE head.room_status = '빈방';

SELECT room_pl
FROM hawaiiroominfo
WHERE room_status = '빈방'
UNION
SELECT room_pl
FROM headroominfo
WHERE room_status = '빈방';


SELECT room_type
FROM hawaiiroominfo
WHERE room_status = '빈방'
AND room_pl = '하와이'
UNION
SELECT room_type
FROM headroominfo
WHERE room_status = '빈방'
AND room_pl = '';

SELECT room_type
FROM hawaiiroominfo
WHERE room_status = '빈방'
AND room_pl = '하와이'
GROUP BY room_type
UNION
SELECT room_type
FROM headroominfo
WHERE room_status = '빈방'
AND room_pl = ''
GROUP BY room_type;

SELECT room_type
FROM hawaiiroominfo
WHERE room_status = '빈방'
AND room_pl = '하와이'
GROUP BY room_type
UNION
SELECT room_type
FROM headroominfo
WHERE room_status = '빈방'
AND room_pl = ''
GROUP BY room_type;

SELECT room_no
FROM hawaiiroominfo
WHERE room_status = '빈방'
AND room_pl = '하와이'
AND room_type = '더블'
UNION
SELECT room_no
FROM headroominfo
WHERE room_status = '빈방'
AND room_pl = ''
AND room_type = '';

SELECT room_no
FROM hawaiiroominfo
WHERE room_status = '빈방'
AND room_pl = '본점'
AND room_type = '싱글'
GROUP BY room_no
UNION
SELECT room_no
FROM headroominfo
WHERE room_status = '빈방'
AND room_pl = '본점'
AND room_type = '싱글'
GROUP BY room_no;

DESC headroominfo;

SELECT *
FROM RESVLOG
ORDER BY resev_date;

DESC RESVLOG;

INSERT INTO RESVLOG VALUES(
        #RESEV_NO#
        ,#ROOM_IN#
        ,#ROOM_OUT#
        ,#MEM_ID#
        ,#ROOM_NO#
        ,#ROOM_PL#
        ,#ROOM_TYPE#
        ,#ROOM_NUM#
        ,#RESEV_STATE#
        ,SYSDATE
        );

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'resvlog';

DESC resvlog;

SELECT *
FROM resvlog;

INSERT INTO RESVLOG VALUES(
	        resvlog_seq.nextval
	        ,sysdate
	        ,sysdate
	        ,'test'
	        ,'201'
	        ,'본점'
	        ,'싱글'
	        ,'201'
	        ,'예약'
	        ,SYSDATE);

SELECT *
FROM memberinfo;
resvlog_seq.nextval

COMMIT;

SELECT *
FROM memberinfo;
DESC memberinfo;

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'memberinfo';

select mem_id, mem_pass
from memberinfo
where mem_id = '2'
and mem_pass = '2';

Update Tbl Set Tbl.N = Tbl.N+1;

update memberinfo set mem_name = '123이다.',
        mem_name = , mem_tel = , 
        mem_addr = , mem_email = 
where mem_id ='qwe12312';

select *
from memberinfo;
DESC memberinfo;
commit;

select *
from memberinfo;

select *
from admininfo;

insert into memberinfo values(
			'qqqq','1234','김강영',to_date('19960514', 'yyyymmdd'),
			'000000','대전어딘가에','kgy9466@naver.com','3');

insert Into T(C) Values(S);

select 
mem_id, mem_pass, mem_name, to_char(mem_bir, 'yyyy-mm-dd'),
mem_tel, mem_addr, mem_email, power
from memberinfo;

SELECT * 
FROM nls_session_parameters 
WHERE PARAMETER LIKE '%DATE%' 
OR PARAMETER LIKE '%LANG%'; 

commit;

SELECT *
FROM resvlog;
DESC resvlog;

DESC hawaiiroominfo;

select *
from hawaiiroominfo;

select *
from headroominfo;
commit;
UPDATE hawaiiroominfo set room_status = '빈방' 
		where room_no = '201'
UPDATE headroominfo set room_status = '빈방' 
		where room_no = '201';
        
Update Tbl Set Tbl.N = Tbl.N+1;

update (
    select  hawai.room_status as hawai.room_status, 
            head.room_status as head.room_status
    from hawaiiroominfo hawai,
        headroominfo head
    where hawai.room_no = head.room_no
    )
    set hawai.room_status = '공사',
        head.room_status = '공사'
    where hawai.room_no = '201'
    and head.room_no = '201'
    and head.room_pl = '본점'
    and head.room_type = '싱글'
    and hawai.room_pl = '본점'
    and hawai.room_type = '싱글';

update hawaiiroominfo as hawai, 
        headroominfo as head
    set hawai.room_status = '공사',
        head.room_status = '공사'
    where hawai.room_no = '201'
    and head.room_no = '201'
    and head.room_pl = '본점'
    and head.room_type = '싱글'
    and hawai.room_pl = '본점'
    and hawai.room_type = '싱글';

update hawaiiroominfo hawai
    right join headroominfo head 
    on(head.room_no = hawai.room_no)
    set hawai.room_status = '공사',
        head.room_status = '공사'
    where hawai.room_no = '201'
    and head.room_no = '201'
    and head.room_pl = '본점'
    and head.room_type = '싱글'
    and hawai.room_pl = '본점'
    and hawai.room_type = '싱글';
    

update ( 
    select hawaiiroominfo.room_status, headroominfo.room_status
    from hawaiiroominfo
    join headroominfo
    on hawaiiroominfo.room_no = headroominfo.room_no
    where hawaiiroominfo.room_no='201'
    and hawaiiroominfo.room_pl = '본점'
    )
    set hawaiiroominfo.room_status = '공사',
    headroominfo.room_status = '공사';
select *
from headroominfo
order by room_no;
desc headroominfo;
commit;

select *
from hawaiiroominfo
order by room_no;

select *
from resvlog
where resev_state = '결제'
and to_char(resev_date, 'yyyymm') = '202012';

resev_no, room_in, room_out, 
mem_id, room_pl, room_no, 
room_type, room_num, resev_state, resev_date;

Insert Into P Values (1);

delete hawaiiroominfo where room_no = '212';


SELECT ename, job, sal,
        CASE
            WHEN job = 'SALESMAN' THEN sal * 1.05
            WHEN job = 'MANAGER' THEN sal * 1.10
            WHEN job = 'PRESIDENT' THEN sal * 1.20
            ELSE sal
        END sal_b,
        DECODE(job,
                    'SALESMAN', sal * 1.05,
                    'MANAGER', sal * 1.10,
                    'PRESIDENT', sal * 1.20,
                    sal) sal_decode
FROM emp;

select resev_no, room_in, room_out,
        mem_id, room_pl, room_no,
        room_type, room_num, resev_state, resev_date,
        case
            when room_type = '싱글' then room_type = '10000'
            when room_type = '더블' then room_type = '20000'
            when room_type = '스위트' then room_type = '40000'
            else room_type
        end room_type_a
from resvlog
where resev_state = '결제'
and to_char(resev_date, 'yyyymm') = '202012';

desc resvlog;

select *
from headroominfo;


select resev_no, room_in, room_out,
        mem_id, room_pl, room_no,
        room_type, room_num, resev_state, resev_date,
        room_type as money
from resvlog
where resev_state = '결제'
and to_char(resev_date, 'yyyymm') = '202012';

select resev_no, room_in, room_out,
        mem_id, room_pl, room_no,
        room_type, room_num, resev_state, resev_date,
        case
            when room_type = '싱글' then 10000
            when room_type = '더블' then 20000
            when room_type = '스위트' then 40000
            end money
from resvlog
where resev_state = '결제'
and to_char(resev_date, 'yyyymm') = '202012';

SELECT empno, ename, deptno,
        DECODE(deptno,
                10, 'ACCOUNTING',
                20, 'RESEARCH',
                30, 'SALES',
                40, 'OPERATIONS',
                'DDIT')dname,
        CASE
            WHEN deptno = 10 THEN 'ACCOUNTING'
            WHEN deptno = 20 THEN 'RESEARCH'
            WHEN deptno = 30 THEN 'SALES'
            WHEN deptno = 30 THEN 'OPERATIONS'
            ELSE 'DDIT'
        END dname_1
FROM emp;

select resev_no, room_in, room_out,
        mem_id, room_pl, room_no,
        room_type, room_num, resev_state, resev_date,
        case
            when room_type = '싱글' then 10000
            when room_type = '더블' then 20000
            when room_type = '스위트' then 40000
            end money
from resvlog
where resev_state = '결제'
and to_char(resev_date, 'yyyymm') = '202012';
select max(room_no)
from resvlog;
 select *
 from(select case
                when room_type = '싱글' then 10000
                when room_type = '더블' then 20000
                when room_type = '스위트' then 40000
                end money
    from resvlog
    where resev_state = '결제'
    and to_char(resev_date, 'yyyymm') = '202012') money
where resev_state = '결제'
and to_char(resev_date, 'yyyymm') = '202012';


select resev_no, room_in, room_out,
        mem_id, room_pl, room_no,
        room_type, room_num, resev_state, resev_date,
        case
            when room_type = '싱글' then 10000
            when room_type = '더블' then 20000
            when room_type = '스위트' then 40000
            end money
from resvlog
where resev_state = '결제'
and to_char(resev_date, 'yyyymm') = '202012';
group by rollup(money);

select a.resev_no, a.room_in, a.room_out,
        a.mem_id, a.room_pl, a.room_no,
        a.room_type, a.room_num, a.resev_state, a.resev_date,
        a.sales, sum(a.sales)
from
    (select resev_no, room_in, room_out,
        mem_id, room_pl, room_no,
        room_type, room_num, resev_state, resev_date,
            case
                when room_type = '싱글' then 10000
                when room_type = '더블' then 20000
                when room_type = '스위트' then 40000
                end sales
    from resvlog) a
where a.resev_state = '결제'
and to_char(a.resev_date, 'yyyymm') = '202012'
group by rollup (a.resev_no, a.room_in, a.room_out,
        a.mem_id, a.room_pl, a.room_no,
        a.room_type, a.room_num, a.resev_state, a.resev_date,
        a.sales);


select a.resev_no, a.room_in, a.room_out,
        a.mem_id, a.room_pl, a.room_no,
        a.room_type, a.room_num, a.resev_state, a.resev_date,
        a.sales
from
    (select resev_no, room_in, room_out,
        mem_id, room_pl, room_no,
        room_type, room_num, resev_state, resev_date,
            case
                when room_type = '싱글' then 10000
                when room_type = '더블' then 20000
                when room_type = '스위트' then 40000
                end sales
    from resvlog) a
where a.resev_state = '결제'
and to_char(a.resev_date, 'yyyymm') = '202012';

select (case
            when room_type = '싱글' then 10000
            when room_type = '더블' then 20000
            when room_type = '스위트' then 40000
            end) money
from resvlog
group by rollup money;


WITH money AS
( 
    select (case
                when room_type = '싱글' then 10000
                when room_type = '더블' then 20000
                when room_type = '스위트' then 40000
                end) sales
    from resvlog
    where resev_state = '결제'
    and to_char(resev_date, 'yyyymm') = '202012'
    union all
    select room_type
    from resvlog
    where resev_state = '결제'
    and to_char(resev_date, 'yyyymm') = '202012'
)
select *
from money;
select room_type, sales, sum(sales) salesALL
from money;
group by rollup (sales);
union
select *
from resvlog;

WITH money AS
( 
    select room_no, (case
                when room_type = '싱글' then 10000
                when room_type = '더블' then 20000
                when room_type = '스위트' then 40000
                end) sales
    from resvlog
 
)
select m.room_no, m.sales, sum(m.sales) salesALL
from money m
group by rollup (m.room_no, m.sales);
union
select *
from resvlog;

   where resev_state = '결제'
    and to_char(resev_date, 'yyyymm') = '202012'


WITH money AS
( 
    select room_no, (case
                when room_type = '싱글' then 10000
                when room_type = '더블' then 20000
                when room_type = '스위트' then 40000
                end) sales
    from resvlog
    where resev_state = '결제'
    and to_char(resev_date, 'yyyymm') = '202012'
)
select NVL(res.room_no,0), NVL(res.room_type,0), NVL(res.room_pl,0), NVL(res.resev_state,0),NVL(m.sales,0), NVL(sum(m.sales),0) salesALL
from money m, resvlog res
where res.room_no = m.room_no
and res.resev_state = '결제'
and to_char(res.resev_date, 'yyyymm') = '202012'
group by rollup (res.room_no, res.room_type, res.room_pl, res.resev_state, m.sales);


group by (res.room_no, m.sales);
group by rollup (res.room_no, m.sales);

select *
from resvlog
where resev_state = '결제'
and to_char(resev_date, 'yyyymm') = '202012';

WITH money AS
( 
    select room_no, (case
                when room_type = '싱글' then 10000
                when room_type = '더블' then 20000
                when room_type = '스위트' then 40000
                end) sales
    from resvlog
    where resev_state = '결제'
    and to_char(resev_date, 'yyyymm') = '202012'
   )
select sales, sum(sales) salesALL
from money
group by rollup (sales);

select res.room_no, res.room_type, m.sales, sum(NVL(m.sales,0)) salesALL
from money m, resvlog res
where res.room_no = m.room_no
and res.resev_state = '결제'
and to_char(res.resev_date, 'yyyymm') = '202012'
group by rollup (res.room_no, res.room_type, m.sales);
group by (res.room_no, m.sales);
group by rollup (res.room_no, m.sales);


select *
from memberinfo;

commit;



















