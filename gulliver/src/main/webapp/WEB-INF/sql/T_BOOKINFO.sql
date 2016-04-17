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
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '노인과 바다', 7200, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788937462788%3Fmoddttm=20160309070704', '먼 바다에서 펼쳐지는 노인의 고독한 사투! 미국 현대 문학의 개척자라 불리는 어니스트 헤밍웨이의 대표작 『노인과 바다』. 퓰리처상 수상작이자 헤밍웨이의 마지막 소설로, 작가...', 8937462788, 9788937462788, 
10, 8000, '민음사', '20120102', 1102, '어니스트 헤밍웨이', '김욱동', sysdate);
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), 
'캐롤', 11700, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788994040813%3Fmoddttm=20160309124133', 
'두 여인의 금기된 사랑! 미국 아카데미 6개 부문에 후보로 이름을 올린 영화 《캐롤》의 원작소설. 범죄 소설의 대가인 《열차 안의 낯선 자들》의 저자 퍼트리샤 하이스미스가 쓴...', 
8994040811, 9788994040813, 
10, 13000, '그책', '20160125', 1102, '퍼트리샤 하이스미스', '김미정', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),
'<b>앵무새 죽이기</b>',3000,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788931001990%3Fmoddttm=20160304064559',
'이미 국내에 소개되어 많은 사람들에게 감동을 준 소설 "앵무새 죽이기"의 영문학자 김욱동 교수 완역본. 사람을 무시하고 차별하는, 모든 어른들의 편견을 향한 아이들의 외침을 그린...',
'8931001991','9788931001990',
30,12000,'문예출판사','20080710','하퍼 리','김욱동', sysdate);




--한국소설 예제
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '글로리데이', 10620, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788968970252%3Fmoddttm=20160309124133', '제20회 부산국제영화제 ‘한국영화의 오늘 - 파노라마’ 섹션에 초청되며 이목을 모았고, 예매 오픈 15분 만에 2,500석을 초고속 매진시키는 이례적인 이슈를 만든 영화 《글로리데이...', 8968970254, 9788968970252, 
10, 11800, '가연', '20160303', 1101, '원보람', '', sysdate);
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '나의 요리사 마은숙 ', 11700, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FBOK00028889590IN%3Fmoddttm=20160309124133', '기억하는 노년의 여인과 기록하는 여인, 그들이 동행한 젊음과 상처와 죽음 속으로 사라진 사람들로의 여행 ●책 소개 2002년 『매일신문』 신춘문예에 「은빛 지렁이」로 등단하고...', 1186748605, 9791186748602, 
10, 13000, '나무옆의자', '20160304', 1101, '김설원', '', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'런던 여행백서',16200,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788998417130%3Fmoddttm=20160411072344','런던여행백서는 런던여행에 있어 꼭 필요한 다양한 정보들을 담고 있다. 여행 준비과정에 필요한 기초 정보는 물론 현지에서 유용하게 사용할 수 있는 저자만의 노하우, 지역별 다양한...',8998417138,9788998417130,30,18000,'나무자전거','20150620',1101,'정꽃나래','', sysdate);
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'채식주의자의 식탁',7200,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788932027654%3Fmoddttm=20160410062855','등단 17년차를 맞는 시인 이기성의 세 번째 시집. 이기성의 세번째 시집 『채식주의자의 식탁』. 이번 시집에는 2015년 현대문학상 수상작인 「굴 소년의 노래」를 비롯한 55편의 시가...',893202765X,9788932027654,30,8000,'문학과지성사','20150715',1101,'이기성','', sysdate);
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'올 어바웃 <b>커피</b>',16200,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FBOK00018464276BA%3Fmoddttm=20160411072344','전 세계 20여 개 나라에서 번역, 출간된 이 책 『올 어바웃 커피』는 세계적으로 각광을 받는 음료로 자리를 잡기까지 인간의 삶에 가까워진 커피에 인문과 역사의 옷을 입힌 책이다...',8992713053,9788992713054,30,18000,'세상의아침','20120710',1101,'우커스','박보경', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'<b>사서함 110호</b>의 우편물',1500,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788957574164%3Fmoddttm=20140512064537','30대 초중반, 적당히 쓸쓸하고 마음 한 자락을 조용히 접어버린 이들의 사랑 이야기. 사랑에 능숙하지 않은 이들이 진정한 관계의 의미를 찾아가는 과정을 그린 소설로, 톡톡 튀는...',8957574166,9788957574164,30,9000,'북박스','20040525',1101,'이도우','', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'<b>정글만리</b>. 1',12150,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788965744023%3Fmoddttm=20160411072344','거대한 중국을 무대로 활약하는 이들의 열정과 야망! 조정래의 장편소설 『정글만리』 제1권. 인터넷 포털사이트 네이버에 3월 25일부터 7월 10일까지 약 3개월여 동안 일러스트와...',8965744024,9788965744023,30,13500,'해냄출판사','20130701',1101,'조정래','', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'해냄/조정래 <b>정글만리</b> 세트(양장/전3권)',36450,' https://t1.search.daumcdn.net/thumb/P110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FBOK00022069488YE%3Fmoddttm=20150904062203','제목 없음 ◆ 책소개 이 묶음상품은 아래의 상품들로 구성되어 있습니다. 1. [도서] 정글만리 1 | <조정래> 저 | 해냄 2. [도서] 정글만리 2 | <조정래> 저 | 해냄 3. [도서] 정글만리...','',7051821000205,30,40500,'해냄','20130715',1101,'조정래','', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'<b>카뮈로부터</b> 온 편지',8550,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FDGT00029150643BA%3Fmoddttm=20160402104542','번역과 카뮈를 소재로 한 독특한 메타소설, 번역계의 ‘이방인’ 이정서의 문제작 전 세계인으로부터 사랑받는 카뮈의 [이방인]은 왜 유독 우리나라에서 지루하고, 재미없는 소설이 ...','',9781187192054,30,9500,'새움출판사','20160314',1101,'이정서','', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'<b>엄마를 부탁해</b>',10800,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788936433673%3Fmoddttm=20160411072344','어머니로서 아내로서 여자로서 엄마는 어떤 인생을 살았을까? 우리 어머니들의 삶과 사랑을 절절하고 아름답게 그려낸 신경숙의 소설『엄마를 부탁해』. 2007년 겨울부터 2008년 여름까지...',8936433679,9788936433673,30,12000,'창비','20081110',1101,'신경숙','', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'<b>천군</b> 7 (완결)',7200,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788955059977%3Fmoddttm=20150917062453','무명의 대체역사 전쟁소설. 30척으로 구성된 대한민국의 함대가 사라져버렸다. 그리고 그들이 나타난 때는 임진왜란이 잠시 소강 상태였던 1594년. 시공간을 초월하며 대만제국의 ...',8955059973,9788955059977,30,8000,'청어람','20040222',1101,'무명','', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'단추 <b>마녀</b>의 수상한 <b>식당</b>',9000,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9791185299426%3Fmoddttm=20160410062855','정란희 동화『단추 마녀의 수상한 식당』. 어린이들에게 한 번만 들어도 잔소리 같은 편식에 관한 이야기를 상상력과 결합시킨 이 책은 아이들에게 ‘올바른 식습관’을 전해 줄 그 어떤...',1185299424,9791185299426,30,10000,'키다리','20140125',1101,'정란희','', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'까칠한 <b>재석이</b> 1~4권 퍼즐 세트',40500,'https://t1.search.daumcdn.net/thumb/P110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9791186639122%3Fmoddttm=20160410062855','학교폭력과 문제아 학생의 변화를 다룬《까칠한 재석이가 사라졌다》, 청소년 사이에서 문화 트렌드로 자리 잡은 오디션 열풍의 문제점을 꼬집은 《까칠한 재석이가 돌아왔다》, 요즘...',1186639121,9791186639122,30,45000,'애플북스','20151125',1101,'고정욱','', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'마담 <b>뺑덕</b>',11700,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9791157400935%3Fmoddttm=20160411072344','욕망의 텍스트로 생생하게 불러낸 《심청전》! 정우성, 이솜 주연의 동명의 영화 《마담 뺑덕》과 함께 선보이는 백가흠의 소설 『마담 뺑덕』. 효의 미덕을 상징하는 대표적 작품인...',1157400930,9791157400935,30,13000,'네오픽션','20141010',1101,'백가흠','', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date) VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'언틸유아마인(Until you are mine)',13500,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788998274634%3Fmoddttm=20160411072344','독자를 속이는 맥거핀 기법의 진수를 보여주다! 모두의 예상을 깨는 대반전과 흥미로운 전개로 세계가 주목하는 스릴러 작가 사만다 헤이즈의 장편소설『언틸유아마인』. 알프레드...',8998274639,9788998274634,30,15000,'북플라자','20160131',1102,'사만다 헤이즈','박미경', sysdate);
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'<b>왕은 웃었다</b>. 5',9900,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788926774113%3Fmoddttm=20160410062855','류재빈의 장편소설 [왕은 웃었다] 제5권. 아기에의 아버지이자 진왕(眞王) 교활의 추적꾼을 피해 사막을 떠돌던 라야와 아기에, 기해 일행. 온천으로 유명한 수국(水國)에서 한숨 ...',8926774112,9788926774113,30,11000,'파피루스','20141017',1101,'류재빈','', sysdate);

--영어 책 회화 예제
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '어린왕자의 영문법 길들이기', 10620, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788982205866%3Fmoddttm=20160303063400', '세상에서 가장 쉽고 재밌는 영문법 가이드북 ≪어린 왕자의 영문법 길들이기-보급판≫. 이 책은 기존의 문법 용어나 문장 형태에 국한된 설명 대신 영어식 사고를 익힘으로써 영문법을...', 1186748605, 9791186748602, 
10, 11800, '넥서스', '20050705', 2210, '이재웅', '', sysdate);
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '초급 영어회화(EASY ENGLISH)(라디오)(3월호)', 5850, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR3904000111896%3Fmoddttm=20160309124133', '『초급 영어회화(EASY ENGLISH)』는 EBS FM 라디오 방송 교재이다. 매달 발행되고 있다.', 1228594007, 3904000111896, 
10, 6500, '동아출판', '20160220', 3220, '두산동아 편집부', '', sysdate);

--영어 문법
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '고등 영어영역 영어독해연습(2016)', 7650, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788954738002%3Fmoddttm=20160309124133', '독자대상 : 수능시험 준비생 - 구성 : 문제 + 정답 해설 - 특징 : ① 교육과정 및 교과서 분석 통한 핵심내용 제시 ② 수능형 연습 문제 통해 수능 유형 익히기 ③ 교육과정에 따른...', 8954738001, 9788954738002, 
10, 8500, 'EBS한국교육방송공사', '20160129', 2210, '편집부', '', sysdate);
INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13, 
stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)
VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO), '어린왕자의 영문법 길들이기', 10620, 'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788982205866%3Fmoddttm=20160303063400', '세상에서 가장 쉽고 재밌는 영문법 가이드북 ≪어린 왕자의 영문법 길들이기-보급판≫. 이 책은 기존의 문법 용어나 문장 형태에 국한된 설명 대신 영어식 사고를 익힘으로써 영문법을...', 1186748605, 9791186748602, 
10, 11800, '넥서스', '20050705', 2210, '이재웅', '', sysdate);

INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'도올의 <b>중국 일기</b>. 4',17100,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788982644542%3Fmoddttm=20160417063017','도올 김용옥의 새로운 지적 모험 『도올의 중국 일기』는 한국을 대표하는 사상가인 도올 김용옥이 한 학기 동안 중국 연변자치주의 문화적 센터인 연변대학에서 객좌교수로서 강의를...',8982644547,9788982644542,30,19000,'통나무','20151124',1101,'김용옥','', sysdate);
 INSERT INTO T_BOOKINFO(bookid, bookname, sale_price, bookfront_photo, book_explain, ISBN10, ISBN13,stock_cnt, cur_price, publisher, pub_date, BOOK_CATE_CD, writer, traductor, input_date)VALUES((SELECT NVL(MAX(bookid),0) + 1 AS bookid FROM T_BOOKINFO),'[비밀독서단2] 국가론 (돋을새김 푸른책장 시리즈 6...',9000,'https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788961671729%3Fmoddttm=20160417061619','국가 혹은 정의에 관한 철학적 향연! 청소년과 철학입문자들을 위해 이해하기 쉽도록 정리하고 구성한 「돋을새김 푸른책장 시리즈」 여섯 번째 이야기 『국가론』. 우리에게 가장...',8961671723,9788961671729,30,10000,'돋을새김도','20141230',1101,'플라톤','', sysdate);

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
WHERE bookid = 3

-- 주문시 수량 감소
UPDATE T_BOOKINFO SET stock_cnt = (stock_cnt - 2)
WHERE bookid = 8

select * from T_BOOKINFO;