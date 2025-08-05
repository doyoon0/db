use hrdb2019;

/***************************************************
	book_market_books : 도서 테이블
    book_market_cart : 장바구니 테이블
    book_market_member : 회원 테이블
***************************************************/
create table book_market_books (
	rno	int auto_increment primary key,
    isbn varchar(8) unique key,
    title varchar(100) not null,
    price int not null,
    author varchar(100) not null,
    detail varchar(200),
    publisher varchar(100) not null,
    bdate datetime default current_timestamp
);

create table book_market_cart (
    isbn varchar(8) not null,
    userid varchar(100) not null,
    quantity int not null,
    
    constraint pk_isbn_userid primary key(isbn, userid)
);

create table book_market_member (
	userid varchar(100) primary key,
    username varchar(100) not null,
    phone varchar(13) not null
);

alter table book_market_cart add constraint fk_book_isbn foreign key (isbn) references book_market_books(isbn);
alter table book_market_cart add constraint fk_member_userid foreign key (userid) references book_market_member(userid);

select * from book_market_books;
select * from book_market_cart;
select * from book_market_member;

desc book_market_books;
desc book_market_cart;
desc book_market_member;

SELECT isbn, title, LENGTH(isbn) as isbn_length 
FROM book_market_books 
WHERE isbn = 'ISBN0009';

-- 회원 더미 데이터
INSERT INTO book_market_member (userid, username, phone) VALUES
('user001', '김철수', '010-1234-5678'),
('user002', '이영희', '010-2345-6789'),
('user003', '박민수', '010-3456-7890'),
('user004', '최지은', '010-4567-8901'),
('user005', '정다현', '010-5678-9012');

-- 도서 더미 데이터
INSERT INTO book_market_books (isbn, title, price, author, detail, publisher) VALUES
('ISBN0001', '스프링 부트 완벽 가이드', 35000, '김개발', '스프링 부트로 웹 애플리케이션을 만드는 실전 가이드', '코딩출판사'),
('ISBN0002', 'JavaScript 마스터하기', 28000, '이웹개발', 'ES6부터 최신 JavaScript까지 완벽 정리', '프론트엔드북스'),
('ISBN0003', 'MySQL 데이터베이스 설계', 32000, '박디비', 'MySQL을 활용한 효율적인 데이터베이스 설계 방법', 'DB출판사'),
('ISBN0004', 'React 실전 프로젝트', 40000, '최리액트', 'React Hooks와 함께하는 모던 웹 개발', '리액트프레스'),
('ISBN0005', 'Python 알고리즘 문제해결', 25000, '정파이썬', '코딩테스트 대비 파이썬 알고리즘 완전정복', '알고리즘북스'),
('ISBN0006', 'AWS 클라우드 실무', 45000, '김클라우드', 'AWS 서비스를 활용한 실전 클라우드 구축', '클라우드출판'),
('ISBN0007', 'Git & GitHub 협업', 20000, '이깃허브', '버전 관리와 협업을 위한 Git 활용법', '개발협업사'),
('ISBN0008', 'Docker 컨테이너 가이드', 38000, '박도커', 'Docker와 Kubernetes로 배우는 컨테이너', '컨테이너북스'),
('ISBN0009', 'Vue.js 프론트엔드', 33000, '최뷰', 'Vue.js 3.0으로 만드는 SPA 애플리케이션', '뷰출판사'),
('ISBN0010', 'Node.js 백엔드 개발', 36000, '정노드', 'Express.js와 함께하는 Node.js 서버 개발', '백엔드프레스');

-- 장바구니 더미 데이터
INSERT INTO book_market_cart (isbn, userid, quantity) VALUES
('ISBN0001', 'user001', 2),
('ISBN0002', 'user001', 1),
('ISBN0003', 'user002', 1),
('ISBN0004', 'user002', 3),
('ISBN0005', 'user003', 1),
('ISBN0006', 'user003', 2),
('ISBN0007', 'user004', 1),
('ISBN0008', 'user004', 1),
('ISBN0009', 'user005', 2),
('ISBN0010', 'user005', 1),
('ISBN0001', 'user003', 1),
('ISBN0004', 'user001', 1);

INSERT INTO book_market_cart (isbn, userid, quantity) VALUES
('ISBN0007', 'user004', 1),
('ISBN0009', 'user004', 1);

use hrdb2019;

select * from book_market_books;
select * from book_market_cart;
select * from book_market_member;

select m.isbn, userid, quantity, b.price from book_market_cart m inner join book_market_books b on m.isbn = b.isbn
where m.userid = 'user004';

				select
					c.isbn
					, c.userid
					, c.quantity
					, (c.quantity * b.price) as total
                    , b.price
				from book_market_cart c
				inner join book_market_books b 
				on c.isbn = b.isbn
				where userid = 'user004';

select count(*) from book_market_member where username = '최지은' and phone = '010-4567-8901';
SHOW FULL COLUMNS FROM book_market_books WHERE Field = 'isbn';
SHOW FULL COLUMNS FROM book_market_cart WHERE Field = 'isbn';
SELECT 
    TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME 
FROM 
    information_schema.KEY_COLUMN_USAGE 
WHERE 
    TABLE_SCHEMA = 'hrdb2019' 
    AND TABLE_NAME = 'book_market_cart';
    
    
SELECT 
	m.username
	, m.phone
	, 'address' AS address
	, NOW() AS sendDate
	, c.isbn
	, c.quantity
	, b.price
	, (c.quantity * b.price) AS totalPrice
FROM book_market_member m
JOIN book_market_cart c ON m.userid = c.userid
JOIN book_market_books b ON c.isbn = b.isbn
WHERE m.userid = 'user001'