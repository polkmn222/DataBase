-- 실습 15-1 SCOTT 계정으로 사용자 생성하기
CREATE USER C##ORCLSTUDY
IDENTIFIED BY ORACLE;

-- 실습 15-2 SYSTEM 사용자로 접속 후 사용자 생성하기(SQL*PLUS)
CREATE USER C##ORCLSTUDY
IDENTIFIED BY ORACLE;

-- 실습 15-3 SYSTEM 사용자로 접속 후 ORCLSTUDY 사용자에게 권한 부여하기
GRANT CREATE SESSION TO C##ORCLSTUDY;

-- 실습 15-4 사용자 정보(패스워드) 변경하기
ALTER USER C##ORCLSTUDY
IDENTIFIED BY ORCL;

-- 실습 15-5 사용자 삭제하기
DROP USER C##ORCLSTUDY;

-- 실습 15-6 사용자와 객체 모드 삭제하기
DROP USER C##ORCLSTUDY CASCADE;

-- 1분 복습. ORCLSTUDY 사용자의 패스워드를 ORASTDY로 변경하는 다음 SQL문의 코드를 채워 보세요.
ALTER USER ORCLSTUDY
IDENTIFIED BY ORASTDY;