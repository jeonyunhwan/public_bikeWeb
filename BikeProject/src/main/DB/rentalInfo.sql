create sequence rental_seq
    increment by 1
    start with 0
    minvalue 0
    maxvalue 99999
    nocycle;


create table rentalInfo(
    rentalNo number primary key,
    memberdiv varchar2(30),
    nonMemberName varchar2(30),
    nonMemberPhoneNum varchar2(30),
    bikeNo varchar2(20) CONSTRAINT rentalInfo_bikeNo_FK REFERENCES bike(bikeNo),
    id varchar2(30) constraint rentalInfo_id_FK REFERENCES USER1(id),
    startPlaceName varchar2(500) constraint rentalInfo_startPlaceName_Fk references rentaloffice(placename),
    rentalTime date,
    endPlaceName varchar2(500) constraint rentalInfo_endPlaceName_Fk references rentaloffice(placename),
    returnTime date,
    useDistance number,
    unpaidCharge number,
    payNo varchar2(20) constraint rentalInfo_payNo_fk references pay(payno)
);
