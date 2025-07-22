/**
* MYSQL :: 정형 데이터를 저장하는 데이터베이스
- SQL 문법을 사용하여 데이터를 CRUD 한다.
- C(Create : 생성, insert)
- R(Read : 조회, select)
- U(Update : 수정, update)
- D(Delete : 삭제, delete)
- 개발자는 DML에 대한 CRUD 명령어를 잘 사용할 수 있어야 한다!!!
- SQL은 크게 DDL, DML, DCL, DTL로 구분할 수 있다.
- SQL은 대소문자 구분하지 않음, 보통 소문자로 작성
- snake 방식의 네이밍 규칙을 가짐

1.DDL(Data Deinition Language) : 데이터 정의어 
	: 데이터를 저장하기 위한 공간을 생성하고 논리적으로 정의하는 언어
    : create, alter, turncate, drop
2. DML(Data Manipulation Language) : 데이터 조작어
	: 데이터를 CRUD하는 명령어
    : insert, select, update, delete
3. DCL(Data Control Language) : 데이터 제어어
	: 데이터에 대한 권한과 보안을 정의하는 언어
    : grant, revoke
4. DTL(Data Transaction Laguage; TCL) : 트랜잭션 제어어
	: 데이터베이스의 처리 작업 단위인 트랜잭션을 관리하는 언어a
    : commit, save, rollback
*/

/* 반드시 기억해주세요!!! - 워크벤치 실행시 마다 명령어 실행!!!*/
show databases; -- 모든 데이터베이스 조회
use hrdb2019; -- 사용할 데이터베이스 오픈
select database(); -- 데이터베이스 선택
show tables;	-- 데이터베이스의 모든 테이블 출력

/********************************************************
	DESC(DESCRIBE): 테이블 구조 확인 
    형식> desc(desribe) [테이블명];
********************************************************/
show tables;
desc employee;
desc department;
desc unit;
desc vacation;

/********************************************************
	SELECT : 테이블 내용 조회 
    형식> SELECT [컬럼리스트] FROM [테이블명];
********************************************************/
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE;
SELECT * FROM EMPLOYEE;
SELECT EMP_NAME, GENDER, HIRE_DATE FROM EMPLOYEE;

-- 사원테이블의 사번, 사원명, 성별, 입사일, 급여율 조회
DESC EMPLOYEE;
SELECT EMP_ID, EMP_NAME, GENDER, HIRE_DATE, SALARY 
FROM EMPLOYEE;

-- 부서테이블의 모든 정보 조회
SELECT * FROM DEPARTMENT;

-- 	AS : 컬럼명 별칭 부여 
--  형식> SELECT [컬럼명 AS 별칭, ...] FROM [테이블명];
-- 사원테이블의 사번, 사원명, 성별, 입사일, 급여 컬럼을 조회한 한글 컬럼명으로 출력
SELECT EMP_ID AS 사번
	, EMP_NAME AS 사원명
    , GENDER AS 성별
    , HIRE_DATE AS '입사일'
    , SALARY '급여'
FROM EMPLOYEE;

-- 사원테이블의 ID, NAME, GENDER, HDATE, SALARY 컬럼명으로 조회
SELECT EMP_ID AS ID
	, EMP_NAME AS NAME
    , GENDER 
    , HIRE_DATE AS HDATE
    , SALARY 
FROM EMPLOYEE;

-- 사원테이블의 사번, 사원명, 부서명, 폰번호, 이메일, 급여, 보너스(급여*10%)를 조회
-- 기존의 컬럼에 연산을 수행하여 새로운 컬럼을 생성할 수 있다!!
DESC EMPLOYEE;
SELECT EMP_ID AS 사번
	, EMP_NAME AS 사원명
    , DEPT_ID AS 부서명
    , PHONE AS 폰번호
    , EMAIL AS 이메일
    , SALARY 급여
    , SALARY*(0.1) 보너스
FROM EMPLOYEE;

-- 현재 날짜를 조회 : CURDATE()
SELECT CURDATE() AS DATE FROM DUAL;

/********************************************************
	SELECT : 테이블 내용 상세 조회 
    형식> SELECT [컬럼리스트] 
			FROM [테이블명]
            WHERE [조건절];    
********************************************************/
-- 정주고 사원의 정보를 조회
SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE WHERE EMP_NAME = '정주고'; -- "" 사용가능

-- SYS 부서에 속한 모든 사원을 조회
SELECT * FROM EMPLOYEE WHERE DEPT_ID = 'SYS';

-- 사번이 S0005인 사원의 사원명, 성별, 입사일, 부서아이디, 이메일, 급여를 조회
SELECT EMP_NAME, GENDER, HIRE_DATE, DEPT_ID, EMAIL, SALARY 
FROM EMPLOYEE 
WHERE EMP_ID = 'S0005';

-- SYS 부서에 속한 모든 사원들을 조회, 단 출력되는 EMP_ID 컬럼은 '사원번호' 별칭으로 조회
DESC EMPLOYEE;
SELECT EMP_ID AS 사원번호, EMP_NAME, ENG_NAME, GENDER, HIRE_DATE, SALARY
FROM EMPLOYEE;

-- EMP_NAME '사원명' 별칭 수정
DESC EMPLOYEE;
SELECT EMP_ID AS '사원번호', EMP_NAME AS '사원명', ENG_NAME, GENDER, HIRE_DATE, SALARY
FROM EMPLOYEE;

-- !! WHERE 조건절 컬럼으로 별칭을 사용할 수 있을까요? 
-- 사원명이 홍길동인 사원을 별칭으로 조회??? :: WHERE 조건절에서 별칭을 컬럼명으로 사용X
SELECT EMP_ID AS '사원번호', EMP_NAME AS '사원명', ENG_NAME, GENDER, HIRE_DATE, SALARY
FROM EMPLOYEE
WHERE 사원명 = '홍길동';

-- 전략기획 부서의 모든 사원들의 사번, 사원명, 입사일, 급여를 조회
SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
FROM EMPLOYEE
WHERE DEPT_ID = 'STG';

-- 입사일이 2014년 8월 1일인 사원들을 조회
SELECT * FROM EMPLOYEE WHERE HIRE_DATE = '2014-08-01'; -- DATE 타입은 표현은 문자열처럼, 처리는 숫자처럼

-- 급여가 5000인 사원들을 조회
SELECT * FROM EMPLOYEE WHERE SALARY = 5000;

-- 성별이 남자인 사원들을 조회
SELECT * FROM EMPLOYEE WHERE GENDER = 'M';

-- 성별이 여자인 사원들을 조회
SELECT * FROM EMPLOYEE WHERE GENDER = 'F';

-- NULL : 아직 정의되지 않은 미지수
-- 숫자에서는 가장 큰수로 인식, 논리적인 의미를 포함하고 있으므로 등호(=)로는 검색X, IS 키워드와 함께 사용O

-- 급여가 NULL인 값을 가진 사원들을 조회
SELECT * FROM EMPLOYEE WHERE SALARY IS NULL;

-- 영어이름이 정해지지 않은 사원들을 조회
SELECT * FROM EMPLOYEE WHERE ENG_NAME IS NULL;

-- 퇴사하지 않은 사원들을 조회
DESC EMPLOYEE;
SELECT * FROM EMPLOYEE WHERE RETIRE_DATE IS NULL;

-- 퇴사하지 않은 사원들의 보너스 컬럼(급여*20%)을 추가하여 조회, 컬럼명은 BONUS
SELECT *, SALARY*0.2 AS BONUS FROM EMPLOYEE WHERE RETIRE_DATE IS NULL;

-- 퇴사한 사원들의 사번, 사원명, 이메일, 폰번호, 급여를 조회
SELECT EMP_ID, EMP_NAME, EMAIL, PHONE, SALARY 
FROM EMPLOYEE
WHERE RETIRE_DATE IS NOT NULL;

-- NULL 값을 다른 값으로 대체하는 방법
-- 형식 > IFNULL(NULL 포함하고있는 컬럼명, 대체값)
-- SYS 부서에 속한 사원들의 정보 조회,  단, 급여가 NULL인 사원은 0으로 치환
SELECT * FROM EMPLOYEE;
SELECT EMP_ID, EMP_NAME, EMAIL, PHONE, IFNULL(SALARY, 0) AS SALARY
FROM EMPLOYEE 
WHERE DEPT_ID = 'STG';

-- 사원 전체 테이블의 내용을 조회, 단 영어이름이 정해지지 않은 사원들은 'SMITH'로 치환
SELECT * FROM EMPLOYEE;
SELECT EMP_ID, EMP_NAME, IFNULL(ENG_NAME, 'SMITH') AS ENG_NAME, GENDER, HIRE_DATE
FROM EMPLOYEE;

-- MKT 부서의 사원들을 조회, 재직중인 사원들의 RETIRE_DATE 컬럼은 현재 날짜로 치환
SELECT EMP_ID, EMP_NAME, ENG_NAME, GENDER, HIRE_DATE, IFNULL(RETIRE_DATE, CURDATE()) AS 'RETIRE_DATE' 
FROM EMPLOYEE;

/********************************************************
	SELECT : 테이블 내용 상세 조회 
    형식> SELECT DISTINCT [컬럼리스트] ~
********************************************************/
-- 사원테이블의 부서리스트를 조회
SELECT DISTINCT DEPT_ID FROM EMPLOYEE;
-- 주의!! 두개를 합친 요소가 중복되지 않으면 출력. UNIQUE한 컬럼과 함께 조회하는 경우 DISTINCT가 적용되지 않음
SELECT DISTINCT EMP_ID, DEPT_ID FROM EMPLOYEE;

/********************************************************
	ORDER BY 컬럼 : 데이터 정렬
    형식 > SELECT [컬럼리스트]
			FROM [테이블]
            WHERE [조건절]
            ORDER BY [컬럼명, ...] ASC/DESC
********************************************************/
-- 급여를 기준으로 오름차순 정렬
SELECT * FROM EMPLOYEE ORDER BY SALARY ASC;
SELECT * FROM EMPLOYEE ORDER BY SALARY desc;

-- 모든 사원을 급여, 성별을 기준으로 오름차순 정렬
SELECT * FROM EMPLOYEE ORDER BY SALARY ASC, GENDER ASC;

-- ENG_NAME이 NULL인 사원들을 입사일 기준으로 내림차순 정렬
SELECT * FROM EMPLOYEE WHERE ENG_NAME IS NULL ORDER BY HIRE_DATE DESC;

-- 퇴직한 사원들을 급여기준으로 내림차순 정렬
SELECT * FROM EMPLOYEE WHERE RETIRE_DATE IS NOT NULL ORDER BY SALARY DESC;

-- 퇴직한 사원들을 급여기준으로 내림차순 정렬, SALARY 컬럼을 '급여'별칭으로 치환
-- '급여' 별칭으로 ORDER BY가 가능할까요?? :: 별칭으로 ORDER BY 가능함
-- WHERE 조건절 데이터 탐색 > 컬럼리스트 > 정렬
SELECT * FROM EMPLOYEE WHERE RETIRE_DATE IS NOT NULL ORDER BY 급여 DESC;

-- 정보시스템(SYS) 부서 사원들 중 입사일이 빠른순서,  급여를 많이 받는 순서로 정렬
SELECT * FROM EMPLOYEE WHERE DEPT_ID = 'SYS' ORDER BY HIRE_DATE DESC, SALARY DESC;
 
/********************************************************
	조건절 + 비교연산자 : 특정 범위 혹은 데이터 검색
	ORDER BY 컬럼 : 데이터 정렬
    형식 > SELECT [컬럼리스트]
			FROM [테이블]
            WHERE [조건절]
            ORDER BY [컬럼명, ...] ASC/DESC
********************************************************/
-- 급여가 5000 이상인 사원들을 조회
SELECT * FROM EMPLOYEE WHERE SALARY >= 5000;

-- 입사일이 2017-01-01 이후로 입사한 사원들을 조회
SELECT * FROM EMPLOYEE WHERE HIRE_DATE >= '2017-01-01';

-- 입사일이 2017-01-01 이후이거나, 급여가 6000 이상인 사원들을 조회
-- ~이거나, ~또는 : OR - 두 개의 조건중 하나만 만족해도 조회가능
SELECT * 
FROM EMPLOYEE
WHERE HIRE_DATE >= '2025-01-01' OR SALARY >= 6000;

-- 입사일이 2017-01-01 이후이거나, 급여가 6000 이상인 사원들을 조회
-- ~이고 : AND - 두 개의 조건이 모두 만족해야만 조회 가능
SELECT * 
FROM EMPLOYEE
WHERE HIRE_DATE >= '2025-01-01' AND SALARY >= 6000;

-- 특정 기간 : 2015-01-01 ~ 2017-12-31 사이에 입사한 모든 사원 조회
-- 부서 기준으로 오름차순 정렬
SELECT * 
FROM EMPLOYEE
WHERE HIRE_DATE >= '2015-01-01' AND HIRE_DATE <= '2017-12-31'
ORDER BY DEPT_ID ASC;

-- 급여가 6000 이상 8000 이하인 사원들을 모두 조회
SELECT * 
FROM EMPLOYEE
WHERE SALARY >= 6000 AND SALARY <= 8000;

-- MKT 부서의 사원들의 사번, 사원명, 입사일, 이메일, 급여, 보너스(급여의 20%) 조회
-- 급여가 NULL인 사원의 보너스는 기본 50으로 정한다.
-- 보너스가 1000 이상인 사원 조회
-- 보너스가 높은 사원 기준으로 정렬
SELECT EMP_ID, EMP_NAME, HIRE_DATE, EMAIL, SALARY, IFNULL(SALARY*0.2, 50) AS 'BONUS'
FROM EMPLOYEE
WHERE DEPT_ID = 'MKT' AND SALARY*0.2 >= 1000
ORDER BY BONUS DESC;

-- 사원명이 '일지매', '오삼식', '김삼순' 인 사원들을 조회
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME IN ('일지매', '오삼식', '김삼순');

/********************************************************
	논리곱(AND) : BETWEEN ~ AND
    형식 > SELECT [컬럼리스트] FROM [테이블]
            WHERE [컬럼명] BETWEEN 값1 AND 값2;
	논리합(OR) : IN
    형식 > SELECT [컬럼리스트] FROM [테이블]
            WHERE [컬럼명] IN (값1, 값2, 값3...);
********************************************************/
-- BETWEEN ~ AND
-- 특정 기간 : 2015-01-01 ~ 2017-12-31 사이에 입사한 모든 사원 조회
-- 부서 기준으로 오름차순 정렬
SELECT * 
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '2015-01-01' AND '2017-12-31'
ORDER BY DEPT_ID ASC;

-- IN
-- 사원명이 '일지매', '오삼식', '김삼순' 인 사원들을 조회
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME IN ('일지매', '오삼식', '김삼순');

-- 부서아이디가 MKT, SYS, STG에 속한 모든 사원 조회
SELECT * 
FROM EMPLOYEE
WHERE DEPT_ID IN ('MKT', 'SYS', 'STG에')
ORDER BY DEPT_ID ASC;

/********************************************************
	특정 문자열 검색 : 와일드 문자(%, _) + LIKE 연산자
    형식 > SELECT [컬럼리스트] FROM [테이블]
            WHERE [컬럼명] LIKE '와일드 문자 포함 검색어';
********************************************************/
-- '한'씨 성을 가진 모든 사원을 조회
SELECT * 
FROM EMPLOYEE
WHERE EMP_NAME LIKE '한%';

-- 영어이름이 'F'로 시작하는 모든 사원을 조회
SELECT * 
FROM EMPLOYEE
WHERE ENG_NAME LIKE 'F%';

-- 이메일 이름 중 두번째 자리에 'a'가 들어가는 모든 사원을 조회
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '_a%';

-- 이메일 아이디가 4자인 모든 사원을 조회
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '____@%';




