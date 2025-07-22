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
SELECT * FROM EMPLOYEE 
WHERE EMP_NAME = '정주고'; -- "" 사용가능

-- SYS 부서에 속한 모든 사원을 조회
SELECT * FROM EMPLOYEE
WHERE DEPT_ID = 'SYS';





