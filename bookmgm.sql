use hrdb2019;

-- 테이블 3개 생성, book_tj, book_yes24, book_aladin
-- bid:pk('B001', 트리거생성), title, author, price, isbn(랜덤 정수4자리 생성), bdate

create table book_tj(
	bid char(4) primary key, -- 'B001' 형식의 트리거 적용
    title varchar(100) not null,
    author varchar(100),
    price int not null,
    isbn int not null,
    bdate datetime
);

create table book_yes24(
	bid char(4) primary key, -- 'B001' 형식의 트리거 적용
    title varchar(100) not null,
    author varchar(100),
    price int not null,
    isbn int not null,
    bdate datetime
);

create table book_aladin(
	bid char(4) primary key, -- 'B001' 형식의 트리거 적용
    title varchar(100) not null,
    author varchar(100),
    price int not null,
    isbn int not null,
    bdate datetime
);

desc book_tj;
desc book_yes24;
desc book_aladin;

delimiter $$

create trigger trg_book_tj_bid
before insert on book_tj
for each row
	begin
	declare max_code int;	-- 'B001'

	-- 현재 저장된 값 중 가장 큰 값을 가져옴
    select ifnull(max(cast(right(bid, 3) as unsigned)), 0)
    into max_code
    from book_tj;
    
    -- 'B001' 형식으로 아이디 생성, LPAD(값, 크기, 채워지는 문자)
    SET NEW.bid = concat('B', LPAD(max_code + 1, 3, '0'));
    
    -- 4자리 랜덤 정수 생성
    SET NEW.isbn = FLOOR(RAND() * 9000) + 1000;
    
	end $$
delimiter ;

delimiter $$

create trigger trg_book_yes24_bid
before insert on book_yes24
for each row
	begin
	declare max_code int;	-- 'B001'

	-- 현재 저장된 값 중 가장 큰 값을 가져옴
    select ifnull(max(cast(right(bid, 3) as unsigned)), 0)
    into max_code
    from book_yes24;
    
    -- 'B001' 형식으로 아이디 생성, LPAD(값, 크기, 채워지는 문자)
    SET NEW.bid = concat('B', LPAD(max_code + 1, 3, '0'));
    
    -- 4자리 랜덤 정수 생성
    SET NEW.isbn = FLOOR(RAND() * 9000) + 1000;
    
	end $$
delimiter ;

delimiter $$

create trigger trg_book_aladin_bid
before insert on book_aladin
for each row
	begin
	declare max_code int;	-- 'B001'

	-- 현재 저장된 값 중 가장 큰 값을 가져옴
    select ifnull(max(cast(right(bid, 3) as unsigned)), 0)
    into max_code
    from book_aladin;
    
    -- 'B001' 형식으로 아이디 생성, LPAD(값, 크기, 채워지는 문자)
    SET NEW.bid = concat('B', LPAD(max_code + 1, 3, '0'));
    
    -- 4자리 랜덤 정수 생성
    SET NEW.isbn = FLOOR(RAND() * 9000) + 1000;
    
	end $$
delimiter ;

show triggers;
select * from book_aladin;
SELECT FLOOR(RAND() * 9000) + 1000 AS random_4digit;
drop trigger trg_book_tj_bid;
drop trigger trg_book_aladin_bid;
drop trigger trg_book_yes24_bid;

select
(select count(*) from book_aladin) +
(select count(*) from book_yes24) + 
(select count(*) from book_tj) as total;

select * from book_aladin;
select * from book_yes24;
select * from book_tj;
SELECT 
    row_number() over() as rno,
    bid,
    title,
    author,
    price,
    isbn,
    left(bdate, 10) 
FROM book_tj;