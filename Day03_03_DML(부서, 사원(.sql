DROP TABLE EMPLOYEE_TBL;
DROP TABLE DEPARTMENT_TBL;

CREATE TABLE DEPARTMENT_TBL(
    DEPT_NO NUMBER,
    DEPT_NAME VARCHAR2(15 BYTE) NOT NULL,
    LOCATION VARCHAR2(15 BYTE) NOT NULL,
    CONSTRAINT PK_DEPT PRIMARY KEY(DEPT_NO)
);

CREATE TABLE EMPLOYEE_TBL(
    EMP_NO NUMBER,
    NAME VARCHAR2(20 BYTE) NOT NULL,
    DEPART NUMBER,
    POSITION VARCHAR2(20 BYTE),
    GENDER CHAR(2 BYTE),
    HIRE_DATE DATE,
    SALARY NUMBER,
    CONSTRAINT PK_EMP PRIMARY KEY(EMP_NO),
    CONSTRAINT FK_EMP_DEPT FOREIGN KEY(DEPART) REFERENCES DEPARTMENT_TBL(DEPT_NO)
        ON DELETE SET NULL
);

--시퀀스 삭제
DROP SEQUENCE DEPARTMENT_SEQ;

--시퀀스 번호생성기 만들기
CREATE SEQUENCE DEPARTMENT_SEQ
    INCREMENT BY 1 -- 1씩 증가하는 번호를 만든다(생략가능)
    START WITH 1 --1부터 만든다(생략가능)
    NOMAXVALUE -- 번호의 상한선이 없다(생략가능) MAXVALUE100 < 100까지만 생성
    NOMINVALUE --  번호의 하한선이 없다(생략가능) MINVALUE100 < 100부터 생성
    NOCYCLE -- 번호 순환이 없다(생략가능) / CYCLE : 번호가 MAXVALUE에 도달하면 다음은 MINVALUE이다.
    NOCACHE -- 메모리캐시를 사용하지 않음 CACHE : 메모리캐시 사용(사용하지 않는 게 좋다)
    NOORDER -- 번호 건너뛰기가 없다.
;
-- 번호뽑는 함수 : NEXTVAL
--SELECT DEPARTMENT_SEQ.NEXTVAL FROM DUAL; -- 테이블에 없는 데이터를 조회하려면 DUAL 테이블을 사용한다

--데이터 입력하기
--PARENT 키부터
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPARTMENT_SEQ.NEXTVAL, '영업부', '대구');
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPARTMENT_SEQ.NEXTVAL, '인사부', '서울');
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPARTMENT_SEQ.NEXTVAL, '총무부', '대구');
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPARTMENT_SEQ.NEXTVAL, '기획부', '서울');
COMMIT;

DROP SEQUENCE EMPLOYEE_SEQ;

CREATE SEQUENCE EMPLOYEE_SEQ
    START WITH 100
    NOCACHE;

INSERT INTO EMPLOYEE_TBL VALUES(EMPLOYEE_SEQ.NEXTVAL, '구창민', 1, '과장', 'M', '95/05/01', 500000);
INSERT INTO EMPLOYEE_TBL VALUES(EMPLOYEE_SEQ.NEXTVAL, '김민서', 1, '사원', 'M', '17/09/01', 2500000);
INSERT INTO EMPLOYEE_TBL VALUES(EMPLOYEE_SEQ.NEXTVAL, '이은영', 2, '부장', 'F', '90/09/01', 5500000);
INSERT INTO EMPLOYEE_TBL VALUES(EMPLOYEE_SEQ.NEXTVAL, '한성일', 2, '과장', 'M', '93/04/01', 5000000);
COMMIT;


-- 데이터 수정하기
-- 1. 부서번호DEPT_NO가 1인 부서지역LOCATION 을 '경기'로 바꾸기
UPDATE DEPARTMENT_TBL 
   SET LOCATION = '경기' -- 수정할 내용(여기서 등호는 대입연산자임)
 WHERE DEPT_NO = 1; -- 조건문(여기서 등호는 비교연산자이다) 결론: 걍 똑같이 씀 여기는
COMMIT;

-- 2. 부서번호 DEPT_NO가 1인 부서에 근무하는 사람들의 급여를 50만원 증가시키시오
UPDATE EMPLOYEE_TBL
   SET SALARY = SALARY + 500000
 WHERE DEPART = 1;
COMMIT;

--데이터삭제
-- 1.지역LOCATION이 '대구'인 부서를 삭제하시오
DELETE FROM DEPARTMENT_TBL
WHERE LOCATION = '대구';
COMMIT;
 -- 얘는 해당값이 없었으나
-- 2. 지역이 '서울'인 부서를 삭제
DELETE FROM DEPARTMENT_TBL
WHERE LOCATION = '서울';
COMMIT;
 -- 얘는 존재 그렇기에 위에 ON DELETE 문이 활성화되면서 SET NULL 됨
 
