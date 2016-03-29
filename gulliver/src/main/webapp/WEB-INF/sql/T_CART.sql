SELECT cartno, bookid, bookname, input_date, cur_price, cart_cnt , order_whether
FROM
(
SELECT C.cartno, B.bookid, B.bookname, C.input_date, B.cur_price, C.cart_cnt, C.order_whether
FROM T_CART C, T_BOOKINFO B
WHERE B.BOOKID=C.BOOKID
)
WHERE cartno=11

--Book Cart 
SELECT * FROM T_CART;
SELECT * FROM t_USER;
SELECT * FROM T_BOOKINFO;

select order_whether from t_cart;

DROP TABLE T_CART CASCADE CONSTRAINTS;

CREATE TABLE T_CART (
       CARTNO               NUMBER(7) NOT NULL,
       cart_cnt             NUMBER(7) DEFAULT 0,
       order_whether        VARCHAR2(20) NULL,
       input_date           DATE NOT NULL,
       USERID               VARCHAR2(50) NOT NULL,
       BOOKID               NUMBER(7) NOT NULL,
       PRIMARY KEY (CARTNO),
       FOREIGN KEY (BOOKID)
                             REFERENCES T_BOOKINFO, 
       FOREIGN KEY (USERID)
                             REFERENCES T_USER
);

select * from t_cart;

DROP SEQUENCE cart_seq; 

CREATE SEQUENCE CART_SEQ 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 


--0.초기 데이터 입력
INSERT INTO T_CART ( CARTNO, CART_CNT, ORDER_WHETHER,INPUT_DATE, userid, bookid)
VALUES ((select NVL(max(CARTNO),0)+1 as CARTNO from T_CART), 1,'N', SYSDATE, 'user1' , '1');

INSERT INTO T_CART ( CARTNO, CART_CNT, ORDER_WHETHER,INPUT_DATE, userid, bookid)
VALUES ((select NVL(max(CARTNO),0)+1 as CARTNO from T_CART), 2,'N', SYSDATE, 'user2' , '2');

INSERT INTO T_CART ( CARTNO, CART_CNT, ORDER_WHETHER,INPUT_DATE, userid, bookid)
VALUES ((select NVL(max(CARTNO),0)+1 as CARTNO from T_CART), 3,'N', SYSDATE, 'user3' , '3');
INSERT INTO T_CART ( CARTNO, CART_CNT, ORDER_WHETHER,INPUT_DATE, userid, bookid)
VALUES ((select NVL(max(CARTNO),0)+1 as CARTNO from T_CART), 2,'N', SYSDATE, 'user4' , '4');
INSERT INTO T_CART ( CARTNO, CART_CNT, ORDER_WHETHER,INPUT_DATE, userid, bookid)
VALUES ((select NVL(max(CARTNO),0)+1 as CARTNO from T_CART), 1,'N', SYSDATE, 'user5' , '5');

--1.Create
--장바구니 추가
INSERT INTO T_CART ( CARTNO, CART_CNT, ORDER_WHETHER,INPUT_DATE, userid, bookid)
VALUES ((select NVL(max(CARTNO),0)+1 as CARTNO from T_CART), 1,'N', SYSDATE, 'user7' , '8');
INSERT INTO T_CART ( CARTNO, CART_CNT, ORDER_WHETHER,INPUT_DATE, userid, bookid)
VALUES ((select NVL(max(CARTNO),0)+1 as CARTNO from T_CART), 5,'N', SYSDATE, 'user7' , '1');


--2.Read
--(2-1)List 회원개인의 장바구니 내용 보여주기
SELECT CARTNO, NAME,  BOOKID,BOOKNAME, INPUT_DATE, CUR_PRICE, CART_CNT , ORDER_WHETHER
from
(
SELECT C.CARTNO, U.USERID, U.NAME, B.BOOKID,B.BOOKNAME, C.INPUT_DATE, B.CUR_PRICE, C.CART_CNT,C.ORDER_WHETHER
FROM T_CART C, T_USER U, T_BOOKINFO B
WHERE B.BOOKID=C.BOOKID AND U.USERID=C.USERID
)
where USERID='user3';

--(2-2)모든회원의 장바구니 내용보여주기(Admin)
SELECT C.CARTNO, U.USERID, U.NAME, B.BOOKID,B.BOOKNAME, C.INPUT_DATE, B.CUR_PRICE, C.CART_CNT
FROM T_CART C, T_USER U, T_BOOKINFO B
WHERE B.BOOKID=C.BOOKID AND U.USERID=C.USERID
ORDER BY C.CARTNO ASC;

--3.Update
--장바구니 수정(수량, 상품)
UPDATE T_CART  
SET CART_CNT=2, BOOKID=2
WHERE userid = 'user7'; 

--4.DELETE
--장바구니 삭제
DELETE FROM T_CART
WHERE CARTNO = 6

SELECT COUNT(*) FROM T_CART
where userid like '%%'