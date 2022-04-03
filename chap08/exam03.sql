-- 실습 8-11 NATURAL JOIN을 사용하여 조인하기
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
        DEPTNO, D.DNAME, D.LOC
FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;

-- 실습 8-12 JOIN ~ USING을 사용하여 조인하기
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
        DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D USING(DEPTNO)
WHERE SAL >= 3000
ORDER BY DEPTNO, E.EMPNO;

-- 실습 8-13 JOIN ~ ON으로 등가 조인하기
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
        E.DEPTNO,
        D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
WHERE SAL <= 3000
ORDER BY E.DEPTNO, EMPNO;

-- 실습 8-14 왼쪽 외부 조인을 SQL-99로 작성하기
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
        E2.EMPNO AS MGR_EMPNO,
        E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

-- 실습 8-15 오른쪽 외부 조인을 SQL-99로 작성하기
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
        E2.EMPNO AS MGR_EMPNO,
        E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

-- 실습 8-16 전체 외부 조인을 SQL-99로 작성하기
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
        E2.EMPNO AS MGR_EMPNO,
        E2.ENAME AS MGR_ENAME
FROM EMP E1 FULL
OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

-- 1분 복습. 다음 SQL문은 JOIN ~ USING 키워드를 사용한 등가 조인입니다. 다음 조건에 알맞도록 SQL문의 빈칸을 채워 보세요.
-- 조건 1. EMP 테이블과 DEPT 테이블의 조인 조건은 부서 번호(DEPTNO)가 같을 때 입니다.
-- 조건 2. 급여는 3000이상이며 직속상관이 반드시 있어야 합니다.
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
        DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D USING (DEPTNO)
WHERE SAL >= 3000
AND E.MGR IS NOT NULL
ORDER BY DEPTNO, E.EMPNO;