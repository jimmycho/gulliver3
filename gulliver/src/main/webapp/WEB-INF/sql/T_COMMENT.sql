
DROP TABLE T_COMMENT CASCADE CONSTRAINTS;

CREATE TABLE T_COMMENT (
       seq                  NUMBER(7) NOT NULL,		--댓글번호
       star_cnt             NUMBER(2) NOT NULL,		--별점
       say100ja             VARCHAR2(200) NOT NULL,	--100자평
       input_date           DATE NOT NULL,			--입력일
       bookid               NUMBER(7) NULL,			--bookid
       PRIMARY KEY (seq), 
       FOREIGN KEY (bookid) REFERENCES T_BOOKINFO
);

select * from T_COMMENT;


--T_COMMENT 목록

SELECT seq, star_cnt, say100ja, input_date, bookid, r
FROM(
    SELECT seq, star_cnt, say100ja, input_date, bookid, rownum r
    FROM(
          SELECT seq, star_cnt, say100ja, input_date, bookid
          FROM T_COMMENT
          --WHERE bookid = 1
          ORDER BY seq DESC
        )
)
WHERE r >= 1 and r <= 5;
       


--T_COMMENT 입력
INSERT INTO T_COMMENT(seq, star_cnt, say100ja, input_date, bookid)
VALUES((SELECT NVL(MAX(seq),0) + 1 FROM T_COMMENT), '5', '내용도 좋고 참 재미 있었습니다!! 강추!!^^', sysdate, 1);

INSERT INTO T_COMMENT(seq, star_cnt, say100ja, input_date, bookid)
VALUES((SELECT NVL(MAX(seq),0) + 1 FROM T_COMMENT), '4', '저는 개인 적으로 비추 입니다ㅡ_ㅡ', sysdate, 1);

INSERT INTO T_COMMENT(seq, star_cnt, say100ja, input_date, bookid)
VALUES((SELECT NVL(MAX(seq),0) + 1 FROM T_COMMENT), '3', '강추강추!!', sysdate, 1);

INSERT INTO T_COMMENT(seq, star_cnt, say100ja, input_date, bookid)
VALUES((SELECT NVL(MAX(seq),0) + 1 FROM T_COMMENT), '3', '내용도 좋고 참 재미 있었습니다!! 강추!!^^', sysdate, 2);

INSERT INTO T_COMMENT(seq, star_cnt, say100ja, input_date, bookid)
VALUES((SELECT NVL(MAX(seq),0) + 1 FROM T_COMMENT), '3', '저는 개인 적으로 비추 입니다ㅡ_ㅡ', sysdate, 3);

INSERT INTO T_COMMENT(seq, star_cnt, say100ja, input_date, bookid)
VALUES((SELECT NVL(MAX(seq),0) + 1 FROM T_COMMENT), '3', '강추강추!!', sysdate, 4);


--T_COMMENT 수정
UPDATE T_COMMENT SET
star_cnt = '1', 
say100ja = '내용수정!!', 
input_date = sysdate
WHERE seq = 1;

--T_COMMENT 삭제
DELETE 
FROM T_COMMENT
WHERE seq = 1;

--T_COMMENT 읽기
SELECT seq, star_cnt, say100ja, input_date, bookid
FROM T_COMMENT
WHERE seq = 1

--T_COMMENT 댓글 총 갯수
SELECT COUNT(*)
FROM T_COMMENT
WHERE bookid = 1


