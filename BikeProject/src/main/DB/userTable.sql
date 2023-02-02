CREATE TABLE user1(
	id varchar2(30) PRIMARY key,
	pass varchar2(30) NOT NULL,
	rentpass char(4),
	auth varchar2(20) NOT null,
	name varchar2(20) NOT NULL,
	phonenumber varchar2(20) NOT NULL,
	email varchar2(100) NOT NULL,
	weight NUMBER NOT NULL,
	totaldistance NUMBER,
	getcardno varchar2(20),
	foreign KEY(getcardno) REFERENCES getcard(getcardno) ON DELETE cascade
);
DROP TABLE user1;

SELECT * FROM USER1;

INSERT INTO user1 values('dnjswn1','dnjswn123!','','일반회원','홍설','0102353776','dnjswn@gmail.com',65,'','');
INSERT INTO user1 values('dnjswn123','dnjswn123!','','일반회원','홍길동','01023321476','d25swn@naver.com',88,'','');

SELECT COUNT(*) FROM user1 WHERE id='dnjsw'; 
delete from user1 where id='dnjswn1';


ALTER TABLE user1
ADD CONSTRAINT fk_user1
FOREIGN KEY (getcardno)
REFERENCES getcard(getcardno) on delete cascade;
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME ='user1';
