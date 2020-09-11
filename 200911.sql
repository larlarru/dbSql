SELECT *
FROM emp;

실습5


SELECT TO_CHAR(hiredate, 'yyyy') hire_yyyy, COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate, 'yyyy');

실습6

SELECT COUNT(*)
FROM DEPT;

실습7
직원이 속한 부서의 개수를 구하기
1. 부서가 몇개 존재 하는지?? ==> 3행

SELECT COUNT(*)
FROM
    (SELECT deptno
    FROM emp
    GROUP BY deptno) a;

SELECT COUNT(COUNT(deptno)) cnt
FROM emp
GROUP BY deptno;

실습 join0

SELECT e.empno, e.ename, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.deptno = d.deptno)
ORDER BY e.deptno;

SELECT e.empno, e.ename, e.deptno, d.dname
FROM emp e , dept d
WHERE e.deptno = d.deptno
ORDER BY e.deptno;

실습 join1
??
SELECT e.empno, e.ename, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.deptno = d.deptno)
WHERE e.deptno = 10 OR e.deptno = 30
ORDER BY e.deptno;

실습 join2

SELECT e.empno, e.ename, e.sal, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.deptno = d.deptno)
WHERE e.sal > 2500
ORDER BY e.deptno;


SELECT e.empno, e.ename, e.sal, e.deptno, d.dname
FROM emp e JOIN dept d ON ( e.deptno = d.deptno)
WHERE e.sal > 2500
    AND e.empno > 7600
    AND d.dname = 'RESEARCH'
ORDER BY e.deptno;

데이터 결합 base_table.sql, 실습 join1

erd다이어그램을 참고하여 prod 테이블과 lprod 테이블을 조인하여
다음과 같은 결과가 나오는 쿼리를 작성해보세요.

답 : 

SELECT lp.lprod_gu, lp.lprod_nm, p.prod_id, p.prod_name
FROM prod p JOIN lprod lp ON (lp.lprod_gu = p.prod_lgu)
ORDER BY lp.lprod_gu;

SELECT lp.lprod_gu, lp.lprod_nm, p.prod_id, p.prod_name
FROM prod p , lprod lp
WHERE lp.lprod_gu = p.prod_lgu
ORDER BY lp.lprod_gu;

틀렸는지 맞았는지 COUNT()로 알아보자

SELECT COUNT(*)
FROM prod;


SELECT *
FROM prod;

SELECT *
FROM LPROD;

SELECT lprod_gu, lprod_nm
FROM lprod;

SELECT prod_id,prod_name
FROM prod;

데이터 결합 실습 join2
답 : 
SELECT b.buyer_id, b.buyer_name, p.prod_id, p.prod_name
FROM prod p JOIN buyer b ON (b.buyer_id = p.prod_buyer);




SELECT COUNT(*)
FROM buyer;

SELECT COUNT(*)
FROM prod;

buyer prod prod id

id name

id name

데이터 결합 실습 join3
답 : 
ANSI-SQL
테이블 JOIN 테이블 ON ()
    join 테이블 ON ()
FROM member JOIN cart ON (mem_id = cart_member)
            JOIN prod On (cart_prod = prod_id)



답 : 
SELECT member.mem_id, member.mem_name, prod.prod_id, prod.prod_name, cart.cart_qty
FROM member, cart, prod
WHERE member.mem_id = cart.cart_member
    AND cart.cart_prod = prod.prod_id;

SELECT p.prod_id, c.cart_qty
FROM prod p JOIN cart c ON (c.cart_prod = p.prod_id);

SELECT m.mem_id, m.mem_name, c.cart_qty
FROM mem m JOIN cart c ON (c.cart_qty = m.mem_id);


SELECT *
FROM member;


SELECT *
FROM cart;


SELECT *
FROM prod;

prod_id, cart_prod

cart_member, mem_id




































