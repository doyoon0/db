use hrdb2019;
select row_number() over() as rno, emp_id, emp_name, dept_id, format(salary, 0) from employee;
select * from department;

desc department;

show tables;
select * from member;

desc member;


-- score_member 테이블 생성 
create table score_member(
	mid char(5) primary key, -- 'M0001' 형식의 트리거 적용
    name varchar(10) not null,
    department varchar(20),
    kor decimal(6,2) default 0.0,
    eng decimal(6,2) default 0.0,
    math decimal(6,2) default 0.0,
    mdate datetime
);

desc score_member;

delimiter $$

create trigger trg_score_member_mid
before insert on score_member
for each row
	begin
	declare max_code int;	-- 'M0001'

	-- 현재 저장된 값 중 가장 큰 값을 가져옴
    select ifnull(max(cast(right(mid, 4) as unsigned)), 0)
    into max_code
    from score_member;
    
    -- 'M0001' 형식으로 아이디 생성, LPAD(값, 크기, 채워지는 문자)
    SET NEW.mid = concat('M', LPAD(max_code + 1, 4, '0'));
    
	end $$
delimiter ;

show triggers;
select * from score_member;
