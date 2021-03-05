
CREATE TABLE "USERS" 
   (        "USERID" VARCHAR2(20 BYTE), 
        "USERNM" VARCHAR2(20 BYTE), 
        "PASS" VARCHAR2(100 BYTE), 
        "REG_DT" DATE, 
        "ALIAS" VARCHAR2(50 BYTE), 
        "ADDR1" VARCHAR2(50 BYTE), 
        "ADDR2" VARCHAR2(50 BYTE), 
        "ZIPCODE" VARCHAR2(5 BYTE), 
        "FILENAME" VARCHAR2(50 BYTE), 
        "REALFILENAME" VARCHAR2(200 BYTE), 
         CONSTRAINT "PK_USER" PRIMARY KEY ("USERID")
    );

Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('cony','코니','conyPass',to_date('2020/10/21 00:00:00','YYYY/MM/DD HH24:MI:SS'),'토끼','실험수정1','실험수정2',null,null,null);
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('sally','샐리','sallyPass',to_date('2020/10/21 00:00:00','YYYY/MM/DD HH24:MI:SS'),'병아리',null,null,null,null,null);
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('james','제임스','jamesPass',to_date('2020/10/21 00:00:00','YYYY/MM/DD HH24:MI:SS'),'사람',null,null,null,null,null);
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('moon','문','moonPass',null,'달',null,null,null,null,null);
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('leonard','레너드','leonardPass',to_date('2020/10/15 00:00:00','YYYY/MM/DD HH24:MI:SS'),'개구리',null,null,null,null,null);
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('edward','에드워드','edwardPass',to_date('2020/10/15 00:00:00','YYYY/MM/DD HH24:MI:SS'),'애벌레',null,null,null,null,null);
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('jessica','제시카','jessicaPass',to_date('2020/10/15 00:00:00','YYYY/MM/DD HH24:MI:SS'),'고양이','서울 강서구 강서로 375','11','07803','brown.png','4f6ca6c5-5f97-4fb3-b8db-02c54d9f4c43.png');
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('boss','보스','bossPass',to_date('2020/10/15 00:00:00','YYYY/MM/DD HH24:MI:SS'),'사람',null,null,null,'cony.png','d:\upload\cony.png');
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('choco','초코','chocoPass',to_date('2020/10/15 00:00:00','YYYY/MM/DD HH24:MI:SS'),'곰2_2',null,null,null,'brown.png','a9f576a2-4341-4dfd-a893-9308bce92d61.png');
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('pangyo','팡요','pangyoPass',to_date('2020/10/15 00:00:00','YYYY/MM/DD HH24:MI:SS'),'판다',null,null,null,null,null);
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('muzi','무지','muziPass',to_date('2020/10/15 00:00:00','YYYY/MM/DD HH24:MI:SS'),'토끼',null,null,null,null,null);
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('con','콘','conPass',to_date('2020/10/15 00:00:00','YYYY/MM/DD HH24:MI:SS'),'악어',null,null,null,null,null);
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('apeach','123','1234',to_date('2020/10/15 00:00:00','YYYY/MM/DD HH24:MI:SS'),'복숭아','부산 해운대구 APEC로 17','콩콩','48060',null,'d:\upload\');
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('ryan','라이언 ','ryanPass',to_date('2020/10/15 00:00:00','YYYY/MM/DD HH24:MI:SS'),'사자',null,null,null,null,null);
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('brown','브라운','brownPass',to_date('2020/10/21 00:00:00','YYYY/MM/DD HH24:MI:SS'),'곰',null,null,null,'brown.png','d:\\upload\\brown.png');
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('ddit','대덕인재','dditpass',to_date('2021/01/13 12:29:12','YYYY/MM/DD HH24:MI:SS'),'개발원_m','대전시 중구 중앙로 76','4층 대덕인재개발원','34940',null,null);
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('aaa',null,null,to_date('2021/02/09 15:17:34','YYYY/MM/DD HH24:MI:SS'),null,null,null,null,'ryan.png','d:\upload\ryan.png');
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('aaaa','aaaa','1234',to_date('2021/02/09 15:18:12','YYYY/MM/DD HH24:MI:SS'),'aaaa','부산 해운대구 APEC로 17','aaaa','48060','ryan.png','d:\upload\ryan.png');
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('test','test','1234',to_date('2021/02/09 09:59:52','YYYY/MM/DD HH24:MI:SS'),'test','부산 해운대구 APEC로 17','aa','48060','brown.png','d:\\upload\\brown.png');
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('test1','test1','1234',to_date('2021/02/09 10:03:37','YYYY/MM/DD HH24:MI:SS'),'test1',null,null,null,null,'d:\upload\');
Insert into USERS (USERID,USERNM,PASS,REG_DT,ALIAS,ADDR1,ADDR2,ZIPCODE,FILENAME,REALFILENAME) values ('test3','test3','1234',to_date('2021/02/09 10:05:08','YYYY/MM/DD HH24:MI:SS'),'test3',null,null,null,null,'d:\upload\');

select *
from users;

CREATE TABLE PRD_DOES_NOT_EXISTS_TABLE (
    col1 NUMBER
);
commit;






















































