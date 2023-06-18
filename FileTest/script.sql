-- script.sql

create table tblFile (
    seq number primary key,        --번호(PK)
    name varchar2(30) not null,     -- 작성자
    filename varchar2(50) not null, -- 파일명(하드에 저장되는 이름)
    regdate date default sysdate not null --날짜
);

create sequence seqFile;

-- 첨부 파일 > 데이터베이스 관리 
-- 1. 파일을 직접 DB에 저장 > 바이너리(이진 파일) 저장
-- 2. 파일은 하드에 저장 > DB에는 파일명만 저장

select * from tblFile;