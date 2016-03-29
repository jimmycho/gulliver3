
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


--T_PUBLISHER ���
INSERT INTO T_PUBLISHER(pubcode, pubname, phone, zipcode, address1, address2)
VALUES((SELECT NVL(MAX(pubcode),0)+1 FROM T_PUBLISHER), '�Ҽ� ���ǻ�', '02-1234-1234', '123-123', '����� ���α�', '123 ����');
INSERT INTO T_PUBLISHER(pubcode, pubname, phone, zipcode, address1, address2)
VALUES((SELECT NVL(MAX(pubcode),0)+1 FROM T_PUBLISHER), '����/���輭 ���ǻ�', '02-1234-1234', '123-123', '����� ���α�', '123 ����');
INSERT INTO T_PUBLISHER(pubcode, pubname, phone, zipcode, address1, address2)
VALUES((SELECT NVL(MAX(pubcode),0)+1 FROM T_PUBLISHER), '�ܱ���� ���ǻ�', '02-1234-1234', '123-123', '����� ���α�', '123 ����');
INSERT INTO T_PUBLISHER(pubcode, pubname, phone, zipcode, address1, address2)
VALUES((SELECT NVL(MAX(pubcode),0)+1 FROM T_PUBLISHER), 'IT���� ���ǻ�', '02-1234-1234', '123-123', '����� ���α�', '123 ����');
INSERT INTO T_PUBLISHER(pubcode, pubname, phone, zipcode, address1, address2)
VALUES((SELECT NVL(MAX(pubcode),0)+1 FROM T_PUBLISHER), '��ȭ/���� ���ǻ�', '02-1234-1234', '123-123', '����� ���α�', '123 ����');
INSERT INTO T_PUBLISHER(pubcode, pubname, phone, zipcode, address1, address2)
VALUES((SELECT NVL(MAX(pubcode),0)+1 FROM T_PUBLISHER), '����/�濵 ���ǻ�', '02-1234-1234', '123-123', '����� ���α�', '123 ����');


--T_PUBLISHER ���
SELECT pubcode, pubname, phone, zipcode, address1, address2
FROM T_PUBLISHER
ORDER BY pubcode DESC

--T_PUBLISHER
DELETE FROM T_PUBLISHER 
WHERE pubcode = 1;