select * from t_user;
--아이디 패스워드 체크
SELECT COUNT(*) FROM T_USER
WHERE userid='jimmy' AND passwd='1234'


--회원등급 정보 불러오기
SELECT grade FROM T_USER
WHERE userid='admin'

--회원정보보기(user)
SELECT * FROM T_USER 
where userid='user1';

--회원정보보기(admin)
SELECT userid, name, passwd, phone , email, birthdate, callphone, zipcode, 
grade, address1, address2, joindate, userphoto
FROM T_USER 
ORDER BY userid ASC; 

--중복id 검사
SELECT COUNT(userid)  as cnt
FROM T_USER  
WHERE userid='user1'; 
--이메일 중복확인
SELECT COUNT(EMAIL)  as cnt
FROM T_USER  
WHERE email='email2@mail.com'; 
--우편번호검색
   SELECT zipcode, sido, gugun, dongli, etc 
   FROM t_zipcode 
   WHERE (dongli LIKE '%개포%') 
   ORDER BY sido, gugun, dongli; 

--회원이미지수정
UPDATE T_USER
SET userphoto='member2.jpg'
where userid='user2'


--패스워드변경
UPDATE T_USER
SET userphoto='member2.jpg'
where userid='user2'

--회원정보수정
UPDATE T_USER  
SET name='이길동', passwd='1234', phone='02-1234-1234' , email='email2@mail.com', birthdate='2000-12-30',
    callphone='010-1234-1234', zipcode='11111',grade='M', address1='서울 강남구 개포1동', address2='565번지', 
    joindate='12/03/07', userphoto='member.jpg'
WHERE userid = 'user4'; 
--삭제
DELETE FROM T_USER WHERE userid='user13'; 

--로그인관련
SELECT COUNT(USERID)AS CNT
FROM T_USER
WHERE USERID='user5' AND PASSWD='1234'

--Admin계정생성
INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('admin', '관리자', '1234', '02-1234-1234','admin@mail.com',
'2016-03-01','010-000-0000','135-805','A','서울 강남구 개포1동','565번지',sysdate,'adminphoto.jpg'); --grade A로 지정
--회원계정생성
INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user1', '홍길동', '1234', '02-1234-1234','email1@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user2', '김길동', '1234', '02-1234-1234','email2@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user3', '이길동', '1234', '02-1234-1234','email3@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user4', '박길동', '1234', '02-1234-1234','email4@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user5', '조길동', '1234', '02-1234-1234','email5@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user6', '염길동', '1234', '02-1234-1234','email6@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user7', '이길동', '1234', '02-1234-1234','email7@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user8', '황길동', '1234', '02-1234-1234','email8@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user9', '한길동', '1234', '02-1234-1234','email9@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user10', '성길동', '1234', '02-1234-1234','email10@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user11', '가길동', '1234', '02-1234-1234','email11@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user12', '남길동', '1234', '02-1234-1234','email12@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user13', '노길동', '1234', '02-1234-1234','email13@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user14', '도길동', '1234', '02-1234-1234','email14@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user15', '마길동', '1234', '02-1234-1234','email15@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user16', '백길동', '1234', '02-1234-1234','email16@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 

INSERT INTO T_USER(userid, name, passwd,phone,email,birthdate,callphone,zipcode,grade,
address1,address2, joindate, userphoto) 
VALUES('user17', '소길동', '1234', '02-1234-1234','email17@mail.com',
'2000-12-30','010-1234-1234','135-805','M','서울 강남구 개포1동','565번지',sysdate,'member.jpg'); 
