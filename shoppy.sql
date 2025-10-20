/** 데이터베이스 생성 */
create database shoppy;

/** 데이터베이스 열기 */
use shoppy;
select database();

/** 테이블 목록 확인 */
show tables;

/** member 테이블 생성 */
create table member (
	id 			varchar(50) 	primary key
    , pwd 		varchar(50)		not null
    , name 		varchar(20)		not null
    , phone 	char(13)
    , email 	varchar(50)		not null
    , mdate		date
);

desc member;

select * from member;
select count(id) from member where id='hong11';

-- pwd 사이즈 변경
alter table member modify column pwd varchar(100) not null;

-- mysql은 수정, 삭제 시 update mode를 변경
SET SQL_SAFE_UPDATES = 0; -- 0: off/ 1: on
delete from member where mdate = '2025-10-17';

/***************************************
	상품 테이블 생성 : product
***************************************/
create table product( 
	pid		int 	auto_increment primary key,
    name	varchar(200) 	not null, 
    price	long,
    info	varchar(200), 
    rate	double,
    image	varchar(100),
    imgList	json
);

/*
ALTER TABLE product
RENAME COLUMN imageList TO imgList;
*/

desc product;
select * from product;
insert into product( name, price, info, rate, image, imgList)
values 
	('후드티', 15000, '검정색 후드티' , 2.2, '1.webp', JSON_Array('2.webp', '2.webp', '2.webp')),
	('원피스', 25000, '원피스' , 4, '3.webp', JSON_Array('3.webp', '3.webp', '3.webp')),
    ('반바지', 12000, '반바지' , 3.2, '4.webp', JSON_Array('4.webp', '4.webp', '4.webp')),
    ('티셔츠', 20000, '티셔츠' , 5, '5.webp', JSON_Array('5.webp', '5.webp', '5.webp')),
    ('스트레치 비스트 드레스', 55000, '스트레치 비스트 드레스' , 3, '6.webp', JSON_Array('6.webp', '6.webp', '6.webp')),
    ('자켓', 115000, '자켓' , 3.5, '7.webp', JSON_Array('7.webp', '7.webp', '7.webp'));




