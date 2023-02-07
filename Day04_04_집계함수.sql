/*
    이름   국어 영어 수학  합계
    NULL,  100, 100, 100  300
    '정숙', NULL, 90, 90   180
    '미희', 80, NULL, 80, 160
    '철순', 70, 70, NULL, 140
     합계  250  260  270  < SUM으로 처리


*/

SELECT SUM(KOR),
       SUM(ENG),
       SUM(MAT) -- SUM 인수는 한 개만 가능하기에 KOR, ENG, MAT 이런건 X
  FROM SAMPLE_TBL;
  
SELECT AVG(NVL(KOR, 0)),
       AVG(NVL(ENG, 0)),
       AVG(NVL(MAT, 0))
  FROM SAMPLE_TBL;
  
-- 개수
SELECT
       COUNT(KOR), -- 국어시험 응시한 인원수
       COUNT(ENG),
       COUNT(MAT),
       COUNT(*) -- 모든 칼럼을 참조하여 어느 한 칼럼이라도 값을 가지고 있으면
       -- 개수에 포함시킨다
  FROM SAMPLE_TBL;
  