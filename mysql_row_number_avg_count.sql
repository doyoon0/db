use hrdb2019;

/*
문제 1: 부서별 직원 정보 조회
난이도: ★★★☆☆
각 부서별로 다음 정보를 조회하시오:

본부명, 부서명, 직원수, 평균연봉
해당 부서의 최고연봉 직원 이름과 연봉

SHOW TABLES;

SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM UNIT;
SELECT * FROM VACATION;
*/

SELECT 
	U.UNIT_NAME AS '본부명'
	, D.DEPT_NAME AS '부서명'
    , TP.EMP_NAME AS '최고직원'
    , TP.SALARY AS '최고연봉'
    , COUNT(E.EMP_ID) AS '직원수'
    , AVG(E.SALARY) AS '평균연봉'
FROM EMPLOYEE AS E 
LEFT JOIN DEPARTMENT AS D ON E.DEPT_ID = D.DEPT_ID
LEFT JOIN UNIT AS U ON D.UNIT_ID = U.UNIT_ID
LEFT JOIN (
	SELECT 
    EMP_NAME
    , SALARY
    , DEPT_ID
    , ROW_NUMBER() OVER (PARTITION BY DEPT_ID ORDER BY SALARY DESC) AS RN
    FROM EMPLOYEE     
) TP ON TP.DEPT_ID = D.DEPT_ID AND TP.RN = 1
GROUP BY U.UNIT_NAME, D.DEPT_NAME, TP.EMP_NAME, TP.SALARY

/*
문제 2: 휴가 사용 현황 분석
난이도: ★★★☆☆
각 직원별로 다음 정보를 조회하시오:

직원명, 부서명, 입사일
총 휴가 신청 횟수, 총 휴가 일수
가장 긴 휴가의 시작일과 종료일, 그 기간(일수)

단, 휴가를 한 번이라도 신청한 직원만 조회하세요.

SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM UNIT;
SELECT * FROM VACATION;
*/











 
