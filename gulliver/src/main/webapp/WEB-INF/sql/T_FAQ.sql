--FAQ테이블 (T_FAQ)
DROP TABLE T_FAQ CASCADE CONSTRAINTS;

CREATE TABLE T_FAQ (
       faqno                NUMBER(7) NOT NULL, --번호
       title                VARCHAR2(100) NOT NULL, --제목
       content              VARCHAR2(4000) NOT NULL, --내용
       faq_cat              VARCHAR2(20) NOT NULL, --분류
       faq_cnt                NUMBER(10) DEFAULT 0, --조회수
       in_date              DATE NOT NULL, --등록일
       PRIMARY KEY (faqno)
);

select * from t_faq; 

-- SEQUENCE 객체 삭제 
DROP SEQUENCE faq_seq; 
 
-- SEQUENCE 객체 생성 
CREATE SEQUENCE faq_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 

--SELECT faq_seq.nextval FROM dual;

--1. 글 등록
INSERT INTO T_FAQ(faqno, faq_cat, title, content,  faq_cnt, in_date) 
VALUES((select NVL(max(faqno),0)+1 as faqno from T_FAQ), '주문/결제', 
'주문상품이 왜 품절(일시품절/절판) 입니까?', 
'주문 후 일부상품은 출판사,거래처의 실시간 재고변동에 의해 소진될 경우 품절,절판,일시품절 등 
서비스 불가능한 경우가 발생할 수 있습니다. 나머지 상품이 아직 확보중이면, 주문 출고예상일 까지 
확보하면서 품절상품의 확보 시도를 계속하게 됩니다. 원하실 경우 해당 상품은 주문조회 후 품절상태 
확인 즉시, 주문취소 클릭 후 해당 상품만 또는 전체상품 취소 하실 수 있습니다.'
, 0,sysdate); 


--2.전체 글 목록 LIST,최신글 먼저 출력
select faqno, faq_cat, title, content, faq_cnt, in_date
from T_FAQ 
order by faqno DESC;

select faqno, faq_cat, title, content, faq_cnt, in_date
from T_FAQ 
where content LIKE '%배송%'
order by faqno DESC;



--3.조회수 증가
UPDATE T_FAQ
SET faq_cnt =faq_cnt+1
where faqno=1;

--4. 1건의 faq 보기 
select faqno, faq_cat, title, content, faq_cnt, in_date
from T_FAQ 
WHERE faqno =1;

--5. 글 수정
UPDATE T_FAQ
SET faq_cat='배송', title='배송처 변경', content='배송지 주소를 변경하는 방법은..',in_date=sysdate
WHERE faqno= 1;

--6. 글 삭제
DELETE from T_FAQ
WHERE faqno=3;