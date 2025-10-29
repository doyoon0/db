/****************************************
* 작업내용 : 주소 테이블 생성
* 작성자 : 박도윤
* 수정이력 : 
	2025-10-28	최초 생성
* 사용예시 : desc ssf_addr;
****************************************/
use ssf;
show tables;

CREATE TABLE ssf_addr (
	addr_key			INT		AUTO_INCREMENT		NOT NULL		COMMENT '배송지고유코드',
	user_key			VARCHAR(100)				NOT NULL		COMMENT '회원고유번호',
	addr_name			VARCHAR(15)					NOT NULL		COMMENT '받는분성명',
	addr_zipcode		VARCHAR(6)					NOT NULL		COMMENT '우편번호',
	addr_main			VARCHAR(300)				NOT NULL		COMMENT '받는분주소',
	addr_detail			VARCHAR(100)				NOT NULL		COMMENT '상세주소',
	addr_tel			VARCHAR(15)					NOT NULL		COMMENT '받는분전화번호',
	addr_req			VARCHAR(100)				NULL			COMMENT '배송시요청사항',
	addr_def			VARCHAR(1)					NULL			COMMENT '기본배송지여부',
    PRIMARY KEY (addr_key),
    CONSTRAINT fk_ssf_addr_ssf_user FOREIGN KEY(user_key)	references ssf_user(user_key)
);


