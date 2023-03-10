-- 셀프조인
-- 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER의 FIRST_NAME 구하기
-- 1 : M 관계 파악
-- PK           FK
-- EMPLOYEE_ID  MANAGER_ID

-- 조인조건 파악
-- 하나는 사원 테이블(E)로 하나는 매니저 테이블(M)로 보기
-- 사원들의 매니저번호       -     매니저의 사원번호
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, M.FIRST_NAME
  FROM EMPLOYEES E INNER JOIN EMPLOYEES M
    ON E.MANAGER_ID = M.EMPLOYEE_ID
 ORDER BY E.EMPLOYEE_ID;
 
 

-- 셀프 조인 연습
-- 각 사원 중에서 매니저보다 먼저 입사한 사원을 조회하시오
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.HIRE_DATE AS 입자일자
     , M.FIRST_NAME, M.HIRE_DATE AS 매니저입자일자
FROM EMPLOYEES E INNER JOIN EMPLOYEES M
ON E.MANAGER_ID = M.EMPLOYEE_ID
WHERE TO_DATE(E.HIRE_DATE, 'YY/MM/DD') < TO_DATE(M.HIRE_DATE, 'YY/MM/DD')
ORDER BY E.EMPLOYEE_ID;

-- PK FK 가 아닌 일반 칼럼을 이용한 셀프 조인
-- 동일한 부서에서 근무하는 사원들을 조인하기 위해 DEPARTMENT_ID로 조인
-- 사원(나)        사원(남)
-- EMPLOYEES ME  EMPLOYEES YOU

-- 문제, 같은 부서에서 근무하는 사원 중에서 나보다 SALARY가 높은 사원 정보를 조회하시오
SELECT ME.EMPLOYEE_ID, ME.FIRST_NAME, ME.SALARY AS 내급여
     , YOU.FIRST_NAME, YOU.SALARY AS 너급여
     , ME.DEPARTMENT_ID, YOU.DEPARTMENT_ID
FROM EMPLOYEES ME INNER JOIN EMPLOYEES YOU
ON ME.DEPARTMENT_ID = YOU.DEPARTMENT_ID
WHERE ME.SALARY < YOU.SALARY
ORDER BY ME.EMPLOYEE_ID;

-- 조인연습
--1. LOCATION_ID가 1700인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME 을 조회하시오
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.LOCATION_ID
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE D.LOCATION_ID = 1700
ORDER BY E.EMPLOYEE_ID;
 
--2. dEPARTMENT_NAME이 'Executive'인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME을 조회하시오
SELECT E.DEPARTMENT_ID, D.DEPARTMENT_NAME, E.EMPLOYEE_ID, E.FIRST_NAME
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE DEPARTMENT_NAME LIKE 'Executive';

-- 3. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME, CITY를 조회하시오
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E 
  ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
                   INNER JOIN LOCATIONS L
  ON D.LOCATION_ID = L.LOCATION_ID;

-- 오라클 형식
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
WHERE L.LOCATION_ID = D.LOCATION_ID 
  AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;
  
  
-- 4. 부서별 DEPARTMENT_NAME과 사원수와 평균 연봉을 조회하시오
SELECT D.DEPARTMENT_NAME, COUNT(*), AVG(SALARY)
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME, D.DEPARTMENT_ID;

-- 5. 모든 사원들의 EMPLOYEE_ID FIRST_NAME, DEPARMENT_NAME 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME
FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID;

-- 5.2 오라클로
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_ID(+) = E.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID;

-- 6. 모든 부서의 DEPARTMENT_NAME과 근무중인 사원 수를 조회하시오. 근무하는 사원이 없으면 0으로 조회하기
SELECT D.DEPARTMENT_NAME, COUNT(E.EMPLOYEE_ID)
FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
ORDER BY DEPARTMENT_NAME;