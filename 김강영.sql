실습 11
job이 SALESMANT이거나 입사일자가 1981년 6월 1이후인 다음과 같이 조회
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR hiredate >= TO_DATE('19810601', 'YYYYMMDD');

실습12
job이 SALESMANT이거나 사원번호가78로 시작하는직원정보
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno LIKE '78%';

실습 13 (LIKE사용금지)
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno >= '7800'
    AND empno < '7900';
    
실습 14
SELECT *
FROM emp
WHERE job = 'SALESMAN'
    OR empno >= '7800' AND empno < '7900'
    AND hiredate >= TO_DATE('19810601', 'YYYYMMDD');