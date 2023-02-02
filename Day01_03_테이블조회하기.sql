-- 조회 실습
-- 사원 테이블에서 사원 이름 조회하기
SELECT ENAME
  FROM EMP;

-- 오너 명시하기(오너 테이블을 가지고 있는 계정)
SELECT ENAME
  FROM SCOTT.EMP;

-- 테이블 명시하기 (칼럼을 가지고 있는 테이블)
SELECT EMP.ENAME
  FROM EMP;

-- 테이블 별명 지정하기
SELECT E.ENAME
  FROM EMP E; -- EMP 테이블의 별명을 E로 부여한다. AS(ALIAS)를 사용할 수 없다.

-- 컬럼의 별명 지정
SELECT E.ENAME 사원명 -- E.ENAME의 별명을 '사원명'으로 지정한다. AS(ALIAS)를 사용할 수 있다
  FROM EMP E;

-- 이렇게 된다는 거임
SELECT E.NAME AS 사원명
  FROM EMP E;
  
-- 2. 사원테이블의 모든 컬럼 조회하기
SELECT * -- 불려가기 싫으면 사용금지~
  FROM EMP;
  
SELECT EMPNO, ENAME , JOB, MGR, HIREDATE, SAL, COMM, DEPTNO 
  FROM EMP;
  
-- 3. 동일한 데이터는 한 번만 조회하기
-- DISTINCT
SELECT DISTINCT JOB
  FROM EMP;
  
-- 4.매니저 조회하기
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE JOB = 'MANAGER';
 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE JOB IN ('MANAGER');
 
-- 5. SAL이 1500 초과인 사원 목록 조회하기
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE SAL > 1500;
 
-- 6. SAL이 2000 ~ 2999 사이 사원 목록 조회하기
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE SAL BETWEEN 2000 AND 2999;
 
-- 7. COMM 받는 사원 목록 조회하기
-- NULL 체크 연산 : 1) NULL이다 : IS NULL / 2) NULL 아니다 : IS NOT NULL
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE COMM IS NOT NULL
   AND COMM != 0;

-- 8. ENAME이 A로 시작하는 사원
-- 1) WILD CARD :
--      % : 모든 문자, 글자수 제한 없는 모든 문자
--      _ : 한글자로 제한된 모든 문자
-- 2) 연산자
--      LIKE : WILDCARD를 포함한다
--      NOT LIKE : WILDCARD 포함하지 않는다

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE ENAME LIKE 'A%';
