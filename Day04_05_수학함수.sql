-- 수학함수

--제곱
SELECT POWER(2,3)
  FROM DUAL;
  
SELECT ABS(-5)
  FROM DUAL;
  
SELECT MODE(7, 3)
  FROM DUAL;

SELECT SIGN(5),
       SIGN(-5),
       SIGN(0)
  FROM DUAL;
  
SELECT SQRT(25)
  FROM DUAL;
  
SELECT CEIL(6.4),
       CEIL(-1.1)
  FROM DUAL;

SELECT FLOOR(3.4),
       FLOOR(-8.1)
  FROM DUAL;
  
SELECT ROUND(123.456), -- 정수로 반올림
       ROUND(123.456, 1), -- 소수 한자리 남기고 반올림
       ROUND(123.456, 2), --소수 두자리 남기고 반올림
       ROUND(123.456, -1), -- 일의자리 반올림
       ROUND(123.456, -2) -- 십의자리 반올림
  FROM DUAL;
  
SELECT TRUNC(123.456), -- 정수로 절사
       TRUNC(123.456, 1), -- 소수 한자리 남기고 절사
       TRUNC(123.456, 2), --소수 두자리 남기고 절사
       TRUNC(123.456, -1), -- 일의자리 절사
       TRUNC(123.456, -2)
  FROM DUAL;
  
SELECT FLOOR(-1.9),
       TRUNC(-1.9)
  FROM DUAL;
  