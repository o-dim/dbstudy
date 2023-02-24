-- 전달된 부서번호의 부서를 삭제하는 프로시저를 작성하시오
-- 전달된 부서에 근무하는 모든 사원을 함께 삭제하시오
CREATE OR REPLACE PROCEDURE DELETE_PROC(DEPTNO IN DEPARTMENT_TBL.DEPT_NO%TYPE)
IS
BEGIN
    DELETE 
      FROM EMPLOYEE_TBL
     WHERE DEPART = DEPTNO;
    DELETE
      FROM DEPARTMENT_TBL
     WHERE DEPT_NO = DEPTNO;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        ROLLBACK;
END;

EXCUTE DELETE_PROC(1);