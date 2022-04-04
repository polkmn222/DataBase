-- 실습 14-37 EMP 테이블과 DEPT 테이블의 제약 조건 살펴보기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('EMP', 'DEPT');

-- 실습 14-38 FOREIGN KEY가 참조하는 열에 존재하지 않는 데이터 입력하기
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (9999, '홍길동', 'CLERK', '7788', TO_DATE('2017/04/30', 'YYYY/MM/DD'), 1200, NULL, 50);

-- 실습 14-39 DEPT_FK 테이블 생성하기
CREATE TABLE DEPT_FK (
    DEPTNO  NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME   VARCHAR2(14),
    LOC     VARCHAR2(13)
);

DESC DEPT_FK;

-- 실습 14-40 EMP_FK 테이블 생성하기
CREATE TABLE EMP_FK(
    EMPNO   NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME   VARCHAR2(10),
    JOB     VARCHAR2(9),
    MGR     NUMBER(4),
    HIREDATE    DATE,
    SAL     NUMBER(7,2),
    COMM    NUMBER(7,2),
    DEPTNO  NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK (DEPTNO)
);

DESC EMP_FK;

-- 실습 14-41 EMP_KF 테이블에 데이터 삽입하기(DEPTNO 데이터가 아직 DEPT_KF 테이블에 없을 때)
INSERT INTO EMP_FK
VALUES (9999, 'TEST_NMANE', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10);

-- 실습 14-42 DEPT_FK에 데이터 삽입하기
INSERT INTO DEPT_FK
VALUES (10, 'TEST_DNAME', 'TEST_LOC');

SELECT * FROM DEPT_FK;

-- 실습 14-43 EMP_FK 테이블에 데이터 삽입하기
INSERT INTO EMP_FK
VALUES (9999, 'TEST_NMANE', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10);

SELECT * FROM EMP_FK;

-- 실습 14-44 DEPT_FK 테이블의 10번 부서 데이터 삭제하기
DELETE FROM DEPT_FK
WHERE DEPTNO = 10;

-- 1분 복습.
-- 1. 제약 조건 은 어떤 테이블에 저장할 데이터 특성을 정의하는 데 사용하는 특수한 규칙을 뜻합니다.
-- 오라클 데이터베이스에서 사용할 수 있는 1. 제약조건 은 다섯 가지가 있는데요. 지정한 열에 NULL
-- 값을 제외한 중복이 불가능한 2. UNIQUE , NULL을 허용하지 않는 3. NOT NULL , 다른 테이블의 열을 참조하는
-- 4. FOREIGN KEY, NULL 값과 데이터의 중복을 모두 허용하지 않는 5. PRIMARY KEY가 있습니다.