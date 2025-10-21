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


select * from product;
select pid, name, price, info, rate, image, imgList from product;

update product set image = '2.webp' where pid = 2;

/*********************************************
	상품 상세 정보 테이블 생성 : product_detailinfo
*********************************************/
show tables;
drop table product_detailinfo;
create table product_detailinfo (
	did 		int 			auto_increment		primary key
    , title_en	varchar(100) not null
    , title_ko	varchar(100) not null
    , pid		int			 not null
    , list		json	-- nodeJS (JS)로 만든 서버라서 그냥 (JSON) 읽어오면되지만, springboot에서는 (String , List<>)로 읽어와야함.
    , constraint fk_product_pid foreign key(pid)
    references product(pid)
    on delete cascade
    on update cascade
);

desc product_detailinfo;
select * from product_detailinfo;

-- mysql에서 json, csv, excel... 데이터 파일을 업로드 하는 경로
show variables like 'secure_file_priv';

-- products.json 파이르이 detailinfo 정보 매핑
insert into product_detailinfo(title_en, title_ko, pid, list) 
select
	jt.title_en
    , jt.title_ko
    , jt.pid
    , jt.list
from
	json_table(
		cast(load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.json') 
				AS CHAR CHARACTER SET utf8mb4 ),
		'$[*]' COLUMNS (
			 title_en   	VARCHAR(100)  PATH '$.detailInfo.title_en',
			 title_ko   	VARCHAR(100)  PATH '$.detailInfo.title_ko',
			 list   	json PATH '$.detailInfo.list',
			 pid		int	 PATH '$.pid'
		   )   
    ) as jt ;

select * from product_detailinfo;

-- pid: 1에 대한 상품저오보아 상세정보 출력
select * 
from product as p 
inner join product_detailinfo as pd
on p.pid = pd.pid
where p.pid = 1;

select * from member;

/*********************************************
	상품 QnA 정보 테이블 생성 : product_qna
*********************************************/
show tables;
create table product_qna (
	qid 			int 		auto_increment		primary key
    , is_complete	boolean		
    , title			varchar(100)	not null
    , content		varchar(200)	
	, is_lock		boolean
    , id			varchar(50)		not null
    , pid			int				not null
    , cdate			datetime
    , constraint fk_product_qna_pid foreign key(pid) references product(pid)
    on delete cascade on update cascade, 
    constraint fk_member_id foreign key(id) references member(id)
    on delete cascade on update cascade
);

-- mysql에서 json, csv, excel... 데이터 파일을 업로드 하는 경로
show variables like 'secure_file_priv';

-- products.json 파이르이 detailinfo 정보 매핑
insert into product_qna(title, content, is_complete, is_lock, id, pid, cdate) 
select
	jt.title
    , jt.content
    , jt.is_complete
    , jt.is_lock
    , jt.id
    , jt.pid
    , jt.cdate
from
	json_table(
		cast(load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/productQnA.json') 
				AS CHAR CHARACTER SET utf8mb4 ),
		'$[*]' COLUMNS (
			 title   	VARCHAR(100)  PATH '$.title',
			 content   	VARCHAR(200)  PATH '$.content',
             is_complete   	BOOLEAN  PATH '$.isComplete',
             is_lock   	BOOLEAN  PATH '$.isLock',
             id   	VARCHAR(50)  PATH '$.id',
             pid   	INT  PATH '$.pid',
             cdate   	DATETIME  PATH '$.cdate'
		   )   
    ) as jt ;


select * from product_qna;
select * from member;
select * from product;

-- hong 회원이 분홍색 후드티 상품(pid : 1) 에 쓴 QnA 조회
-- 회원아이디, 회원명, 가입날짜, 상품명, 상품가격, Qna 제목, 내용, 등록날짜
select 
m.id
, m.name
, m.mdate
, p.name
, p.price
, a.title
, a.content
, a.cdate
from product_qna as a 
inner join member as m on a.id = m.id
left outer join product as p on a.pid = p.pid
where m.id = "rainycorn" and p.pid = 1;



