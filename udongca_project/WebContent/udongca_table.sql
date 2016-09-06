--create user id:udongca/pwd:master sqlplus sysdba --
create user udongca identified by master; --유저 생성
grant all privileges to udongca; --모든 권한 주기


-- drop table --
drop table bookmark;
drop table review_reply;
drop table preferLocation;
drop table menu;
drop table report_board;
drop table review_board;
drop table code;
drop table notice_board;
drop table onetoone_inquiry;
drop table PRboard;
drop table member;

-- drop sequence--
drop sequence notice_board_noticeNo_seq ;
drop sequence onetoone_inquiry_inquiryNo_seq ;
drop sequence PRboard_cafeNo_seq;
drop sequence review_board_reviewNo_seq ;
drop sequence report_board_reportboardNo_seq ;
drop sequence menu_menuNo_seq ;
drop sequence review_reply_replyNo_seq ;
drop sequence preferLocationNo_seq;

-- category drop --
drop table middlecategory;
drop table majorcategory;


	

-- create sequence --
create sequence notice_board_noticeNo_seq nocache;
create sequence onetoone_inquiry_inquiryNo_seq nocache;
create sequence PRboard_cafeNo_seq nocache;
create sequence review_board_reviewNo_seq nocache;
create sequence report_board_reportboardNo_seq nocache;
create sequence menu_menuNo_seq nocache;
create sequence review_reply_replyNo_seq nocache;
create sequence preferLocationNo_seq nocache;

--  create table --

create table code(
codeId	varchar2(30)	primary key,
codeName	varchar2(50)	NOT NULL,
codeType	varchar2(50)	NOT NULL
);

insert into code values('notice1', '홍보글', 'notice_type');
insert into code values('notice2', '리뷰', 'notice_type');
insert into code values('notice3', '신고', 'notice_type');
insert into code values('notice4', '댓글', 'notice_type');
insert into code values('notice5', '사업자회원', 'notice_type');
insert into code values('notice6', '일반회원', 'notice_type');
insert into code values('notice7', '공지', 'notice_type');
insert into code values('inquiry1', '홍보글', 'inquiry_type');
insert into code values('inquiry2', '리뷰', 'inquiry_type');
insert into code values('inquiry3', '신고', 'inquiry_type');
insert into code values('inquiry4', '댓글', 'inquiry_type');
insert into code values('inquiry5', '사업자회원', 'inquiry_type');
insert into code values('inquiry6', '일반회원', 'inquiry_type');
insert into code values('cafeTheme1', '디저트', 'cafe_theme');
insert into code values('cafeTheme2', '북', 'cafe_theme');
insert into code values('cafeTheme3', '강아지', 'cafe_theme');
insert into code values('cafeTheme4', '고양이', 'cafe_theme');
insert into code values('cafeTheme5', '키즈', 'cafe_theme');
insert into code values('cafeTheme6', '기타', 'cafe_theme');
insert into code values('cafeMenu1', 'Coffee', 'cafe_menu');
insert into code values('cafeMenu2', 'Beverage', 'cafe_menu');
insert into code values('cafeMenu3', 'Frappuccino', 'cafe_menu');
insert into code values('cafeMenu4', 'Dessert', 'cafe_menu');
insert into code values('cafeMenu5', 'Bakery', 'cafe_menu');
insert into code values('cafeMenu6', 'etc.', 'cafe_menu');
insert into code values('possible','로그인허용','login_possibility');
insert into code values('impossible','로그인불가','login_possibility');
insert into code values('all','all','reportBoard');
insert into code values('review','review','reportBoard');
insert into code values('prboard','prboard','reportBoard');



create table notice_board(
noticeNo	NUMBER	primary key,
noticeTitle	varchar2(150)	NOT NULL,
noticeContent	CLOB	NOT NULL,
category varchar2(50) NOT NULL,
noticeDate	DATE	NOT NULL
);

insert into notice_board values(notice_board_noticeNo_seq.nextval,'반갑습니다. 우동카에 오신걸 환영합니다.','우동카에 오신걸 환영합니다.','notice7',sysdate);
insert into notice_board values(notice_board_noticeNo_seq.nextval,'홈페이지 이용안내','회원가입은 가입신청후 이메일 인증을 통해 가능합니다. 회원가입후 모든 메뉴는 무료 이용 가능합니다.','notice7',sysdate);



create table member(
memberId	varchar2(50)	primary key,
memberName	varchar2(50)	NOT NULL,
memberPassword	varchar2(50)	NOT NULL,
memberEmail	varchar2(100) not null,
memberPenalty	NUMBER	,
loginpossibility	varchar2(50)	NOT NULL,
memberType	varchar2(50)	NOT NULL
);

insert into member values('udongca','udongca','master','master@udongca.com','0','possible','master'); --관리자
insert into member values('scott','scott','tiger','osung212@naver.com','0','possible','generalMember'); -- 일반회원
insert into member values('marketer','marketer','maketer','osung212@naver.com','0','possible','licenseeMember'); -- 사업자회원



create table onetoone_inquiry(
inquiryNo	NUMBER	primary key,
inquiryTitle	varchar2(150)	NOT NULL,
inquiryType	varchar2(50)	NOT NULL,
inquiryContent	CLOB	NOT NULL,
inquiryReply	CLOB,	
memberId	varchar2(50)	NOT NULL,
constraint onetoone_memberId_fk
foreign key (memberId)
references member(memberId) on delete cascade
);


insert into onetoone_inquiry values(onetoone_inquiry_inquiryNo_seq.nextval,'1:1 문의 테스트 입니다.','문의 타입','문의 내용입니다.','','scott');
insert into onetoone_inquiry values(onetoone_inquiry_inquiryNo_seq.nextval,'1:1 문의 테스트 입니다.','문의 타입','문의 내용입니다.','답변 테스트입니다.','scott');


create table PRboard(
cafeNo	NUMBER	primary key,
cafeName	varchar2(50)	NOT NULL,
cafeIntro	CLOB	NOT NULL,
cafeTel	varchar2(50)	NOT NULL,
cafeFeature	varchar2(50),
cafeAddress	varchar2(150)	NOT NULL,
coporateNumber	varchar2(50)	NOT NULL,
operationHour	varchar2(50)	NOT NULL,
managerName	varchar2(50)	NOT NULL,
managerTel	varchar2(50)	NOT NULL,
cafeRating number null,
cafeRealImage	CLOB	NULL,
cafeFakeImage	CLOB	NULL,
cafeReviewCount number,
RegistrationDate date not null,
memberId	varchar2(50)	NOT NULL,
constraint prboard_memberId_fk
foreign key (memberId)
references member(memberId) on delete cascade
);

insert into PRboard values(PRboard_cafeNo_seq.nextval,'홍보글 테스트','홍보글 테스트 입니다.','010-0000-0000','wifi','경기도 성남시 분당구 삼평동 682 유스페이스2 B동','0000000000','24시간','marketer','010-0000-0000',0,'java.png','1468208081880java.png',0,sysdate,'marketer');


create table review_board(
reviewNo 	NUMBER	primary key,
reviewTitle	varchar2(50)	NOT NULL,
reviewDate	DATE	NOT NULL,
reviewContent	CLOB	NOT NULL,
reviewRealImage CLOB,
reviewfakeImage CLOB,
ratingStars number,
memberId	varchar2(50)	NOT NULL,
cafeNo	NUMBER	NOT NULL,
constraint review_board_memberId_fk
foreign key (memberId)
references member(memberId) on delete cascade,
constraint review_cafeNo_fk
foreign key (cafeNo)
references PRboard(cafeNo) on delete cascade
);

insert into review_board values(review_board_reviewNo_seq.nextval,'리뷰 테스트입니다.',sysdate,'리뷰 테스트입니다.','','',3,'scott',1);


create table report_board(
reportboardNo	NUMBER	primary key,
reportMemberId	varchar2(50)	NOT NULL,
reportReason	varchar2(100)	NOT NULL,
reportContent	CLOB	NULL,
reportResult	CLOB	NULL,
reportCancelReason	CLOB	NULL,
reportType	VARCHAR2(50)	NOT NULL,
reportNO 	NUMBER	NOT NULL,
memberId	varchar2(50)	NOT NULL,
constraint report_memberId_fk
foreign key (memberId)
references member(memberId) on delete cascade
);

insert into REPORT_BOARD values(report_board_reportboardNo_seq.nextval,'marketer','테스트','신고 테스트.','','','prboard',1,'scott');


create table menu(
menuNo	NUMBER	primary key,
cafeNo	NUMBER	NOT NULL,
menuType	varchar2(50)	NOT NULL,
menuName	varchar2(50)	NOT NULL,
menuRealImage	 CLOB	NULL,
menuFakeImage	CLOB	NULL,
constraint menu_cafeNo_fk
foreign key (cafeNo)
references PRboard(cafeNo) on delete cascade
);

insert into menu values(menu_menuNo_seq.nextval,1,'coffee','아메리카노','/udongca_project/udongca-image/book-stack.png','fake');
insert into menu values(menu_menuNo_seq.nextval,1,'coffee','아메리카노','/udongca_project/udongca-image/book-stack.png','fake');
insert into menu values(menu_menuNo_seq.nextval,1,'coffee','아메리카노','/udongca_project/udongca-image/book-stack.png','fake');
insert into menu values(menu_menuNo_seq.nextval,1,'coffee','아메리카노','/udongca_project/udongca-image/book-stack.png','fake');	


create table preferLocation(
preferLocationNo	NUMBER	primary key,
address1	number default 0,
address2	number default 0,
address3	number default 0,
memberId	varchar2(50)	NOT NULL,
constraint preferLocation_memberId_fk
foreign key (memberId)
references member(memberId) on delete cascade
);


create table review_reply(
replyNo	NUMBER	primary key,
replyId	varchar2(50)	NOT NULL,
replyContent	CLOB	NOT NULL,
replyDate	DATE	NOT NULL,
replyGroup NUMBER not null,
parentReply	NUMBER	NULL,
targetName	varchar2(50)	NULL,
reviewNO	NUMBER not null,
constraint review_reply_reviewNo_fk
foreign key (reviewNo)
references review_board(reviewNo) on delete cascade
);


create table bookmark(
memberId	varchar2(50) not null,
cafeNo	NUMBER,
constraint bookmark_fk_memberId
foreign key (memberId)
references member(memberId) on delete set null,
constraint bookmark_fk_PRboard
foreign key (cafeNo)
references prboard(cafeNo) on delete set null
);

insert into bookmark values('scott',1);


-- address table --
create table majorcategory(
major_CategoryNo number primary key,
address1 varchar(40)
);

create table middlecategory(
middle_CategoryNo number primary key,
address2 varchar(40),
major_CategoryNo number,
constraint middle_No_fk_majorNo
foreign key (major_CategoryNo)
references majorcategory(major_CategoryNo)
);
