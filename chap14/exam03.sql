-- 실습 14-29 테이블을 생성할 때 특정 열에 PRIMARY KEY 설정하기
CREATE TABLE TABLE_PK (
    LOGIN_ID    VARCHAR2(20) PRIMARY KEY,
    LOGIN_PWD   VARCHAR2(20) NOT NULL,
    TEL         VARCHAR2(20)
);

DESC TABLE_PK;

-- 실습 14-30 생성한 PRIMARY KEY 확인하기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE 'TABLE_PK%';

-- 실습 14-31 생성한 PRIMARY KEY를 통해 자동 생성된 INDEX 확인하기
SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME
FROM USER_INDEXES
WHERE TABLE_NAME LIKE 'TABLE_PK%';

-- 실습 14-32 제약 조건의 이름을 직접 지정하여 테이블 생성하기
CREATE TABLE TABLE_PK2 (
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLPK2_LGNID_PK UNIQUE,
    LOGIN_PWD   VARCHAR2(20) CONSTRAINT TBLPK2_LGNPW_NN NOT NULL,
    TEL         VARCHAR2(20)
);

DESC TABLE_PK2;

-- 실습 14-33 TABLE_PK 테이블에 데이터 입력하기
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL)
VALUES ('TEST_ID_01', 'PWD02', '010-2345-6789');

-- 실습 14-35 NULL 값을 명시적으로 입력하기
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL)
VALUES (NULL, 'PWD02', '010-2345-6789');

-- 실습 14-35 NULL 값을 암시적으로 입력하기
INSERT INTO TABLE_PK(LOGIN_PWD, TEL)
VALUES ('PWD02', '010-2345-6789');