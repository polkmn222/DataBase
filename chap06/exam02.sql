-- 실습 6-19 ROUND 함수를 사용하여 반올림된 숫자 출력하기
SELECT ROUND(1234.5678) AS ROUND,
        ROUND(1234.5678, 0) AS ROUND_0,
        ROUND(1234.5678, 1) AS ROUND_1,
        ROUND(1234.5678, 2) AS ROUND_2,
        ROUND(1234.5678, -1) AS ROUND_MINUS1,
        ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

-- 실습 6-20
SELECT TRUNC(1234.5678) AS TRUNC,
        TRUNC(1234.5678, 0) AS TRUNC_0,
        TRUNC(1234.5678, 1) AS TRUNC_1,
        TRUNC(1234.5678, 2) AS TRUNC_2,
        TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
         TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

-- 1분 복습. 다음 SQL문의 TRUNC_EX1, TRUNC_EX2, TRUNC_EX3의 결과는 각각 무엇일까요?
SELECT TRUNC(1539.125023, 4) AS TRUNC_EX1,
        TRUNC(4586.89453, 2) AS TRUNC_EX2,
        TRUNC(2560.48522, -1) AS TRUNC_EX3
FROM DUAL;

-- 실습 6-21 CEIL, FLOOR 함수로 숫자 출력하기
SELECT CEIL(3.14),
        FLOOR(3.14),
        CEIL(-3.14),
        FLOOR(-3.14)
FROM DUAL;        

-- 실습 6-22 MOD 함수를 사용하여 나머지 값 출력하기
SELECT MOD(15, 6),
        MOD(10, 2),
        MOD(11, 2)
FROM DUAL;

         
        
        