-- index
-- 인덱스 정보가 저장된 데이터 사전 (메타 데이터, 시스템 카탈로그)
DESCRIBE ALL_INDEXES;
SELECT OWNER, INDEX_NAME, TABLE_NAME
  FROM ALL_INDEXES;
DESCRIBE DBA_INDEXES;
USER_INDEXES;

DESCRIBE USER_INDEXES;
SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME
FROM USER_INDEXES;

-- 인덱스 칼럼 정보가 저장된 데이터 사전


/*
ALL_IND_COLUMNS
DBA_IDN_COLUMNS
USER_IDN_CLOUMN

*/

DESCRIBE USER_IDN_COLUMNS;
SELECT INDEX_NAME, TABLE_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS;


-- 인덱스 생성하기
CREATE INDEX P_NAME_IDX
    ON PROFESSOR_TBL(P_NAME);
    
-- 인덱스 삭제
DROP INDEX P_NAME_IDX;