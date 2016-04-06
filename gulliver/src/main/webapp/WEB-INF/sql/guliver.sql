------------------------- 테이블 삭제-------------------------
DROP TABLE T_BOOKCATE CASCADE CONSTRAINTS;
DROP TABLE T_BOOKINFO CASCADE CONSTRAINTS;
DROP TABLE T_COMMENT CASCADE CONSTRAINTS;
DROP TABLE T_USER CASCADE CONSTRAINTS;
DROP TABLE T_CART CASCADE CONSTRAINTS;
DROP TABLE T_ORDER CASCADE CONSTRAINTS;
DROP TABLE T_NOTICE CASCADE CONSTRAINTS;
DROP TABLE T_FAQ CASCADE CONSTRAINTS;
------------------------- 테이블 삭제-------------------------





CREATE TABLE T_BOOKCATE (
       BOOK_CATE_CD         NUMBER(10) NOT NULL,
       BOOK_CATE_NAME       VARCHAR2(50) NULL,
       HIGH_LINK_CD         NUMBER(10) NULL,
       PRIMARY KEY (BOOK_CATE_CD), 
       FOREIGN KEY (HIGH_LINK_CD) REFERENCES T_BOOKCATE
);


------------------------- 테이블 생성 -------------------------
CREATE TABLE T_BOOKINFO (
       bookid               NUMBER(7) NOT NULL,					-- bookid (PK)
       bookname             VARCHAR2(100) DEFAULT 0 NOT NULL,	-- 책이름
       sale_price           NUMBER(10) NULL,					-- 할인가격
       bookfront_photo      VARCHAR2(2000) NULL,				-- 책 표지 사진명
       book_explain         VARCHAR2(4000) NULL,				-- 책 설명
       ISBN10               NUMBER(20) NULL,					-- ISBN 10자리
       ISBN13               NUMBER(20) NULL,					-- ISBN 13자리
       stock_cnt            NUMBER(10) DEFAULT 0 NULL,			-- 재고량
       cur_price            NUMBER(10) DEFAULT 0 NULL,			-- 정가
       publisher            VARCHAR2(50) NULL,					-- 출판사
       pub_date             VARCHAR2(30) NULL,					-- 출판일시
       BOOK_CATE_CD         NUMBER(10) NOT NULL,				-- 책분류 코드 (FK)
       writer               VARCHAR2(30) NULL,					-- 저자
       traductor            VARCHAR2(30) NULL,					-- 번역자
       input_date           DATE NOT NULL,						-- 입력일시
       PRIMARY KEY (bookid), 
       FOREIGN KEY (BOOK_CATE_CD) REFERENCES T_BOOKCATE
);



CREATE TABLE T_COMMENT (
       seq                  NUMBER(7) NOT NULL,
       star_cnt             NUMBER(2) NOT NULL,
       say100ja             VARCHAR2(500) NOT NULL,
       input_date           DATE NOT NULL,
       bookid               NUMBER(7) NOT NULL,
       userid               VARCHAR2(50) NOT NULL,
       PRIMARY KEY (seq), 
       FOREIGN KEY (bookid) REFERENCES T_BOOKINFO,
       FOREIGN KEY (userid) REFERENCES T_USER
);



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



CREATE TABLE T_CART (
       CARTNO               NUMBER(7) NOT NULL,
       cart_cnt             NUMBER(7) DEFAULT 0 NULL,
       order_whether        VARCHAR2(20) NULL,
       input_date           DATE NULL,
       userid               VARCHAR2(50) NOT NULL,
       bookid               NUMBER(7) NOT NULL,
       PRIMARY KEY (CARTNO), 
       FOREIGN KEY (bookid) REFERENCES T_BOOKINFO, 
       FOREIGN KEY (userid) REFERENCES T_USER
);




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



CREATE TABLE T_NOTICE (
       noticeno             NUMBER(7) NOT NULL,
       title                VARCHAR2(100) NULL,
       content              VARCHAR2(4000) NULL,
       writer               VARCHAR2(20) NOT NULL,
       notice_cnt           NUMBER(7) DEFAULT 0 NULL,
       in_date              DATE NULL,
       PRIMARY KEY (noticeno)
);




CREATE TABLE T_FAQ (
       faqno                NUMBER(7) NOT NULL,
       title                VARCHAR2(100) NULL,
       content              VARCHAR2(4000) NULL,
       faq_cat              VARCHAR2(20) NULL,
       faq_cnt              NUMBER(10) DEFAULT 0 NULL,
       in_date              DATE NULL,
       PRIMARY KEY (faqno)
);
------------------------- 테이블 생성 -------------------------


