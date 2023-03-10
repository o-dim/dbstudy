--WHERE서브쿼리
--1001사원의 POSITION과 동일한 POSITION을 가진 사람 조회하기
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
FROM EMPLOYEE_TBL
WHERE POSITION = (SELECT POSITION
                  FROM EMPLOYEE_TBL
                 WHERE EMP_NO = 101);
                 
-- 부서번호가 2인 부서와 동일한 지역에 있는 부서를 조회하시오
SELECT DEPT_NO, DEPT_NAME, LOCATION
FROM DEPARTMENT_TBL
WHERE LOCATION = (SELECT LOCATION
                FROM DEPARTMENT_TBL
                WHERE DEPT_NO = 2);
                
                
-- 3가장 높은 급여를 받는 사원을 조회하시오
SELECT 사원정보
FROM 사원
WHERE 급여 = (가장 높은 급여);

SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
FROM EMPLOYEE_TBL
WHERE SALARY = (SELECT MAX(SALARY)
                    FROM EMPLOYEE_TBL);
                    
--4. 평균 급여 이상을 받는 사원을 조회하시오
SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
FROM EMPLOYEE_TBL
WHERE SALARY > (SELECT AVG(SALARY)
                    FROM EMPLOYEE_TBL);
                
-- 5. 평균 근속 개월수 이상을 근무한 사원을 조회하시오
SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
FROM EMPLOYEE_TBL
WHERE MONTHS_BETWEEN(SYSDATE, HIRE_DATE) >= (SELECT AVG(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
                                            FROM EMPLOYEE_TBL);
                                            
-- 6. 부서번호가 2인 부서에 근무하는 사원들의 직급과 일치하는 사원을 조회하시오
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE POSITION IN (SELECT POSITION
                      FROM EMPLOYEE_TBL
                     WHERE DEPART = 2);
                     
-- 7. 부서명이 '영업부'에 근무하는 사원을 조회
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE DEPART IN (SELECT DEPT_NO
                    FROM DEPARTMENT_TBL
                   WHERE DEPT_NAME = '영업부');

-- 8. 직급이 '과장'인 사람들이 근무하는 부서정보
SELECT 부서정보
FROM 부서
WHERE 부서번호 = (직급이 '과장'인 사원들이 근무하는 부서번호);

SELECT DEPT_NO, DEPT_NAME, LOCATION
  FROM DEPARTMENT_TBL
 WHERE DEPT_NO IN (SELECT DEPART
                      FROM EMPLOYEE_TBL
                     WHERE POSITION = '과장');

-- 9. '영업부'에서 가장 높은 급여보다 더 높은 급여를 받는 사원을 조회
SELECT EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE SALARY > (SELECT MAX(SALARY)
                   FROM EMPLOYEE_TBL
                   WHERE DEPART IN (SELECT DEPT_NO
                                      FROM DEPARTMENT_TBL
                                     WHERE DEPT_NAME = '영업부'));

-- 서브쿼리를 조인으로 풀기
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE SALARY > (SELECT MAX(SALARY)
                   FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
                     ON D.DEPT_NO = E.DEPART
                  WHERE D.DEPT_NAME = '영업부');
                  
                  
-- FROM절의 서브쿼리
SELECT E.EMP_NO, E.NAME, E.DEPART
  FROM (SELECT EMP_NO, NAME, DEPART
          FROM EMPLOYEE_TBL
         ORDER BY EMP_NO) E;

--ROWID
SELECT ROWID, EMP_NO, NAME
  FROM EMPLOYEE_TBL;
  
SELECT EMP_NO, NAME
  FROM EMPLOYEE_TBL
 WHERE ROWID = 'AAAFAyAABAAALDJAAB';
 
--ROWNUM
SELECT EMP_NO, NAME
  FROM EMPLOYEE_TBL
 WHERE ROWNUM <= 2;

SELECT ROWNUM AS RN, EMP_NO, NAME
  FROM EMPLOYEE_TBL
 WHERE RN = 2; -- 실행순서가 안 맞아서 실행 불가능

SELECT E.EMP_NO, E.NAME
  FROM (SELECT ROWNUM AS RN, EMP_NO, NAME
          FROM EMPLOYEE_TBL) E
 WHERE E.RN = 2;

-- FROM절의 서브쿼리
-- 인라인 활용
-- 1. 연봉 2번째로 높은 사원 조회
-- 1) ROWNUM 사용하기
SELECT E.EMP_NO, E.NAME, E.DEPART, E.GENDER, E.POSITION, E.HIRE_DATE, E.SALARY
  FROM (SELECT ROWNUM AS RN, A.EMP_NO, A.NAME, A.DEPART, A.GENDER, A.POSITION, A.HIRE_DATE, A.SALARY
          FROM (SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
                  FROM EMPLOYEE_TBL
                 ORDER BY SALARY DESC) A) E
 WHERE E.RN = 2;
 
 
SELECT E.EMP_NO, E.NAME
  FROM (SELECT ROWNUM AS RN, A.EMP_NO, A.NAME
          FROM (SELECT EMP_NO, NAME
                  FROM EMPLOYEE_TBL
                 ORDER BY SALARY DESC) A) E
 WHERE E.RN = 3;
 
 
-- 2) ROW_NUMBER() 함수 사용하기
SELECT E.EMP_NO, E.NAME, E.DEPART, E.GENDER, E.POSITION, E.HIRE_DATE, E.SALARY
FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS RN, EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
        FROM EMPLOYEE_TBL) E
 WHERE E.RN = 3;
 
--ROWNUM 사용하기
-- 3~4 번째로 입사한 사원을 조회
SELECT E.EMP_NO, E.NAME
FROM (SELECT ROWNUM AS RN, A.EMP_NO, A.NAME
        FROM (SELECT EMP_NO, NAME
                FROM EMPLOYEE_TBL
                ORDER BY HIRE_DATE) A ) E
 WHERE E.RN = 3 OR E.RN = 4;
 
 
-- 2) ROW_NUMBER() 함수 사용하기
SELECT E.EMP_NO, E.NAME
FROM (SELECT ROW_NUMBER() OVER(ORDER BY HIRE_DATE) AS RN, EMP_NO, NAME
        FROM EMPLOYEE_TBL) E
 WHERE E.RN = 3 OR E.RN = 4;
 
 
 
-- SELECT 절의 서브쿼리
-- 부서번호가 1인 부서에 근무하는 부서번호, 사원명, 사원번호, 부서번호, 부서명을 조회하시오
SELECT E.EMP_NO, E.NAME, E.DEPART,
        (SELECT D.DEPT_NAME
            FROM DEPARTMENT_TBL D
         WHERE D.DEPT_NO = E.DEPART
            AND D.DEPT_NO = 1)
FROM EMPLOYEE_TBL E;

-- 조인으로 풀기
SELECT E.EMP_NO, E.NAME, E.DEPART, D.DEPT_NAME
FROM DEPARTMENT_TBL D RIGHT OUTER JOIN EMPLOYEE_TBL E
ON E.DEPART = D.DEPT_NO
AND DEPT_NO = 1;

 