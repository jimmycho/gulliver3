
DROP TABLE T_NOTICE CASCADE CONSTRAINTS;

CREATE TABLE T_NOTICE (
       noticeno             NUMBER(7) NOT NULL,			-- 공지번호
       title                VARCHAR2(100) NULL,			-- 제목
       content              VARCHAR2(4000) NULL,		-- 내용
       writer               VARCHAR2(20) NOT NULL,		-- 작성자
       notice_cnt           NUMBER(7) DEFAULT 0 NULL,	-- 조회수
       in_date              DATE NULL,					-- 작성일
       PRIMARY KEY (noticeno)
);

select * from T_NOTICE 
--T_NOTICE 등록
INSERT INTO T_NOTICE(noticeno, title, content, writer, notice_cnt, in_date) 
VALUES((SELECT NVL(MAX(noticeno),0) + 1 as noticeno FROM T_NOTICE), '걸리버 공지1 입니다!!', '걸리버를 사랑해주세요~~~', '관리자', 0, sysdate);


--T_NOTICE 목록
SELECT noticeno, title, content, writer, notice_cnt, in_date, r
FROM(
    SELECT noticeno, title, content, writer, notice_cnt, in_date, rownum r
    FROM(
        SELECT noticeno, title, content, writer, notice_cnt, in_date 
        FROM T_NOTICE
        --WHERE title LIKE '%%' 
        ORDER BY noticeno DESC
    )
)
WHERE r >= 1 and r <= 5;
 
--T_NOTICE 삭제
DELETE FROM T_NOTICE
WHERE noticeno = 1;

--T_NOTICE 수정
UPDATE T_NOTICE SET 
title = '공지테스트입니다',
content = '공지 테스트를 하고 있어요~~', 
writer = '관리자', 
in_date = sysdate
WHERE noticeno = 1;


--T_NOTICE 조횟수증가
UPDATE T_NOTICE SET 
notice_cnt = notice_cnt + 1
WHERE noticeno = 10;


--T_NOTICE 글 총갯수
SELECT COUNT(*)
FROM T_NOTICE
WHERE TITLE LIKE '%공지%';
