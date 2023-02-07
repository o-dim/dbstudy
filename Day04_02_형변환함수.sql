-- 1. 숫자로 변환하기
SELECT TO_NUMBER('100')
FROM DUAL;

-- 2-1. 숫자를 문자로 변환하기
SELECT   
         TO_CHAR(100) -- '100'
       , TO_CHAR(100, '999999') -- '   100'
       , TO_CHAR(100, '000000') -- '000100'
       , TO_CHAR(1234, '9,999') -- '1,234'
       , TO_CHAR(12345, '9,999') -- 이러면 안돼. ##### 왜냐 다섯자리를 네자리 형식에 넣었으니까
       , TO_CHAR(12345, '99,999') -- '12,345'
       , TO_CHAR(0.123, '0.00') -- '0.12' (반올림)
       , TO_CHAR(0.125, '0.00') -- 0.13
FROM     DUAL;

-- 2-2. 날짜를 문자로 변환하기(중요)
--날짜를 원하는 형식으로 변환할 때 사용한다
SELECT
        SYSDATE -- DATE 타입의 현재 날짜와 시간
      , SYSTIMESTAMP -- TIMESTAMP 타입의 현재 날짜와 시간
FROM DUAL;

SELECT 
        TO_CHAR(SYSDATE, 'YYYY-MM-DD')
      , TO_CHAR(SYSDATE, 'AM HH:MI:SS')
      , TO_CHAR(SYSDATE, 'HH24:MI:SS')
   FROM  
        DUAL;
        

-- 3. 날짜로 변환하기(TO_DATE)
SELECT 
        TO_DATE('05/06/07', 'YY/MM/DD')
      , TO_DATE('05/06/07', 'MM/DD/YY')
   FROM
        DUAL;

-- EMPLOYEES 테이블에서 2000/01/01 ~ 2005/12/31 사이에 입사한 사원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_DATE(HIRE_DATE, 'YY/MM/DD') BETWEEN TO_DATE('00/01/01', 'YY/MM/DD') AND TO_DATE('05/12/31', 'YY/MM/DD');

-- 날짜비교는 TO_DATE 함수를 이용하자
DROP TABLE SAMPLE_TBL
CREATE TABLE SAMPLE_TBL(
    DT1 DATE
);

INSERT INTO SAMPLE_TBL(DT1) VALUES(SYSDATE);
COMMIT;

-- 안됨
SELECT DT1
  FROM SAMPLE_TBL
 WHERE DT1 = TO_DATE('23/02/07', 'YY/MM/DD');


SELECT DT1
  FROM SAMPLE_TBL
 WHERE TO_DATE(DT1, 'YY/MM/DD') = TO_DATE('23/02/07', 'YY/MM/DD');
 
SELECT TO_DATE(DT1, 'YYYY-MM-DD'), -- 원하는 형식이 적용안됨
       TO_CHAR(DT1, 'YYYY-MM-DD') -- 원하는 형식이 적용됨
  FROM SAMPLE_TBL;