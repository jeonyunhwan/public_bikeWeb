CREATE TABLE notice(
	noticeno varchar2(20) PRIMARY KEY,
	mgrid varchar2(30) CONSTRAINT notice_mgrid_fk REFERENCES user1(id),
	writedate DATE,
	title varchar2(300) NOT NULL,
	content varchar2(4000) NOT NULL,
	imgfile varchar2(4000)
);
DROP TABLE notice;

CREATE SEQUENCE notice_seq
		INCREMENT BY 1
		START WITH 1
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE notice_seq;

INSERT INTO notice values('notice'||notice_seq.nextval,'admin01',sysdate,'[안내]공지사항입니다','부릉이 선물하기 기능을 임시 중단하오니 양해 부탁드리겠습니다.',NULL);
INSERT INTO notice values('notice'||notice_seq.nextval,'admin01',sysdate,'[안내]공지사항입니다','코로나 확상 방지를 위하여 부릉이는 매시간 자전거 소독을 하고 있습니다.',NULL);
INSERT INTO notice values('notice'||notice_seq.nextval,'admin01',sysdate,'[안내]공지사항입니다','대여소 추가 문의는 QNA 글 작성해주시면 도와드리겠습니다.',NULL);
UPDATE notice SET title='', content='', imgfile='' WHERE noticeno='';
DELETE FROM notice WHERE noticeno='';

SELECT*FROM notice;