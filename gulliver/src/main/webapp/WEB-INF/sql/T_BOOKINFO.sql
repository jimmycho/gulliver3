select * from T_BOOKINFO;
--오리지널 코드
SELECT bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
	   		stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date, r 
FROM (
	      SELECT bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
				 stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date, rownum r      
	      FROM (
	          SELECT b.bookid, b.bookname, b.sale_price, b.bookfront_photo, b.book_explain, b.ISBN10, b.ISBN13, 
					 b.stock_cnt, b.cur_price, b.publisher, b.pub_date, b.BOOK_CATE_CD, b.writer, b.traductor, b.input_date
	          FROM T_BOOKINFO B, T_BOOKCATE C
		          where
					C.BOOK_CATE_CD = 3111 AND B.bookname LIKE '%글로리%'
		          ORDER BY bookid DESC
	          )
	      )
	   WHERE r >= 1 and r <= 5;
--테스트용	   
 SELECT bookid, bookname, BOOK_CATE_CD
	          FROM T_BOOKINFO 
		          where
					BOOK_CATE_CD >= 1000 and BOOK_CATE_CD < (1000+1000) AND bookname LIKE '%글로리%'
		          ORDER BY bookid DESC	   
	   


DROP TABLE T_BOOKINFO CASCADE CONSTRAINTS;
  
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

SELECT *
FROM T_BOOKCATE
SELECT *
FROM T_BOOKINFO
--T_BOOKINFO 메인 목록
SELECT bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
	   stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date, r 
FROM (
      SELECT bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
			 stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date, rownum r      
      FROM (
	          SELECT b.bookid, b.bookname, b.sale_price, b.bookfront_photo, b.book_explain, b.ISBN10, b.ISBN13, 
					 b.stock_cnt, b.cur_price, b.publisher, b.pub_date, b.BOOK_CATE_CD, b.writer, b.traductor, b.input_date, c.BOOK_CATE_CD
	          FROM T_BOOKINFO B, T_BOOKCATE C	    
	          WHERE b.bookname LIKE '%노인%' and c.BOOK_CATE_CD = 1102
	          GROUP BY b.BOOK_CATE_CD
	          --ORDER BY b.bookid DESC
          )
      )
WHERE r >= 1 and r <=5;


	          SELECT b.bookid, b.bookname, b.sale_price, b.bookfront_photo, b.book_explain, b.ISBN10, b.ISBN13, 
					 b.stock_cnt, b.cur_price, b.publisher, b.pub_date, b.BOOK_CATE_CD, b.writer, b.traductor, b.input_date
	          FROM T_BOOKINFO B, T_BOOKCATE C	    
	          WHERE b.bookname LIKE '%노인%' and c.HIGH_LINK_CD = 1000
	          GROUP BY b.bookid, b.bookname, b.sale_price, b.bookfront_photo, b.book_explain, b.ISBN10, b.ISBN13, 
					 b.stock_cnt, b.cur_price, b.publisher, b.pub_date, b.BOOK_CATE_CD, b.writer, b.traductor, b.input_date


--T_BOOKINFO 책 목록
SELECT bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
	   stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date, r 
FROM (
      SELECT bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
			 stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date, rownum r      
      FROM (
	          SELECT bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
					 stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date
	          FROM T_BOOKINFO 
	          --WHERE b.bookname LIKE '%칼의%' AND c.BOOK_CATE_CD = 1000
	          ORDER BY b.bookid DESC
          )
      )
WHERE r >= 1 and r <=5;

--T_BOOKINFO 총 갯수
SELECT COUNT(*) FROM T_BOOKINFO


--T_BOOKINFO 책 읽기
SELECT bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
	stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date
FROM T_BOOKINFO
WHERE bookid = 1;


--T_BOOKINFO 입력
--외국소설 예제
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '노인과 바다', 7200, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788937462788%3Fmoddttm=20160309070704', '먼 바다에서 펼쳐지는 노인의 고독한 사투! 미국 현대 문학의 개척자라 불리는 어니스트 헤밍웨이의 대표작 『노인과 바다』. 퓰리처상 수상작이자 헤밍웨이의 마지막 소설로, 작가...', '8937462788', '9788937462788', 
10, 8000, '민음사', '20120102', 1102, '어니스트 헤밍웨이', '김욱동', sysdate);
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '캐롤', 11700, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788994040813%3Fmoddttm=20160309124133', '두 여인의 금기된 사랑! 미국 아카데미 6개 부문에 후보로 이름을 올린 영화 《캐롤》의 원작소설. 범죄 소설의 대가인 《열차 안의 낯선 자들》의 저자 퍼트리샤 하이스미스가 쓴...', '8994040811', '9788994040813', 
10, 13000, '그책', '20160125', 1102, '퍼트리샤 하이스미스', '김미정', sysdate);

--한국소설 예제
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '글로리데이', 10620, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788968970252%3Fmoddttm=20160309124133', '제20회 부산국제영화제 ‘한국영화의 오늘 - 파노라마’ 섹션에 초청되며 이목을 모았고, 예매 오픈 15분 만에 2,500석을 초고속 매진시키는 이례적인 이슈를 만든 영화 《글로리데이...', '8968970254', '9788968970252', 
10, 11800, '가연', '20160303', 1101, '원보람', '', sysdate);
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '나의 요리사 마은숙 ', 11700, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FBOK00028889590IN%3Fmoddttm=20160309124133', '기억하는 노년의 여인과 기록하는 여인, 그들이 동행한 젊음과 상처와 죽음 속으로 사라진 사람들로의 여행 ●책 소개 2002년 『매일신문』 신춘문예에 「은빛 지렁이」로 등단하고...', '1186748605', '9791186748602', 
10, 13000, '나무옆의자', '20160304', 1101, '김설원', '', sysdate);

--영어 책 회화 예제
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '어린왕자의 영문법 길들이기', 10620, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788982205866%3Fmoddttm=20160303063400', '세상에서 가장 쉽고 재밌는 영문법 가이드북 ≪어린 왕자의 영문법 길들이기-보급판≫. 이 책은 기존의 문법 용어나 문장 형태에 국한된 설명 대신 영어식 사고를 익힘으로써 영문법을...', '1186748605', '9791186748602', 
10, 11800, '넥서스', '20050705', 2210, '이재웅', '', sysdate);
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '초급 영어회화(EASY ENGLISH)(라디오)(3월호)', 5850, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR3904000111896%3Fmoddttm=20160309124133', '『초급 영어회화(EASY ENGLISH)』는 EBS FM 라디오 방송 교재이다. 매달 발행되고 있다.', '1228594007', '3904000111896', 
10, 6500, '동아출판', '20160220', 3220, '두산동아 편집부', '', sysdate);

--영어 문법
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '고등 영어영역 영어독해연습(2016)', 7650, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788954738002%3Fmoddttm=20160309124133', '독자대상 : 수능시험 준비생 - 구성 : 문제 + 정답 해설 - 특징 : ① 교육과정 및 교과서 분석 통한 핵심내용 제시 ② 수능형 연습 문제 통해 수능 유형 익히기 ③ 교육과정에 따른...', '8954738001', '9788954738002', 
10, 8500, 'EBS한국교육방송공사', '20160129', 2210, '편집부', '', sysdate);
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '어린왕자의 영문법 길들이기', 10620, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788982205866%3Fmoddttm=20160303063400', '세상에서 가장 쉽고 재밌는 영문법 가이드북 ≪어린 왕자의 영문법 길들이기-보급판≫. 이 책은 기존의 문법 용어나 문장 형태에 국한된 설명 대신 영어식 사고를 익힘으로써 영문법을...', '1186748605', '9791186748602', 
10, 11800, '넥서스', '20050705', 2210, '이재웅', '', sysdate);



--T_BOOKINFO 수정
UPDATE T_BOOKINFO SET
       bookname        = '홍길동 전집',
       sale_price      = 100,
       bookfront_photo = 'test.jpg',
       book_explain    =  '테스트입니다',
       ISBN10          =  '1234',
       ISBN13          =  '12345',
       stock_cnt       =  1,
       cur_price       =  100,
       publisher       =  '홍길동서적',
       pub_date        =  '20160303',
       BOOK_CATE_CD    =  400,
       writer          =  '홍길동',
       traductor       =  '홍길동',
       input_date      = sysdate
WHERE bookid = 4


--T_BOOKINFO 삭제
DELETE FROM T_BOOKINFO 
WHERE bookid = 2



