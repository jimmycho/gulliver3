
DROP TABLE T_PUBLISHER CASCADE CONSTRAINTS;

CREATE TABLE T_PUBLISHER (
       pubcode              NUMBER(7) NOT NULL,
       pubname              VARCHAR2(50) NOT NULL,
       phone                VARCHAR2(20) NOT NULL,
       zipcode              VARCHAR2(100) NULL,
       address1             VARCHAR2(100) NULL,
       address2             VARCHAR2(100) NULL,
       PRIMARY KEY (pubcode)
);


--T_PUBLISHER 등록
INSERT INTO T_PUBLISHER(pubcode, pubname, phone, zipcode, address1, address2)
VALUES((SELECT NVL(MAX(pubcode),0)+1 FROM T_PUBLISHER), '소설 출판사', '02-1234-1234', '123-123', '서울시 종로구', '123 번지');
INSERT INTO T_PUBLISHER(pubcode, pubname, phone, zipcode, address1, address2)
VALUES((SELECT NVL(MAX(pubcode),0)+1 FROM T_PUBLISHER), '참고서/수험서 출판사', '02-1234-1234', '123-123', '서울시 종로구', '123 번지');
INSERT INTO T_PUBLISHER(pubcode, pubname, phone, zipcode, address1, address2)
VALUES((SELECT NVL(MAX(pubcode),0)+1 FROM T_PUBLISHER), '외국어서적 출판사', '02-1234-1234', '123-123', '서울시 종로구', '123 번지');
INSERT INTO T_PUBLISHER(pubcode, pubname, phone, zipcode, address1, address2)
VALUES((SELECT NVL(MAX(pubcode),0)+1 FROM T_PUBLISHER), 'IT서적 출판사', '02-1234-1234', '123-123', '서울시 종로구', '123 번지');
INSERT INTO T_PUBLISHER(pubcode, pubname, phone, zipcode, address1, address2)
VALUES((SELECT NVL(MAX(pubcode),0)+1 FROM T_PUBLISHER), '만화/잡지 출판사', '02-1234-1234', '123-123', '서울시 종로구', '123 번지');
INSERT INTO T_PUBLISHER(pubcode, pubname, phone, zipcode, address1, address2)
VALUES((SELECT NVL(MAX(pubcode),0)+1 FROM T_PUBLISHER), '경제/경영 출판사', '02-1234-1234', '123-123', '서울시 종로구', '123 번지');


--T_PUBLISHER 목록
SELECT pubcode, pubname, phone, zipcode, address1, address2
FROM T_PUBLISHER
ORDER BY pubcode DESC

--T_PUBLISHER
DELETE FROM T_PUBLISHER 
WHERE pubcode = 1;