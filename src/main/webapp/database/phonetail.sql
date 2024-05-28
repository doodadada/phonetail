--scott 상태로 아래한줄 실행
CREATE SCHEMA `phonetail` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

--이후 phonetail로 스키마 바꾸고 아래 코드 쭉 실행
SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS chat;
DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE address
(
	zip_num varchar(15),
	sido varchar(30),
	gugun varchar(30),
	dong varchar(30),
	bunji varchar(20),
	zip_code varchar(30)
);


CREATE TABLE admin
(
	adminid varchar(45) NOT NULL,
	pwd varchar(45),
	name varchar(45),
	phone varchar(45),
	PRIMARY KEY (adminid)
);


CREATE TABLE chat
(
	cseq int NOT NULL AUTO_INCREMENT,
	content varchar(300) NOT NULL,
	indate datetime DEFAULT now() NOT NULL,
	userid varchar(45) NOT NULL,
	pseq int NOT NULL,
	PRIMARY KEY (cseq)
);


CREATE TABLE member
(
	userid varchar(45) NOT NULL,
	pwd varchar(45) NOT NULL,
	name varchar(45) NOT NULL,
	phone varchar(45) NOT NULL,
	email varchar(100) NOT NULL,
	zip_num varchar(45) NOT NULL,
	address1 varchar(100) NOT NULL,
	address2 varchar(100) NOT NULL,
	zip_code varchar(45) NOT NULL,
	usestate char(1) DEFAULT '''Y''' NOT NULL,
	indate datetime DEFAULT now() NOT NULL,
	PRIMARY KEY (userid)
);


CREATE TABLE product
(
	pseq int NOT NULL AUTO_INCREMENT,
	-- company > brand로 수정
	brand varchar(45) NOT NULL COMMENT 'company > brand로 수정',
	-- 카테고리 필터 용
	series varchar(45) NOT NULL COMMENT '카테고리 필터 용',
	-- 카테고리 필터 용
	model varchar(45) NOT NULL COMMENT '카테고리 필터 용',
	price int NOT NULL,
	comment varchar(1000),
	image varchar(200),
	-- no image가 있을수 있어서
	saveimagefile varchar(200) COMMENT 'no image가 있을수 있어서',
	-- YorN
	sellstate char(1) DEFAULT '''N''' COMMENT 'YorN',
	indate datetime DEFAULT now() NOT NULL,
	userid varchar(45) NOT NULL,
	PRIMARY KEY (pseq)
);


CREATE TABLE question
(
	qseq int NOT NULL AUTO_INCREMENT,
	title varchar(100) NOT NULL,
	content varchar(1000) NOT NULL,
	indate datetime DEFAULT now() NOT NULL,
	userid varchar(45) NOT NULL,
	qreply varchar(1000),
	PRIMARY KEY (qseq)
);


CREATE TABLE report
(
	reseq int NOT NULL AUTO_INCREMENT,
	pseq int NOT NULL,
	userid varchar(45) NOT NULL,
	-- --0 - 광고성 콘텐츠(거래와 관련없는 글)
	--    --1 - 상품정보 부정확
	--    --2 - 안전거래를 거부해요
	--    --3 - 사기가 의심돼요(외부 채널 유도)
	--    --4 - 전문업자 같아요',
	retype int NOT NULL COMMENT '--0 - 광고성 콘텐츠(거래와 관련없는 글)
   --1 - 상품정보 부정확
   --2 - 안전거래를 거부해요
   --3 - 사기가 의심돼요(외부 채널 유도)
   --4 - 전문업자 같아요'',',
	recontent varchar(300) NOT NULL,
	-- N:대기상태
	-- Y:처리완료
	restate char(1) DEFAULT '''N''' NOT NULL COMMENT 'N:대기상태
Y:처리완료',
	PRIMARY KEY (reseq)
);



/* Create Foreign Keys */

ALTER TABLE chat
	ADD FOREIGN KEY (userid)
	REFERENCES member (userid)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE product
	ADD FOREIGN KEY (userid)
	REFERENCES member (userid)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE question
	ADD FOREIGN KEY (userid)
	REFERENCES member (userid)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE report
	ADD FOREIGN KEY (userid)
	REFERENCES member (userid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE chat
	ADD FOREIGN KEY (pseq)
	REFERENCES product (pseq)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE report
	ADD FOREIGN KEY (pseq)
	REFERENCES product (pseq)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



