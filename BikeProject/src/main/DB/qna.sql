CREATE TABLE qna(
	qno varchar2(20) PRIMARY KEY,
	writedate DATE,
	id varchar2(30) CONSTRAINT qna_id_fk REFERENCES user1(id),
	title varchar2(300) NOT NULL,
	content varchar2(4000) NOT NULL,
	imgfile varchar2(4000),
	mgrid varchar2(30) CONSTRAINT qna_mgrid_fk REFERENCES user1(id),
	answer varchar2(4000)
);
DROP TABLE qna;

CREATE SEQUENCE qna_seq
		INCREMENT BY 1
		START WITH 1
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE qna_seq;

INSERT INTO qna values('qna'||qna_seq.nextval,sysdate,'','','',NULL,NULL,NULL);
UPDATE qna SET title='', content='', imgfile='' WHERE qno='';
DELETE FROM qna WHERE qno='';

SELECT*FROM qna;