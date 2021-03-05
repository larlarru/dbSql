
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
select *
from mysimplecode
where owner = 'brown';

select *
from codes
where code_no = '111'
or code_no = '1';

desc codes;





















































