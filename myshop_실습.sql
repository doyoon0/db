/******************************************************
		실습 데이터베이스 연결 : myshop2019
		실습 내용 - 기본적인 데이터 조회 	 
******************************************************/
-- Q01) customer 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.
-- Q02) employee 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.
-- Q03) product 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.
-- Q04) order_header 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.
-- Q05) order_detail 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.
-- Q06) 모든 고객의 아이디, 이름, 지역, 성별, 이메일, 전화번호를 조회하세요.
-- Q07) 모든 직원의 이름, 사원번호, 성별, 입사일, 전화번호를 조회하세요.
-- Q08) 이름이 '홍길동'인 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
-- Q09) 여자 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
-- Q10) '울산' 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
-- Q11) 포인트가 500,000 이상인 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
-- Q12) 이름에 공백이 들어간 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
-- Q13) 전화번호가 010으로 시작하지 않는 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
-- Q14) 포인트가 500,000 이상 '서울' 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
-- Q15) 포인트가 500,000 이상인 '서울' 이외 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
-- Q16) 포인트가 400,000 이상인 '서울' 지역 남자 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
-- Q17) '강릉' 또는 '원주' 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
-- Q18) '서울' 또는 '부산' 또는 '제주' 또는 '인천' 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
-- Q19) 포인트가 400,000 이상, 500,000 이하인 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
-- Q20) 1990년에 출생한 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
-- Q21) 1990년에 출생한 여자 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
-- Q22) 1990년에 출생한 '대구' 또는 '경주' 지역 남자 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
-- Q23) 1990년에 출생한 남자 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
--      단, 홍길동(gildong) 형태로 이름과 아이디를 묶어서 조회하세요.
-- Q24) 근무중인 직원의 이름, 사원번호, 성별, 전화번호, 입사일를 조회하세요.
-- Q25) 근무중인 남자 직원의 이름, 사원번호, 성별, 전화번호, 입사일를 조회하세요.
-- Q26) 퇴사한 직원의 이름, 사원번호, 성별, 전화번호, 입사일, 퇴사일를 조회하세요.

-- Q28) 2019-01-01 ~ 2019-01-07 기간 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 소계, 배송비, 전체금액을 조회하세요.
--      단, 고객아이디를 기준으로 오름차순 정렬해서 조회하세요.
    
-- Q29) 2019-01-01 ~ 2019-01-07 기간 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 소계, 배송비, 전체금액을 조회하세요.
--      단, 전체금액을 기준으로 내림차순 정렬해서 조회하세요.

-- Q30) 2019-01-01 ~ 2019-01-07 기간 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 소계, 배송비, 전체금액을 조회하세요.
--      단, 사원번호를 기준으로 오름차순, 같은 사원번호는 주문일시를 기준으로 내림차순 정렬해서 조회하세요.

/**
	그룹함수
**/
show databases;
use myshop2019;
select database();
show tables;
select * from customer;
/** customer 테이블 사용 **/
-- Q01) 고객의 포인트 합을 조회하세요.
select sum(ifnull(point,0)) from customer;
-- Q02) '서울' 지역 고객의 포인트 합을 조회하세요.
select sum(ifnull(point,0)) from customer where city = '서울';
-- Q03) '서울' 지역 고객의 수를 조회하세요.
select count(*) from customer where city = '서울';
-- Q04) '서울' 지역 고객의 포인트 합과 평균을 조회하세요.
select sum(ifnull(point,0)), avg(ifnull(point,0)) from customer where city = '서울';     
-- Q05) '서울' 지역 고객의 포인트 합, 평균, 최댓값, 최솟값을 조회하세요.
select sum(ifnull(point,0)), avg(ifnull(point,0)), max(point), min(point) from customer where city = '서울';
-- Q06) 남녀별 고객의 수를 조회하세요.
select gender, count(*) from customer group by gender;
-- Q07) 지역별 고객의 수를 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
select city, count(*) from customer group by city order by city asc;
 
-- Q08) 지역별 고객의 수를 조회하세요.
--      단, 고객의 수가 10명 이상인 행만 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
select city, count(*) from customer group by city having count(*) >= 10 order by city asc;
    
-- Q09) 남녀별 포인트 합을 조회하세요.
select gender, sum(point) from customer group by gender;    
-- Q10) 지역별 포인트 합을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
select city, sum(point) from customer group by city order by city asc;
-- Q11) 지역별 포인트 합을 조회하세요.
--      단, 포인트 합이 1,000,000 이상인 행만 포인트 합을 기준으로 내림차순 정렬해서 조회하세요.
select city, sum(point) from customer group by city having sum(point) >= 1000000 order by city asc;
      
-- Q12) 지역별 포인트 합을 조회하세요.
--      단, 포인트 합을 기준으로 내림차순 정렬해서 조회하세요.
select city, sum(point) from customer group by city order by sum(point) desc;

-- Q13) 지역별 고객의 수, 포인트 합을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
select city, count(*), sum(point) from customer group by city order by city asc;

-- Q14) 지역별 포인트 합, 포인트 평균을 조회하세요.
--      단, 포인트가 NULL이 아닌 고객을 대상으로 하며, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
select city, sum(point), avg(point) from customer where point is not null group by city order by city asc;
-- Q15) '서울', '부산', '대구' 지역 고객의 지역별, 남녀별 포인트 합과 평균을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순, 같은 지역은 성별을 기준으로 오름차순 정렬해서 조회하세요.
select city, gender, sum(point), avg(point)
from customer 
where city in ('서울', '부산', '대구') 
group by city, gender
order by city asc, gender asc;

/** order_header 테이블 사용 **/
show tables;    
select * from order_header;
-- Q16) 2019년 1월 주문에 대하여 고객아이디별 전체금액 합을 조회하세요.
select customer_id, sum(total_due) from order_header where left(order_date, 7) = '2019-01' group by customer_id;

-- Q17) 주문연도별 전체금액 합계를 조회하세요.
select left(order_date, 4), sum(total_due) from order_header group by left(order_date, 4);

-- Q18) 2019.01 ~ 2019.06 기간 주문에 대하여 주문연도별, 주문월별 전체금액 합을 조회하세요.
select left(order_date, 4), substring(order_date, 6, 2), sum(total_due)
from order_header 
where substring(order_date, 1, 7) between '2019-01' and '2019-06'
group by left(order_date,4), substring(order_date, 6, 2);
-- Q19) 2019.01 ~ 2019.06 기간 주문에 대하여 주문연도별, 주문월별 전체금액 합과 평균을 조회하세요.
select left(order_date, 4), substring(order_date, 6, 2), sum(total_due), avg(total_due)
from order_header 
where substring(order_date, 1, 7) between '2019-01' and '2019-06'
group by left(order_date,4), substring(order_date, 6, 2);
-- Q20) 주문연도별, 주문월별 전체금액 합과 평균을 조회하고, rollup 함수를 이용하여 소계와 총계를 출력해주세요.
select 
    left(order_date,4)
    , substring(order_date, 6, 2)
    , sum(total_due)
	, avg(total_due)
from order_header 
where substring(order_date, 1, 7) between '2019-01' and '2019-06'
group by left(order_date,4), substring(order_date, 6, 2) with rollup;

-- 개선 GROUPING() 함수는 group by의 컬럼 형태와 select의 그것이 완벽하게 일치해야 하는 것 같음.
SELECT 
    IF(GROUPING(연도), '전체연도', 연도) AS 주문연도,
    IF(GROUPING(월), 
       CASE WHEN GROUPING(연도) THEN '전체월' ELSE '연도소계' END, 
       월) AS 주문월,
    SUM(total_due) AS 전체금액합,
    AVG(total_due) AS 전체금액평균
FROM (
    SELECT 
        LEFT(order_date, 4) AS 연도,
        SUBSTRING(order_date, 6, 2) AS 월,
        total_due
    FROM order_header 
    WHERE SUBSTRING(order_date, 1, 7) BETWEEN '2019-01' AND '2019-06'
) t
GROUP BY 연도, 월 WITH ROLLUP;

/**
	show databases;
    use myshop2019;
	테이블 조인 : 기본 SQL 방식, ANSI SQL
    select * from category;
    select * from customer;
    select * from employee;
    select * from product;
    select * from order_header;
    select * from sub_category;
    select * from order_detail;
    
*/
-- Q01) 전체금액이 8,500,000 이상인 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 전체금액을 조회하세요.
select oh.order_id, oh.customer_id, oh.employee_id, oh.order_date, oh.total_due
from order_header oh 
inner join customer c on oh.customer_id = c.customer_id
where oh.total_due >= 8500000;

-- Q02) 위에서 작성한 쿼리문을 복사해 붙여 넣은 후 고객이름도 같이 조회되게 수정하세요.
select oh.order_id, oh.customer_id, c.customer_name, oh.employee_id, oh.order_date, oh.total_due
from order_header oh 
inner join customer c on oh.customer_id = c.customer_id
where oh.total_due >= 8500000;

-- Q03) Q01 쿼리를 복사해 붙여 넣은 후 직원이름도 같이 조회되게 수정하세요.
select oh.order_id, oh.customer_id, oh.employee_id, e.employee_name, oh.order_date, oh.total_due
from order_header oh 
inner join customer c on oh.customer_id = c.customer_id
inner join employee e on oh.employee_id = e.employee_id
where oh.total_due >= 8500000;

-- Q04) 위에서 작성한 쿼리문을 복사해 붙여 넣은 후 고객이름, 직원이름도 같이 조회되게 수정하세요.
select oh.order_id, oh.customer_id, oh.employee_id, e.employee_name, oh.order_date, oh.total_due
from order_header oh 
inner join customer c on oh.customer_id = c.customer_id
inner join employee e on oh.employee_id = e.employee_id
where oh.total_due >= 8500000;

-- Q05) 위에서 작성한 쿼리문을 복사해 붙여 넣은 후 전체금액이 8,500,000 이상인 '서울' 지역 고객만 조회되게 수정하세요.
select oh.order_id, oh.customer_id, oh.employee_id, e.employee_name, oh.order_date, oh.total_due
from order_header oh 
inner join customer c on oh.customer_id = c.customer_id
inner join employee e on oh.employee_id = e.employee_id
where oh.total_due >= 8500000
	and c.city = '서울';

-- Q06) 위에서 작성한 쿼리문을 복사해 붙여 넣은 후 전체금액이 8,500,000 이상인 '서울' 지역 '남자' 고객만 조회되게 수정하세요.
select oh.order_id, oh.customer_id, oh.employee_id, e.employee_name, oh.order_date, oh.total_due
from order_header oh 
inner join customer c on oh.customer_id = c.customer_id
inner join employee e on oh.employee_id = e.employee_id
where oh.total_due >= 8500000
	and c.city = '서울'
    and c.gender = 'M';

-- Q07) 주문수량이 30개 이상인 주문의 주문번호, 상품코드, 주문수량, 단가, 지불금액을 조회하세요.
select od.order_id, od.product_id, od.order_qty, od.unit_price, od.line_total
from order_detail od
where od.order_qty >= 30;

-- Q08) 위에서 작성한 쿼리문을 복사해서 붙여 넣은 후 상품이름도 같이 조회되도록 수정하세요.
select od.order_id, od.product_id, p.product_name, od.order_qty, od.unit_price, od.line_total
from order_detail od
inner join product p on od.product_id = p.product_id
where od.order_qty >= 30;

-- Q09) 상품코드, 상품이름, 소분류아이디를 조회하세요.
select od.product_id, p.product_name, sc.sub_category_id
from order_detail od
inner join product p on od.product_id = p.product_id
inner join sub_category sc on p.sub_category_id = sc.sub_category_id
group by product_id;

-- Q10) 위에서 작성한 쿼리문을 복사해서 붙여 넣은 후 소분류이름, 대분류아이디가 조회되게 수정하세요.
select sc.sub_category_name, ci.category_id
from sub_category sc 
inner join category ci on sc.category_id = ci.category_id;

-- Q11) 다정한 사원이 2019년에 주문한 상품명을 모두 출력해주세요.
select distinct p.product_name
from employee e
inner join order_header oh on e.employee_id = oh.employee_id
inner join order_detail od on oh.order_id = od.order_id
inner join product p on od.product_id = p.product_id
where left(oh.order_date, 4) = '2019'
	and e.employee_name = '다정한';

-- Q12) 청소기를 구입한 고객아이디, 사원번호, 주문번호, 주문일시를 조회하세요.
select  c.customer_id, oh.employee_id, oh.order_id, oh.order_date, p.product_id
from customer c 
inner join order_header oh on c.customer_id = oh.customer_id
left outer join order_detail od on oh.order_id = od.order_id
left outer join product p on od.product_id = p.product_id
where p.product_name like '%청소기%';

select * from order_header where order_id in ('201805070003', '201805040001');
select * from order_detail where order_id in ('201805070003', '201805040001');
select * from product;
-- ED007~9