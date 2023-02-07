CREATE TABLE guideline(
	guideno varchar(20) PRIMARY KEY,
	imgfile varchar(500)
);
DROP TABLE guideline;

SELECT * FROM guideline;

CREATE SEQUENCE guide_seq
		increment by 1
		start with 1
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE guide_seq;

INSERT INTO guideline values('g'||guide_seq.nextval,'guide01');
INSERT INTO guideline values('g'||guide_seq.nextval,'guide02');
INSERT INTO guideline values('g'||guide_seq.nextval,'guide03');
INSERT INTO guideline values('g'||guide_seq.nextval,'guide04');
INSERT INTO guideline values('g'||guide_seq.nextval,'guide05');
INSERT INTO guideline values('g'||guide_seq.nextval,'guide06');
INSERT INTO guideline values('g'||guide_seq.nextval,'guide07');