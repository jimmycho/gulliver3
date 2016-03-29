
DROP TABLE T_ORDER CASCADE CONSTRAINTS;

CREATE TABLE T_ORDER (
       orderno              NUMBER(7) NOT NULL,			-- 주문번호
       del_method           VARCHAR2(20) NULL,			-- 배송방법
       recipient            VARCHAR2(20) NULL,			-- 수령인
       total                NUMBER(10) DEFAULT 0 NULL,	-- 총금액
       order_cnt            NUMBER(7) NULL,				-- 수량
       del_zipcode          VARCHAR(50) NULL,			-- 우편번호
       del_address1         VARCHAR(100) NULL,			-- 주소1
       del_address2         VARCHAR(100) NULL,			-- 주소2
       order_comment        VARCHAR2(100) NULL,			-- 배달원에게 남기는 말
       order_date			DATE NOT NULL,				-- 주문일
       bookid               NUMBER(7) NOT NULL,			-- bookid
       userid               VARCHAR2(50) NOT NULL,		-- userid
       PRIMARY KEY (orderno), 
       FOREIGN KEY (userid) REFERENCES T_USER, 
       FOREIGN KEY (bookid) REFERENCES T_BOOKINFO
);

select * from T_ORDER

--T_ORDER 목록
SELECT orderno, del_method, recipient, total, order_cnt, order_comment, bookid, bookname, userid, del_zipcode, del_address1, del_address2, order_date, rownum r
FROM (
      SELECT orderno, del_method, recipient, total, order_cnt, order_comment, bookid, bookname, userid, del_zipcode, del_address1, del_address2, order_date, rownum r
      FROM (
			SELECT r.orderno, r.del_method, r.recipient, r.total, r.order_cnt, r.order_comment, r.bookid, b.bookname, r.userid, r.del_zipcode, r.del_address1, r.del_address2, r.order_date
			FROM T_ORDER R, T_BOOKINFO B
            --WHERE orderno LIKE '%1%'
            WHERE r.bookid = b.bookid --AND r.userid = 'user1'
            ORDER BY orderno DESC
            )
)
WHERE r >= 1 and r <= 5
      
 
--T_ORDER 주문글 읽기
SELECT r.orderno, r.del_method, r.recipient, r.total, r.order_cnt, r.order_comment, r.bookid, b.bookname, r.userid, r.del_zipcode, r.del_address1, r.del_address2, r.order_date
FROM T_ORDER R, T_BOOKINFO B
WHERE r.bookid = b.bookid AND r.orderno = 7
ORDER BY orderno DESC

--T_ORDER 주문글 갯수
SELECT COUNT(*)	
FROM T_ORDER R, T_BOOKINFO B
WHERE r.bookid = b.bookid AND r.userid = 'user1' 
--AND orderno = 1 


--T_ORDER 삭제
DELETE FROM T_ORDER
WHERE orderno = 2


--T_ORDER 수정 전에 user정보 읽기
SELECT userid, name, email, phone, callphone, zipcode, address1, address2  
FROM T_USER
WHERE userid = 'user5';


CREATE TABLE T_USER (
       userid               VARCHAR2(50) NOT NULL,
       grade                VARCHAR2(2) NOT NULL,
       passwd               VARCHAR2(50) NOT NULL,
       name                 VARCHAR2(50) NOT NULL,
       email                VARCHAR2(50) NULL,
       birthdate            VARCHAR2(20) NOT NULL,
       phone                VARCHAR2(20) NULL,
       callphone            VARCHAR2(20) NULL,
       zipcode              VARCHAR2(50) NULL,
       address1             VARCHAR2(100) NULL,
       userphoto            VARCHAR2(50) NULL,
       address2             VARCHAR2(100) NULL,
       joindate             DATE NULL,
       PRIMARY KEY (userid)
);

--주문전에 장바구니에서 주문자의 정보, 장바구니 내용 가져오기
SELECT CARTNO, USERID, NAME, ZIPCODE, ADDRESS1, ADDRESS2, PHONE, CALLPHONE,
		INPUT_DATE, CUR_PRICE, CART_CNT, ORDER_WHETHER,
		BOOKID, BOOKNAME
FROM
	(
		SELECT C.CARTNO, U.USERID, U.NAME, U.ZIPCODE, U.ADDRESS1, U.ADDRESS2, U.PHONE, U.CALLPHONE,
				C.INPUT_DATE, B.CUR_PRICE, C.CART_CNT, C.ORDER_WHETHER,
				B.BOOKID, B.BOOKNAME
		FROM T_CART C, T_USER U, T_BOOKINFO B
		WHERE B.BOOKID = C.BOOKID AND U.USERID = C.USERID
	)
WHERE USERID='user7';


select *
from t_order

--T_ORDER 등록
INSERT INTO T_ORDER(orderno, del_method, recipient, total, order_cnt, order_comment, bookid, userid, del_zipcode, del_address1, del_address2, order_date)
VALUES((SELECT NVL(MAX(orderno),0 ) + 1 AS orderno FROM T_ORDER), '편의점', '홍길동', 44000, 4, '부재시 문 앞에 놔주세요', 1, 'user1', '123-123', '은평구 갈현동', '12-122', sysdate);

INSERT INTO T_ORDER(orderno, del_method, recipient, total, order_cnt, order_comment, bookid, userid, del_zipcode, del_address1, del_address2, order_date)
VALUES((SELECT NVL(MAX(orderno),0 ) + 1 AS orderno FROM T_ORDER), '우체국택배', '김길동', 30000, 3, '빠른 배송 부탁해요', 2, 'user2', '123-123', '은평구 증산동', '12-122', sysdate);

INSERT INTO T_ORDER(orderno, del_method, recipient, total, order_cnt, order_comment, bookid, userid, del_zipcode, del_address1, del_address2, order_date)
VALUES((SELECT NVL(MAX(orderno),0 ) + 1 AS orderno FROM T_ORDER), '방문수령', '이길동', 20000, 2, '배달 감사합니다', 3, 'user3', '123-123', '은평구 응암동', '12-122', sysdate);

INSERT INTO T_ORDER(orderno, del_method, recipient, total, order_cnt, order_comment, bookid, userid, del_zipcode, del_address1, del_address2, order_date)
VALUES((SELECT NVL(MAX(orderno),0 ) + 1 AS orderno FROM T_ORDER), '우체국택배', '박길동', 10000, 4, '빨리좀!! 배송 해주세요 현기증 난단 말이에요!!', 3, 'user4', '123-123', '종로구 관철동', '12-122', sysdate);

INSERT INTO T_ORDER(orderno, del_method, recipient, total, order_cnt, order_comment, bookid, userid, del_zipcode, del_address1, del_address2, order_date)
VALUES((SELECT NVL(MAX(orderno),0 ) + 1 AS orderno FROM T_ORDER), '우체국택배', '조길동', 10000, 5, '빨리좀!!', 3, 'user5', '123-123', '관악구', '12-122', sysdate);

INSERT INTO T_ORDER(orderno, del_method, recipient, total, order_cnt, order_comment, bookid, userid, del_zipcode, del_address1, del_address2, order_date)
VALUES((SELECT NVL(MAX(orderno),0 ) + 1 AS orderno FROM T_ORDER), '우체국택배', '염길동', 10000, 6, '파손되지 않게 주의해주세요', 3, 'user6', '123-123', '강남구 논현동', '12-122', sysdate);

INSERT INTO T_ORDER(orderno, del_method, recipient, total, order_cnt, order_comment, bookid, userid, del_zipcode, del_address1, del_address2, order_date)
VALUES((SELECT NVL(MAX(orderno),0 ) + 1 AS orderno FROM T_ORDER), '우체국택배', '이길동', 10000, 7, '책입니다 빠른배송해주세요', 3, 'user7', '123-123', '강남구 신논현동', '12-122', sysdate);





