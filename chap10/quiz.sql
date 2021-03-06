CREATE TABLE CHAP10HW_EMP AS SELECT * FROM EMP;
CREATE TABLE CHAP10HW_DEPT AS SELECT * FROM DEPT;
CREATE TABLE CHAP10HW_SALGRADE AS SELECT * FROM SALGRADE;

-- Q1. 오른쪽과 같이 CHAP10HW_DEPT 테이블에 50, 60, 70 , 80번 부서를 등록하는 SQL문을 작성하세요.

SELECT * FROM CHAP10HW_DEPT;
INSERT INTO CHAP10HW_DEPT VALUES(50, 'ORACLE', 'BUSAN');
INSERT INTO CHAP10HW_DEPT VALUES(60, 'SQL', 'ILSAN');
INSERT INTO CHAP10HW_DEPT VALUES(70, 'SELECT', 'INCHEON');
INSERT INTO CHAP10HW_DEPT VALUES(80, 'DML', 'BUNDANG');

-- Q2. 다음과 같이 CHAP10HW_EMP 테이블에 다음 8명의 사원 정보를 등록하는 SQL문을 작성하세요.

SELECT * FROM CHAP10HW_EMP;
INSERT INTO CHAP10HW_EMP VALUES(7201, 'TEST_USER1', 'MANAGER', 7788,TO_DATE('2016-01-02', 'YYYY-MM-DD'), 4500, NULL, 50);
INSERT INTO CHAP10HW_EMP VALUES(7202, 'TEST_USER2', 'CLERK', 7201, TO_DATE('2016-02-21', 'YYYY-MM-DD'), 1800, NULL, 50); 
INSERT INTO CHAP10HW_EMP VALUES(7203, 'TEST_USER3', 'ANALYST', 7201, TO_DATE('2016-04-11', 'YYYY-MM-DD'), 3400, NULL, 60);
INSERT INTO CHAP10HW_EMP VALUES(7204, 'TEST_USER4', 'SALESMAN', 7201, TO_DATE('2016-05-31', 'YYYY-MM-DD'), 2700, 300, 60);
INSERT INTO CHAP10HW_EMP VALUES(7205, 'TEST_USER5', 'CLERK', 7201, TO_DATE('2016-07-20', 'YYYY-MM-DD'), 2600, NULL, 70);
INSERT INTO CHAP10HW_EMP VALUES(7206, 'TEST_USER6', 'CLERK', 7201, TO_DATE('2016-09-08', 'YYYY-MM-DD'), 2600, NULL, 70);
INSERT INTO CHAP10HW_EMP VALUES(7207, 'TEST_USER7', 'LECTURER', 7201, TO_DATE('2016-10-28', 'YYYY-MM-DD'), 2300, NULL, 80);
INSERT INTO CHAP10HW_EMP VALUES(7208, 'TEST_USER8', 'STUDENT', 7201, TO_DATE('2018-03-09', 'YYYY-MM-DD'), 1200, NULL, 80);

-- Q3. CHAP10HW_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균 급여보다 많은 급여를 받고 있는 사원들을 70번 부서로 옮기는 SQL문을
-- 작성해보세요(다음 화면은 부서 이동 후의 CHAP10HW_EMP 테이블을 조회한 것입니다.)
UPDATE CHAP10HW_EMP
SET DEPTNO = 70
WHERE SAL > (SELECT AVG(SAL)
                FROM CHAP10HW_EMP
                WHERE DEPTNO = 50);
SELECT * FROM CHAP10HW_EMP
WHERE DEPTNO = 70;

-- Q4. CHAP10HW_EMP에 속한 사원 중, 60번 부서의 사원 중에 입사일이 가장 빠른 사원보다 늦게 입사한 사원의 급여를 10% 인상하고 80번 부서로 옮기는
-- SQL문을 작성하세요(다음 화면은 급여인상, 부서 이동 후의 CHAP10HW_EMP 테이블을 조회한 것입니다.)
UPDATE CHAP10HW_EMP
SET DEPTNO = 80,
SAL = SAL*1.1
WHERE HIREDATE > (SELECT MIN(HIREDATE)
                    FROM CHAP10HW_EMP
                    WHERE DEPTNO = 60);
SELECT * FROM CHAP10HW_EMP
WHERE DEPTNO = 80;

-- Q5. CHAP10HW_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문을 작성하세요
-- (다음 화면은 사원이 삭제된 후의 CHAP10HW_EMP 테이블을 조회한 것입니다.)
DELETE FROM CHAP10HW_EMP
WHERE EMPNO IN( SELECT E.EMPNO
                FROM CHAP10HW_EMP E, CHAP10HW_SALGRADE S
                WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                AND S.GRADE = 5);
