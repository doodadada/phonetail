SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS report;




/* Create Tables */

CREATE TABLE report
(
	reseq int NOT NULL AUTO_INCREMENT,
	pseq int NOT NULL,
	reporterid varchar(45) NOT NULL,
	tartgetid varchar(45) NOT NULL,
	-- 0 - 광고성 콘텐츠(거래와 관련없는 글)
	-- 1 - 상품정보 부정확
	-- 2 - 안전거래를 거부해요
	-- 3 - 사기가 의심돼요(외부 채널 유도)
	-- 4 - 전문업자 같아요
	retype int NOT NULL
	--0 - 광고성 콘텐츠(거래와 관련없는 글)
	--1 - 상품정보 부정확
	--2 - 안전거래를 거부해요
	--3 - 사기가 의심돼요(외부 채널 유도)
	--4 - 전문업자 같아요',
	-- 신고내용 구체적으로
	recontent varchar(200) NOT NULL COMMENT '신고내용 구체적으로',
	-- 0 - 대기상태
	-- 1 - 처리
	-- 2 - 처리완료
	reportstate int NOT NULL
	-- 0 - 대기상태
	-- 1 - 처리
	-- 2 - 처리완료,
	PRIMARY KEY (reseq)
);

create table admins
(
	adminid varchar(30) not null,
	pwd varchar(30) not null,
	name varchar(30) not null,
	phone varchar(30) not null,
	primary key (adminid)
);


