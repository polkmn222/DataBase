-- 실습 7-20 GROUP BY절과 HAVING절을 사용하여 출력하기
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

-- 실습 7-21 HAVING절 대신 WHERE절을 잘못 사용했을 경우
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE AVG(SAL) >= 2000
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- 실습 7-22 WHERE절을 사용하지 않고 HAVING절만 사용한 경우
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

-- 실습 7-23 WHERE절과 HAVING절을 모두 사용한 경우
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

-- 1분 복습. HAVING절을 사용하여 EMP 테이블의 부서별 직책의 평균 급여가 500이상인
-- 사원들의 부서 번호, 직책, 부서별 직책의 평균 급여가 출력되도록 SQL문의 빈칸을 채워보세요.
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 500
ORDER BY DEPTNO, JOB;