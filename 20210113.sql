
update users set usernm = #{usernm},
                pass = #{pass},
                reg_dt = #{reg_dt},
                alias = #{alias},
                addr1 = #{addr1},
                addr2 = #{addr2},
                zipcode = #{zipcode},
where userid = #{userid};

select *
from users;
desc users;

delete users where userid = 'a';
commit;

Insert into users(userid,usernm, pass, reg_dt, alias, addr1, addr2, zipcode) 
    values(#{},#{},#{},sysdate,#{},#{},#{},#{});

Insert into users(userid,usernm, pass, reg_dt, alias, addr1, addr2, zipcode) 
    values("test1234","test1234","test",sysdate,"실험맨",null,null,null);

Insert into users(USERID,USERNM, PASS, REG_DT, alias, ADDR1, ADDR2, ZIPCODE) 
    values("test1234","test1234","test",sysdate,"실험맨",null,null,null);

select *
from users;
desc users;

update USERS set filename ='', realfilename='';
delete users where userid = 'test_brown';
commit;

SELECT 'private ' ||
    -- 자료형이름은 NUMBER일 때만 int, 나머지는 String으로 한다.
    Decode(Lower(Data_type), 'number', 'int ', 'String ') ||
    Lower(Column_name) || ';'
FROM cols
WHERE Lower(Table_name) = 'users';

SELECT *
	    FROM
	    (SELECT ROWNUM rn, a.*
	    FROM
		        (SELECT *
		        FROM users
                where userid like '%'||''||'%'
                or usernm like '%'||''||'%'
                or alias like '%'||''||'%'
		        ORDER BY userid) a
		    WHERE ROWNUM <= 1*5)
		WHERE rn BETWEEN (1-1)*5 + 1 AND 1*5;



SELECT *
		        FROM users
                where userid like '%'||'b'||'%'
                or usernm like '%'||'b'||'%'
                or alias like '%'||'b'||'%'
		        ORDER BY userid;

SELECT *
		        FROM users
                where userid like '%'||''||'%'
                and usernm like '%'||'보'||'%'
                and alias like '%'||''||'%'
		        ORDER BY userid;

SELECT COUNT(*)
		        FROM users
                where userid like '%'||'b'||'%'
                and usernm like '%'||''||'%'
                and alias like '%'||''||'%'
		        ORDER BY userid;

SELECT *
		        FROM users
                where userid like '%'||'b'||'%'
                and usernm like '%'||''||'%'
                and alias like '%'||''||'%'
		        ORDER BY userid;

SELECT *
from users;









