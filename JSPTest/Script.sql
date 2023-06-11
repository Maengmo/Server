-- JSPTest > "script.sql"

select * from tblAddress;

drop table tblAddress;
drop sequence seqAddress;

create table tblAddress (
    seq number primary key,     -- 번호(PK)
    name varchar2(30) not null,  -- 이름
    age number(3) not null,       -- 나이
    tel varchar2(15) not null,      -- 연락처
    address varchar2(300) not null -- 주소
);

create sequence seqAddress;

select * from tblAddress;

select * from tblUser;

drop table tblUser cascade constraints;

create table tblUser (
    id varchar2(30) primary key,        -- 아이디(PK)
    pw varchar2(30) not null,           -- 암호
    name varchar2(30) not null,        -- 이름
    lv number(1) not null                -- 등급(1-일반, 2-관리자)
);

-- 일반 회원
insert into tblUser values ('hong', '1111', '이민지', 1);
insert into tblUser values ('test', '1111', '이동재', 1);

-- 관리자 회원
insert into tblUser values ('admin', '1111', '김대환', 2);

commit;








