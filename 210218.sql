--table space 생성
SELECT *
FROM DBA_DATA_FILES;

CREATE TABLESPACE TS_DBSQL_DEV
DATAFILE 'D:\B_UTIL\4.ORACLE\APP\ORACLE\ORADATA\XE\TS_DBSQL_DEV.DBF' 
SIZE 100M 
AUTOEXTEND ON;


--사용자 추가
create user larlarru_dev identified by java
default tablespace TS_DBSQL_DEV
temporary tablespace temp
quota unlimited on TS_DBSQL_DEV
quota 0m on system;


--접속, 생성권한
GRANT CONNECT, RESOURCE TO larlarru_dev;










































