
desc farmdiary;

select *
from farmdiary
order by reg_dt;

insert into farmdiary values(
                    'test', 'test내용', sysdate, '맑음',
                    '4', '13', '0', '45', '20', 'brown', 'd:\\upload\\brown.png');

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'farmdiary';

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'worksteps';
SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'items';

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'codes';

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'files';

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'mysimplecode';


SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'itemmanual';

select fdiary_no, writer, content, reg_dt
				 weather, low_temp, high_temp, rainfall,
				 humid, yield, file1, file2, area, active,
				 btype_code, item_code, wstep_code
		from farmdiary
		order by reg_dt;

select *
from items;

select *
from worksteps;

desc items;
desc worksteps;
desc farmdiary;

select *
from farmdiary;

select *
from farmdiary
where reg_dt >= TO_DATE('20210227', 'YYYY-MM-DD')
and reg_dt <= TO_DATE('20210227', 'YYYY-MM-DD')
and item_code = 111
and wstep_code = 11;

select *
from farmdiary
where reg_dt >= TO_DATE('20210227', 'YYYY-MM-DD')
and reg_dt <= TO_DATE('20210227', 'YYYY-MM-DD')
or item_code = 0
or wstep_code = 0;

select TO_DATE('202102', 'YYYY-MM')
from dual;

select *
from farmdiary, bsntypes, items;

select *
from farmdiary, bsntypes, items;

desc farmdiary;

select *
from farmdiary;

select *
from farmdiary, codes;

select *
from codes
where parent_code = '100'
or parent_code = '200'
or parent_code = '300'
or parent_code = '400';

select *
from codes
where parent_code = '1'
or parent_code = '2'
or parent_code = '3'
or parent_code = '4'
or parent_code = '5'
or parent_code = '6'
or parent_code = '7';

desc farmdiary;



		select *
		from
		    (select rownum rn, a.*
		    from
		        (SELECT 
                    f.fdiary_no, f.writer, f.content,
                    f.reg_dt, f.weather, f.low_temp,
                    f.high_temp, f.rainfall, f.humid,
                    f.yield, f.area, f.file_no,
                    f.use, f.btype_code, f.wstep_code,
                    f.item_code 
                FROM farmdiary f
                JOIN codes c
                ON f.btype_code = c.code_No) a
		    where rownum <= 1*5)
		WHERE rn BETWEEN (1-1)*5 + 1 AND 1*5;

select *
		from
		    (select rownum rn, a.*
		    from
		        (SELECT 
    f.fdiary_no, f.writer, f.content,
    f.reg_dt, f.weather, f.low_temp,
    f.high_temp, f.rainfall, f.humid,
    f.yield, f.area, f.file_no,
    f.use, c.code_nm btype_code, co.code_nm wstep_code,
    cod.code_nm item_code 
FROM farmdiary f
JOIN codes c
ON f.btype_code = c.code_no
JOIN codes co
ON f.wstep_code = co.code_no
JOIN codes cod
ON f.item_code = cod.code_no
ORDER BY f.reg_dt desc) a
		    where rownum <= 1*5)
		WHERE rn BETWEEN (1-1)*5 + 1 AND 1*5;


SELECT 
    f.fdiary_no, f.writer, f.content,
    f.reg_dt, f.weather, f.low_temp,
    f.high_temp, f.rainfall, f.humid,
    f.yield, f.area, f.file_no,
    f.use, f.btype_code, f.wstep_code,
    f.item_code 
FROM farmdiary f
JOIN codes c
ON f.btype_code = c.code_No;

fdiary_no
writer
content
reg_dt
weather
low_temp
high_temp
rainfall
humid
yield
area
file_no
use
btype_code
wstep_code
item_code


SELECT 
    f.fdiary_no, f.writer, f.content,
    f.reg_dt, f.weather, f.low_temp,
    f.high_temp, f.rainfall, f.humid,
    f.yield, f.area, f.file_no,
    f.use, c.code_nm btype_code, co.code_nm wstep_code,
    cod.parent_code item_code 
FROM farmdiary f
JOIN codes c
ON f.btype_code = c.code_no
JOIN codes co
ON f.wstep_code = co.parent_code
JOIN codes cod
ON f.item_code = cod.code_no
JOIN codes c
ON c.code_no = co.code_no
group by 
     f.fdiary_no, f.writer, f.content,
    f.reg_dt, f.weather, f.low_temp,
    f.high_temp, f.rainfall, f.humid,
    f.yield, f.area, f.file_no,
    f.use, c.code_nm, co.code_nm,
    cod.parent_code 
ORDER BY f.fdiary_no;

 

SELECT 
    f.fdiary_no, f.writer, f.content,
    f.reg_dt, f.weather, f.low_temp,
    f.high_temp, f.rainfall, f.humid,
    f.yield, f.area, files.file_nm file_no,
    f.use, c.code_nm btype_code, co.code_nm wstep_code,
    cod.code_nm item_code 
FROM farmdiary f
JOIN codes c
ON f.btype_code = c.code_no
JOIN codes co
ON f.wstep_code = co.code_no
JOIN codes cod
ON f.item_code = cod.code_no
JOIN files files
ON f.file_no = files.file_no
ORDER BY f.reg_dt desc; 
 
select *
from farmdiary;
 
select *
from codes
where code_no = '111';

desc codes;

select *
from codes
where parent_code = '1';

select *
from farmdiary;

select *
			from
			(select rownum rn, a.*
			from
			( SELECT 
			    f.fdiary_no, f.writer, f.content,
			    f.reg_dt, f.weather, f.low_temp,
			    f.high_temp, f.rainfall, f.humid,
			    f.yield, f.area, f.file_no,
			    f.use, c.code_nm btype_code, co.code_nm wstep_code,
			    cod.code_nm item_code 
			FROM farmdiary f
			JOIN codes c
			ON f.btype_code = c.code_no
			JOIN codes co
			ON f.wstep_code = co.code_no
			JOIN codes cod
			ON f.item_code = cod.code_no
			ORDER BY f.reg_dt desc ) a
		where rownum &lt;= #{page}*#{pageSize})
		WHERE rn BETWEEN (#{page}-1)*#{pageSize} + 1 AND #{page}*#{pageSize}

SELECT 
    f.fdiary_no, f.writer, f.content,
    f.reg_dt, f.weather, f.low_temp,
    f.high_temp, f.rainfall, f.humid,
    f.yield, f.area, f.file_no,
    f.use, c.code_nm btype_code, co.code_nm wstep_code,
    cod.code_nm item_code 
FROM farmdiary f
JOIN codes c
ON f.btype_code = c.code_no
JOIN codes co
ON f.wstep_code = co.code_no
JOIN codes cod
ON f.item_code = cod.code_no
where f.reg_dt &gt;= TO_DATE(#{startDate }, 'YYYY-MM-DD')
	and f.reg_dt &lt;= TO_DATE(#{endDate }, 'YYYY-MM-DD')
	or f.item_code = #{item_code }
	or f.wstep_code = #{wstep_code }
ORDER BY f.reg_dt desc

desc farmdiary;

SELECT board_seq.CURRVAL 
FROM DUAL;

select *
from farmdiary
where fdiary_no = 1;

select *
from files;

desc files;

insert into files values(seq_files.NEXTVAL, file_nm, file_path, ori_table_nm, writer, ori_post_no, use);
insert into files values(seq_files.NEXTVAL, 'brwon.png', 'c:\\fdown\\', 'farmdiary', '1', null, 'Y');

desc farmdiary;

insert into farmdiary values(seq_farmdiary.NEXTVAL, writer, content, 
                        sysdate, weather, low_temp, 
                        high_temp, rainfall, humid, 
                        yield, area, file_no, use, 
                        btype_code, wstep_code, item_code);

commit;


SELECT 
		    f.fdiary_no, f.writer, f.content,
		    f.reg_dt, f.weather, f.low_temp,
		    f.high_temp, f.rainfall, f.humid,
		    f.yield, f.area, files.file_nm file_no,
		    f.use, c.code_nm btype_code, co.code_nm wstep_code,
		    cod.code_nm item_code 
		FROM farmdiary f
		JOIN codes c
		ON f.btype_code = c.code_no
		JOIN codes co
		ON f.wstep_code = co.code_no
		JOIN codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no = files.file_no
		where f.fdiary_no = 37								
		ORDER BY f.reg_dt desc;

desc mysimplecode;

select *
from farmdiary;

select *
from codes
where parent_code = 'b'
and use = 'Y';

select *
from mysimplecode;

desc mysimplecode;

select *
from mysimplecode
where owner = 'brown';

select *
from codes
where code_no = '111'
or code_no = '1';

select *
from mysimplecode;

SELECT my.my_simple_code, my.owner, c.code_nm item_code, co.code_nm bsn_code, my.alias, my.area
FROM mysimplecode my
JOIN codes c
ON my.item_code = c.code_no 
JOIN codes co
ON my.bsn_code = co.code_no
where my.owner = 'brown'
and my.my_simple_code = '1'
and my.use = 'Y'
and c.use = 'Y'
and co.use = 'Y';

where code_no = '111'
or code_no = '1';

select *
from codes;


select *
from codes
where code_nm ='물주기';

desc codes;

desc mysimplecode;

<-- db 바꾼 이후 -->
SELECT
		f.f_diary_no, f.writer, f.my_simple_code, f.content,
		f.reg_dt, f.weather, f.low_temp,
		f.high_temp, f.rainfall, f.humid,
		f.yield, f.area, files.file_nm
		file_no, c.code_nm b_type_code, co.code_nm w_step_code,
		cod.code_nm item_code
		FROM farmdiary f
		JOIN codes c
		ON f.b_type_code = c.code_no
		JOIN codes co
		ON f.w_step_code = co.code_no
		JOIN codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no = files.file_no
        WHERE f.use_yn = 'Y'
		ORDER BY f.reg_dt desc;

desc farmdiary;
desc files;
desc codes;

select *
from farmdiary;

select *
from codes;

select *
from codes
where code_no = '1'
or code_no = '11'
or code_no = '111';

SELECT
		f.f_diary_no, f.writer, f.my_simple_code, f.content,
		f.reg_dt, f.weather, f.low_temp,
		f.high_temp, f.rainfall, f.humid,
		f.yield, f.area, files.file_nm
		file_no, c.code_nm b_type_code, co.code_nm w_step_code,
		cod.code_nm item_code
		FROM farmdiary f
		JOIN codes c
		ON f.b_type_code = c.code_no
		JOIN codes co
		ON f.w_step_code = co.code_no
		JOIN codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no = files.file_no 
		ORDER BY f.reg_dt desc;

select *
from farmdiary;

select *
from codes
where code_no = '151';

select f.f_diary_no, f.writer, f.my_simple_code, 
    f.content, f.reg_dt, f.weather, f.low_temp, 
    f.high_temp, f.rainfall, f.humid, 
    f.yield, f.area, files.file_nm file_no, 
    c.code_nm b_type_code, co.code_nm w_step_code, cod.code_nm item_code
from farmdiary f
JOIN codes c
ON f.b_type_code = c.code_no
JOIN codes co
ON f.w_step_code = co.code_no
JOIN codes cod
ON f.w_step_code = cod.code_no
JOIN files files
ON f.file_no = files.file_no
where f.use_yn = 'Y'
and c.use_yn = 'Y'
and co.use_yn = 'Y'
and cod.use_yn = 'Y'
and files.use_yn ='Y';

desc files;

select *
from codes
where parent_code = '100'
or parent_code = '200'
or parent_code = '300'
or parent_code = '400'
and use_yn = 'Y';

select *
from codes;

SELECT *
		FROM
		codes
		WHERE parent_code = '1'
		OR parent_code = '2'
		OR parent_code = '3'
		OR parent_code = '4'
		OR parent_code = '5'
		OR parent_code = '6'
		OR parent_code = '7'
		AND use_yn = 'Y';
SELECT *
		FROM
		codes
		WHERE parent_code = 'b'
		AND use_yn = 'Y';

select *
from mysimplecode
where owner = 'brown'
and use_yn = 'Y';

select *
from codes
where code_no = '111'
or code_no = '1';

	SELECT my.my_simple_code, my.owner, 
		c.code_nm item_code, co.code_nm b_type_code, my.code_alias, my.area
		FROM mysimplecode my
		JOIN codes c
		ON my.item_code = c.code_no 
		JOIN codes co
		ON my.b_type_code = co.code_no
		where my.owner = 'brown'
		and my.my_simple_code = 1
		and my.use_yn = 'Y'
		and c.use_yn = 'Y'
		and co.use_yn = 'Y';

SELECT
		f.f_diary_no, f.writer, f.content, f.reg_dt,
		f.weather, f.low_temp, f.high_temp, f.rainfall, f.humid,
		f.yield,
		f.area, files.file_nm file_no, c.code_nm b_type_code, co.code_nm
		w_step_code, cod.code_nm item_code
		FROM farmdiary f
		JOIN codes c
		ON
		f.b_type_code = c.code_no
		JOIN codes co
		ON
		f.w_step_code = co.code_no
		JOIN
		codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no =
		files.file_no
		where f.reg_dt >=
		TO_DATE('20210305', 'YYYY-MM-DD')
		AND f.reg_dt <= TO_DATE('20210305', 'YYYY-MM-DD')
		OR f.item_code =
		''
		OR f.w_step_code = ''
        AND f.use_yn = 'Y'
        AND c.use_yn = 'Y'
        AND co.use_yn = 'Y'
        AND cod.use_yn = 'Y'
        AND files.use_yn = 'Y'
		ORDER BY f.reg_dt desc;

select *
from farmdiary;

	SELECT
		f.f_diary_no, f.writer, f.content,
		f.reg_dt,
		f.weather, f.low_temp,
		f.high_temp, f.rainfall, f.humid,
		f.yield, f.area, files.file_nm file_no,
		c.code_nm b_type_code, co.code_nm
		w_step_code,
		cod.code_nm item_code
		FROM farmdiary f
		JOIN codes c
		ON f.b_type_code = c.code_no
		JOIN codes co
		ON f.w_step_code = co.code_no
		JOIN codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no = files.file_no
		WHERE f.f_diary_no = 1;


desc files;

desc farmdiary;


	select f.f_diary_no, f.writer, f.my_simple_code, 
		    f.content, f.reg_dt, f.weather, f.low_temp, 
		    f.high_temp, f.rainfall, f.humid, 
		    f.yield, f.area, files.file_nm file_nm, 
		    c.code_nm b_type_code, co.code_nm w_step_code, cod.code_nm item_code
		from farmdiary f
		JOIN codes c
		ON f.b_type_code = c.code_no
		JOIN codes co
		ON f.w_step_code = co.code_no
		JOIN codes cod
		ON f.w_step_code = cod.code_no
		JOIN files files
		ON f.file_no = files.file_no
		where f.use_yn = 'Y'
		and c.use_yn = 'Y'
		and co.use_yn = 'Y'
		and cod.use_yn = 'Y'
		and files.use_yn ='Y';

SELECT
		f.f_diary_no, f.writer, f.content, f.reg_dt,
		f.weather, f.low_temp, f.high_temp, f.rainfall, f.humid,
		f.yield,
		f.area, files.file_nm file_no, c.code_nm b_type_code, co.code_nm
		w_step_code, cod.code_nm item_code
		FROM farmdiary f
		JOIN codes c
		ON
		f.b_type_code = c.code_no
		JOIN codes co
		ON
		f.w_step_code = co.code_no
		JOIN
		codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no =
		files.file_no;
		where f.reg_dt >=
		TO_CHAR(TO_DATE('20210305', 'YYYY-MM-DD'), 'YYYY/MM/DD')
		AND f.reg_dt <= TO_CHAR(TO_DATE('20210306', 'YYYY-MM-DD'),'YYYY/MM/DD')
		OR f.item_code = ''
		OR f.w_step_code = ''
        AND f.use_yn = 'Y'
        AND c.use_yn = 'Y'
        AND co.use_yn = 'Y'
        AND cod.use_yn = 'Y'
        AND files.use_yn = 'Y'
		ORDER BY f.reg_dt desc;

select TO_CHAR(TO_DATE('20210305', 'YYYY-MM-DD')+1)
from dual;

SELECT
		f.f_diary_no, f.writer, f.content, f.reg_dt,
		f.weather, f.low_temp, f.high_temp, f.rainfall, f.humid,
		f.yield,
		f.area, files.file_nm file_nm, c.code_nm b_type_code, co.code_nm
		w_step_code, cod.code_nm item_code
		FROM farmdiary f
		JOIN codes c
		ON
		f.b_type_code = c.code_no
		JOIN codes co
		ON
		f.w_step_code = co.code_no
		JOIN
		codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no =
		files.file_no;

	select f.f_diary_no, f.writer, f.my_simple_code, 
		    f.content, f.reg_dt, f.weather, f.low_temp, 
		    f.high_temp, f.rainfall, f.humid, 
		    f.yield, f.area, files.file_nm file_nm, 
		    c.code_nm b_type_code, co.code_nm w_step_code, cod.code_nm item_code
		from farmdiary f
		JOIN codes c
		ON f.b_type_code = c.code_no
		JOIN codes co
		ON f.w_step_code = co.code_no
		JOIN codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no = files.file_no
		where f.use_yn = 'Y'
		and c.use_yn = 'Y'
		and co.use_yn = 'Y'
		and cod.use_yn = 'Y'
		and files.use_yn ='Y';

SELECT my.my_simple_code, my.owner, 
		c.code_nm item_code, co.code_nm b_type_code, my.code_alias, my.area
		FROM mysimplecode my
		JOIN codes c
		ON my.item_code = c.code_no 
		JOIN codes co
		ON my.b_type_code = co.code_no
		where my.owner = 'brown'
		and my.my_simple_code = 1
		and my.use_yn = 'Y'
		and c.use_yn = 'Y'
		and co.use_yn = 'Y';

select *
from codes;

SELECT *
		FROM
		codes
		WHERE parent_code = '1'
		OR parent_code = '2'
		OR parent_code = '3'
		OR parent_code = '4'
		OR parent_code = '5'
		OR parent_code = '6'
		OR parent_code = '7'
		AND use_yn = 'Y';

desc mysimplecode;

select *
from mysimplecode;


select *
from codes;
desc codes;

select seq_mysimplecode.NEXTVAL
from dual;

select seq_files.NEXTVAL
from dual;

select seq_farmdiary.NEXTVAL
from dual;

commit;

SELECT *
FROM codes
where code_no = '1';


desc codes;

select *
from farmdiary;
desc farmdiary;

select seq_files.currval  file_no
from dual;

select seq_files.currval from dual;

select seq_files.nextval
from dual;

select *
from files;

commit;

select *
from files
order by file_no;
desc files;

select *
from mysimplecode;
desc mysimplecode;

delete mysimplecode where my_simple_code = 24;

commit;

select *
from mysimplecode;

	select f.f_diary_no, f.writer, f.my_simple_code, 
		    f.content, f.reg_dt, f.weather, f.low_temp, 
		    f.high_temp, f.rainfall, f.humid, 
		    f.yield, f.area, files.file_nm file_nm, 
		    c.code_nm b_type_code, co.code_nm w_step_code, cod.code_nm item_code
		from farmdiary f
		JOIN codes c
		ON f.b_type_code = c.code_no
		JOIN codes co
		ON f.w_step_code = co.code_no
		JOIN codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no = files.file_no
		where f.use_yn = 'Y'
		and c.use_yn = 'Y'
		and co.use_yn = 'Y'
		and cod.use_yn = 'Y'
		and files.use_yn ='Y'
        and writer = 'brown';

SELECT
		f.f_diary_no, f.writer, f.my_simple_code, f.content,
		f.reg_dt,
		f.weather, f.low_temp,
		f.high_temp, f.rainfall, f.humid,
		f.yield, f.area, files.file_nm file_nm, f.file_no,
		c.code_nm b_type_code, co.code_nm
		w_step_code,
		cod.code_nm item_code
		FROM farmdiary f
		JOIN codes c
		ON f.b_type_code = c.code_no
		JOIN codes co
		ON f.w_step_code = co.code_no
		JOIN codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no = files.file_no
		WHERE f.f_diary_no = 23;

select *
from farmdiary;

desc files;

select *
from files
order by file_no;

select *
from farmdiary
where writer = 'brown';

SELECT
		f.f_diary_no, f.writer, f.my_simple_code, f.content, f.reg_dt,
		f.weather, f.low_temp, f.high_temp, f.rainfall, f.humid,
		f.yield,
		f.area, files.file_nm file_nm, c.code_nm b_type_code, co.code_nm
		w_step_code, cod.code_nm item_code
		FROM farmdiary f
		JOIN codes c
		ON f.b_type_code = c.code_no
		JOIN codes co
		ON f.w_step_code = co.code_no
		JOIN codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no = files.file_no
		where f.reg_dt >= TO_DATE('20210308', 'YYYY-MM-DD')
		AND f.reg_dt < TO_DATE('20210309', 'YYYY-MM-DD')+1
		AND f.writer = 'brown'
		AND f.item_code = '141'
        AND f.use_yn = 'Y'
        AND c.use_yn = 'Y'
        AND co.use_yn = 'Y'
        AND cod.use_yn = 'Y'
        AND files.use_yn = 'Y'
		ORDER BY f.reg_dt desc;

select *
from farmdiary;

select *
from codes
where code_no = '141';

select f.f_diary_no, f.writer, f.my_simple_code, 
		    f.content, f.reg_dt, f.weather, f.low_temp, 
		    f.high_temp, f.rainfall, f.humid, 
		    f.yield, f.area, files.file_nm file_nm, 
		    c.code_nm b_type_code, co.code_nm w_step_code, cod.code_nm item_code
		from farmdiary f
		JOIN codes c
		ON f.b_type_code = c.code_no
		JOIN codes co
		ON f.w_step_code = co.code_no
		JOIN codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no = files.file_no
		where f.use_yn = 'Y'
		and c.use_yn = 'Y'
		and co.use_yn = 'Y'
		and cod.use_yn = 'Y'
		and files.use_yn ='Y'
		and writer = 'brown'
		ORDER BY reg_dt desc;

select *
from itemmanual;

desc itemmanual;

insert into itemmanual values(seq_itemmanual.nextval, 'admin', 'test1', sysdate, 0, '','Y');

	select *
		from codes
		where parent_code = '100'
		or parent_code = '200'
		or parent_code = '300'
		or parent_code = '400'
		and use_yn = 'Y';

desc codes;

select *
from farmdiary;

select f.f_diary_no, f.writer, f.my_simple_code, 
		    f.reg_dt, f.weather, f.low_temp, 
		    f.high_temp, f.rainfall, f.humid, 
		    f.yield, f.area, c.code_nm b_type_code, cod.code_nm item_code
		from farmdiary f
		JOIN codes c
		ON f.b_type_code = c.code_no
		JOIN codes co
		ON f.w_step_code = co.code_no
		JOIN codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no = files.file_no
		where f.use_yn = 'Y'
		and c.use_yn = 'Y'
		and co.use_yn = 'Y'
		and cod.use_yn = 'Y'
		and files.use_yn ='Y'
        and f.yield > 0
		and writer = 'brown'
		ORDER BY reg_dt desc;
        
select *
from codes
where code_no = '54';

select *
from farmdiary;

select *
		from codes
		where parent_code = '100'
		or parent_code = '200'
		or parent_code = '300'
		or parent_code = '400'
		and use_yn = 'Y';

select *
from farmdiary
order by reg_dt;

select *
from files
order by file_no;

select *
from mysimplecode
order by my_simple_code;

delete mysimplecode where my_simple_code = 105;

commit;

select *
from codes;

update files set use_yn = 'Y';

select *
from files;

commit;

update farmdiary set use_yn = 'Y';

select *
from codes;

select f.f_diary_no, f.writer, f.my_simple_code, mysim.code_alias code_alias, 
		    f.content, f.reg_dt, f.weather, f.low_temp, 
		    f.high_temp, f.rainfall, f.humid, 
		    f.yield, f.area, files.file_nm file_nm, 
		    c.code_nm b_type_code, co.code_nm w_step_code, cod.code_nm item_code
		from farmdiary f
		JOIN codes c
		ON f.b_type_code = c.code_no
		JOIN codes co
		ON f.w_step_code = co.code_no
		JOIN codes cod
		ON f.item_code = cod.code_no
		JOIN files files
		ON f.file_no = files.file_no
        JOIN mysimplecode mysim
        ON f.my_simple_code = mysim.my_simple_code
		where f.use_yn = 'Y'
		and c.use_yn = 'Y'
		and co.use_yn = 'Y'
		and cod.use_yn = 'Y'
		and files.use_yn ='Y'
        and mysim.use_yn = 'Y'
		and writer = 'brown'
		ORDER BY reg_dt desc;

select *
from mysimplecode;

select *
from farmdiary
where writer = 'brown';

select *
from files
order by file_no;

select seq_files.carrival from dual;

select seq_files.nextval
from dual;

select *
from codes
where parent_code in 
    (select code_no
    from codes
    where parent_code = 
        (select code_no
        from codes
        where parent_code = 'i'))
and use_yn = 'Y'        
    ;

select *
    from codes
    where parent_code = 
        (select code_no
        from codes
        where parent_code = 'i');


select *
from codes
where parent_code = 'b';


select *
from codes
where parent_code = '1';

select *
from codes
where parent_code = (select code_no
                        from codes
                        where code_nm = '생산');
                               

select *
from mysimplecode;

select *
from codes;

select *
		from codes
		where parent_code in 
		    (select code_no
		    from codes
		    where parent_code = 
		        (select code_no
		        from codes
		        where parent_code = 'i')
		    and code_no = '100')
		and use_yn = 'Y';

select *
from codes
where parent_code = 
    (select code_no
    from codes
    where parent_code = 'i');
      
	select 
			code_no
			,code_nm
			,parent_code
		from codes
		where parent_code in 
		    (select code_no
		    from codes
		    where parent_code = 
		        (select code_no
		        from codes
		        where parent_code = 'i')
		    and code_no = '100')
		and use_yn = 'Y';

select *
from itemmanual;

desc itemmanual;



insert into itemmanual values(seq_itemmanual.nextval, 'admin', '파일이름', sysdate, '0', '1', 'Y');

delete itemmanual where manual_code  = 21;

commit;

select *
from files
where file_no = 141;

SELECT i.manual_code
    , i.writer
    , i.ifm_nm
    , i.file_no
    , i.item_code
    , f.file_nm
    , c.code_nm
FROM itemmanual i
JOIN files f
ON i.file_no = f.file_no
JOIN codes c
ON i.item_code = c.code_no
WHERE i.use_yn = 'Y'
AND f.use_yn = 'Y'
AND c.use_yn = 'Y';

		SELECT i.manual_code manual_code
		    , i.writer writer
		    , i.ifm_nm ifm_nm
		    , i.file_no file_no
		    , i.item_code item_code
		    , f.file_nm file_nm
		FROM itemmanual i
		JOIN files f
		ON i.file_no = f.file_no
		JOIN codes c
		ON i.item_code = c.code_no
		WHERE i.use_yn = 'Y'
		AND f.use_yn = 'Y'
		AND c.use_yn = 'Y';

desc itemmanual;

select *
from codes
where code_no = '112';

select *
from files;

select seq_files.nextval
from dual;

commit;

SELECT i.manual_code manual_code
		    , i.writer writer
		    , i.ifm_nm ifm_nm
		    , i.file_no file_no
		    , i.item_code item_code
		    , f.file_nm file_nm
		FROM itemmanual i
		JOIN files f
		ON i.file_no = f.file_no
		JOIN codes c
		ON i.item_code = c.code_no
		WHERE i.use_yn = 'Y'
		AND f.use_yn = 'Y'
		AND c.use_yn = 'Y';


SELECT i.manual_code
		    , i.writer
		    , i.ifm_nm
		    , i.file_no
		    , i.item_code
		    , f.file_nm
		    , c.code_nm
		FROM itemmanual i
		JOIN files f
		ON i.file_no = f.file_no
		JOIN codes c
		ON i.item_code = c.code_no
		WHERE i.use_yn = 'Y'
		AND f.use_yn = 'Y'
		AND c.use_yn = 'Y'
		AND i.manual_code = 1;

select *
from itemmanual;

desc itemmanual;

select *
from market;


desc market;


SELECT 
    m.market_no
	, m.writer
	, m.head_code
	, m.title
	, m.item_code
	, m.content
	, m.price
	, m.reg_dt
	, m.thumbnail
    , m.mobile
	, m.hit
    , c.code_nm code_nm
FROM market m
JOIN codes c
ON m.item_code = c.code_no
WHERE m.use_yn = 'Y'
AND c.use_yn = 'Y';

JOIN marketfiles mf
ON m.thumbnail = mf.file_record_no


select *
from market;

desc market;

desc marketfiles;

select seq_marketfiles.nextval
from dual;

select seq_market.nextval
from dual;


insert into marketfiles values(seq_marketfiles.nextval, 0, 0, 'Y');

select *
from codes
where parent_code in (
    select code_no
    from codes
    where parent_code =  (
        select code_no
        from codes
        where parent_code = 'i'))
and use_yn = 'Y';

SELECT 
		    m.market_no
			, m.writer
			, m.head_code
			, m.title
			, m.item_code
			, m.content
			, m.price
			, m.reg_dt
			, m.thumbnail
		    , m.mobile
			, m.hit
		    , c.code_nm code_nm
		FROM market m
		JOIN codes c
		ON m.item_code = c.code_no
		WHERE m.use_yn = 'Y'
		AND c.use_yn = 'Y'
		ORDER BY reg_dt desc;


SELECT 
    m.market_no
	, m.writer
	, m.head_code
	, m.title
	, m.item_code
	, m.content
	, m.price
	, m.reg_dt
	, m.thumbnail
	, m.mobile
	, m.hit
    , m.thumbnail 
	, c.code_nm code_nm
FROM market m
JOIN codes c
ON m.item_code = c.code_no
WHERE writer = 'brown'
AND m.market_no = '1'
AND m.use_yn = 'Y'
AND c.use_yn = 'Y';

update market set hit = hit+1 where market_no = 1;

desc market;

select *
from marketfiles;
where market_no = ;

desc marketfiles;

select *
from codes;

select *
from codes
where parent_code in (
select code_no
from codes
where parent_code = 'mhead');

select *
from codes
where parent_code = 'mhead'
and use_yn = 'Y';

select *
from codes
where parent_code in (
select code_no
from codes
where parent_code = 'i');

select *
from market;

desc market;

select *
from files
order by file_no desc;

SELECT 
		    m.market_no
			, m.writer
			, m.head_code
			, m.title
			, m.item_code
			, m.content
			, m.price
			, m.reg_dt
			, m.thumbnail
		    , m.mobile
			, m.hit
		    , c.code_nm code_nm
		FROM market m
		JOIN codes c
		ON m.item_code = c.code_no
		WHERE m.use_yn = 'Y'
		AND c.use_yn = 'Y'
		ORDER BY reg_dt desc;

	SELECT my.my_simple_code, my.owner, 
		c.code_nm item_code, co.code_nm b_type_code, my.code_alias, my.area
		FROM mysimplecode my
		JOIN codes c
		ON my.item_code = c.code_no 
		JOIN codes co
		ON my.b_type_code = co.code_no
		where my.owner = '1'
		and my.my_simple_code = 41
		and my.use_yn = 'Y'
		and c.use_yn = 'Y'
		and co.use_yn = 'Y';

select *
		from codes
		where parent_code in (select code_no
		                        from codes
		                        where code_nm = '기타')
		AND use_yn = 'Y';

	SELECT 
		    m.market_no
			, m.writer
			, m.head_code
			, m.title
			, m.item_code
			, m.content
			, m.price
			, m.reg_dt
			, m.thumbnail
		    , m.mobile
			, m.hit
		    , c.code_nm item_code_nm
            , co.code_nm head_code_nm
		FROM market m
		JOIN codes c
		ON m.item_code = c.code_no
        JOIN codes co
        ON m.head_code = co.code_no
		WHERE m.use_yn = 'Y'
		AND c.use_yn = 'Y'
		ORDER BY reg_dt desc;

SELECT 
    m.file_record_no
    , m.market_no
    , m.file_no
    , f.file_nm
FROM marketfiles m
JOIN files f
ON m.file_no = f.file_no
WHERE market_no = 28;
AND m.use_yn = 'Y'
AND f.use_yn = 'Y';

desc marketfiles;

select *
from market;


desc files;

SELECT 
		    m.market_no
			, m.writer
			, m.head_code
			, m.title
			, m.item_code
			, m.content
			, m.price
			, m.reg_dt
			, m.thumbnail
		    , m.mobile
			, m.hit
		    , c.code_nm item_code_nm
            , co.code_nm head_code_nm
            , f.file_nm thumbnail_file_nm
		FROM market m
		JOIN codes c
		ON m.item_code = c.code_no
        JOIN codes co
        ON m.head_code = co.code_no
        JOIN files f
        ON m.thumbnail = f.file_no
		WHERE 1=1
        AND m.use_yn = 'Y'
		AND c.use_yn = 'Y'
        AND f.use_yn = 'Y';
        AND m.item_code = '112'
        AND m.title like '%'||'찹'||'%'
		ORDER BY reg_dt desc;

select *
from files
where file_no = 0;

select *
from marketfiles;

select *
from market;

select *
from market m
JOIN files f
ON m.thumbnail = f.file_no;

SELECT 
		    m.market_no
			, m.writer
			, m.head_code
			, m.title
			, m.item_code
			, m.content
			, m.price
			, m.reg_dt
			, m.thumbnail
		    , m.mobile
			, m.hit
		    , c.code_nm item_code_nm
            , co.code_nm head_code_nm
            , f.file_nm thumbnail_file_nm
		FROM market m
		JOIN codes c
		ON m.item_code = c.code_no
        JOIN codes co
        ON m.head_code = co.code_no
        JOIN files f
        ON m.thumbnail = f.file_no
		WHERE 1=1
        AND m.use_yn = 'Y'
		AND c.use_yn = 'Y'
		AND writer = 'brown'
		AND m.market_no = 28
		ORDER BY reg_dt desc;

select *
from marketfiles;

select *
from files;


SELECT *
FROM files f
JOIN market m
ON f.file_no = m.thumbnail
where file_nm = 'test.jpg'
and m.market_no = 28
and f.use_yn = 'Y'
and m.use_yn = 'Y';

SELECT 
		    m.file_record_no
		    , m.market_no
		    , m.file_no
		    , f.file_nm
		FROM marketfiles m
		JOIN files f
		ON m.file_no = f.file_no
		WHERE market_no = 28
		AND m.use_yn = 'Y'
		AND f.use_yn = 'Y';

select *
from files;

SELECT 
		    m.file_record_no
		    , m.market_no
		    , m.file_no
		    , f.file_nm
		FROM marketfiles m
		JOIN files f
		ON m.file_no = f.file_no
		WHERE market_no = 27
		AND m.use_yn = 'Y'
		AND f.use_yn = 'Y';

SELECT 
		    m.file_record_no
		    , m.market_no
		    , m.file_no
		    , f.file_nm
		FROM marketfiles m
		JOIN files f
		ON m.file_no = f.file_no
		WHERE f.file_no = 41
		AND m.use_yn = 'Y'
		AND f.use_yn = 'Y';     

SELECT f.file_no
		FROM files f
		JOIN market m
		ON f.file_no = m.thumbnail
		where f.use_yn = 'Y'
		and m.use_yn = 'Y'
and file_nm = 'TESTNAME'
and m.market_no = 41;

select *
from market;

select *
from files
where file_no = 31;

desc marketreply;

seq_marketreply;
		        
select *
from marketreply;








































        