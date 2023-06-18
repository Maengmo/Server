drop table tblMemo;

create table tblCategory (
    seq number primary key,         --번호(PK)
    name varchar2(50) not null,     -- 카테고리명
    icon varchar2(100) not null,     -- 아이콘
    color varchar2(10) not null      -- 색상
);
create sequence seqCategory;

create table tblMemo (
    seq number primary key,     -- 번호(PK)
    memo varchar2(2000) not null,  -- 메모
    regdate date default sysdate not null, --작성시각
    cseq number not null references tblCategory(seq) -- 카테고리
);
create sequence seqMemo;

insert into tblCategory values (seqCategory.nextVal, '할일', 'receipt_long', 'F97B22');
insert into tblCategory values (seqCategory.nextVal, '장보기', 'shopping_cart', 'FF6969');
insert into tblCategory values (seqCategory.nextVal, '코딩', 'developer_mode', '2A2F4F');

insert into tblMemo values (seqMemo.nextVal, '메모입니다.', default, 1);

commit;

select * from tblMemo;

delete from tblMemo where seq = 6;

select 
    tblMemo.*, 
    (select icon from tblCategory where seq = tblMemo.cseq) as icon, 
    (select color from tblCategory where seq = tblMemo.cseq) as color 
from tblMemo order by seq desc;

commit;

select * from zipcode;
select * from zipcode where dong like '%서울%';

create table ajaxTable
(
    seq number primary key,
    x number not null,
    y number not null,
    ck char(1) not null     --'y', 'n'
);

select * from ajaxTable;

create sequence tableseq;

create table tblJournal (
    seq number primary key,
    line varchar2(1000) null
);

insert into tblJournal values (1, null);
insert into tblJournal values (2, null);
insert into tblJournal values (3, null);
insert into tblJournal values (4, null);
insert into tblJournal values (5, null);
insert into tblJournal values (6, null);
insert into tblJournal values (7, null);
insert into tblJournal values (8, null);
insert into tblJournal values (9, null);
insert into tblJournal values (10, null);
insert into tblJournal values (11, null);
insert into tblJournal values (12, null);
insert into tblJournal values (13, null);
insert into tblJournal values (14, null);
insert into tblJournal values (15, null);

commit;

select * from tblJournal;

create table tblProduct (
    seq number primary key,                 -- 번호(PK)
    name varchar2(100) not null,            -- 상품명
    price number not null,                      -- 가격
    color varchar2(50) not null,                 -- 색상
    pic varchar2(100) default 'pic.png' not null -- 사진
);

create sequence seqProduct;

select * from tblProduct;

select * from tblProduct order by seq desc;

insert into tblProduct 
commit;

select * from tblProduct;

create table tblProductCopy
    as select * from tblProduct;

insert into tblProductCopy select * from tblProductCopy;

--delete from tblProductCopy;

commit;

select * from (select a.*, rownum as rnum from tblProductCopy a)
    where rnum between 11 and 20;
    
    
create table ajaxCat
(
  id varchar2(50) primary key,  --고양이 파일명
  x number not null,
  y number not null
);

insert into ajaxCat values ('cat', 100, 500);

commit;

create table ajaxList
(
  seq number primary key,
  name varchar2(20) not null,
  tel varchar2(20) not null,
  address varchar2(100) not null
);

create sequence listseq;

insert into ajaxList values (listseq.nextVal, '홍길동', '010-1111-2222', '서울시 강남구');
insert into ajaxList values (listseq.nextVal, '아무개', '010-3333-2222', '서울시 동작구');

commit;

select * from ajaxList;