-- 1. 순위구하기

SELECT EMPLOYEE_ID,
       FIRST_NAME || ' ' || LAST_NAME AS NAME,
       SALARY,
       RANK() OVER(ORDER BY SALARY DESC) AS 연봉순위
FROM   EMPLOYEES;

-- 2. 분기처리
SELECT  EMPLOYEE_ID
      , FIRST_NAME
      , LAST_NAME
      , DEPARTMENT_ID
      , DECODE(DEPARTMENT_ID
            , 10,'Administration'
            , 20, 'Marketing'
            , 30, 'Purchasing'
            , 40, 'Human Resources'
            , 50, 'Shipping'
            , 60, 'IT') AS DEPARTMENT_NAME
  FROM  EMPLOYEES
 WHERE  DEPARTMENT_ID IN(10, 20, 30, 40, 50, 60);
 
-- 분기 표현식

SELECT  EMPLOYEE_ID
      , FIRST_NAME
      , LAST_NAME
      , SALARY
      , CASE
            WHEN SALARY >= 15000 THEN 'A'
            WHEN SALARY >= 10000 THEN 'B'
            WHEN SALARY >= 5000  THEN 'C'
            ELSE 'D'
        END AS GRADE
  FROM EMPLOYEES;
  
-- 행 번호 반환하기
SELECT
        ROW_NUMBER() OVER(ORDER BY SALARY DESC)
      , EMPLOYEE_ID
      , FIRST_NAME
      , LAST_NAME
      , SALARY
  FROM  EMPLOYEES;