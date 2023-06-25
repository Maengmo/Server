-- ddl.sql
drop table tblUser;
-- 회원
create table tblUser (
    id varchar2(50) primary key,
    pw varchar2(50) not null,
    name varchar2(50) not null,
    email varchar2(100) not null,
    lv char(1) not null,
    pic varchar2(100) default 'pic.png' not null,
    profile varchar2(500) not null,
    ing char(1) default 'y' not null --탈퇴(n)
);

ALTER table tblUser 
    ADD (ing char(1) default 'y' not null);

select * from tblUser;

-- 게시판
drop table tblBoard;
create table tblBoard (
    seq number primary key,             -- 번호(PK)
    subject varchar2(300) not null,      -- 제목
    content varchar2(4000) not null,    -- 내용
    id varchar2(30) not null references tblUser(id), --아이디(FK)
    regdate date default sysdate not null,  -- 작성시각
    readcount number default 0 not null     -- 읽음
);

create sequence seqBoard;

select * from tblBoard;

create or replace view vwBoard
as
select 
    seq, subject, id, readcount,
    (select name from tblUser where id = tblBoard.id) as name,
    (sysdate - regdate) as isnew,
    
    case 
        when to_char(sysdate, 'yyyy-mm-dd') = to_char(regdate, 'yyyy-mm-dd')
            then to_char(regdate, 'hh24:mi:ss')
        else
            to_char(regdate, 'yyyy-mm-dd')
    end as regdate,
    (select count(*) from tblComment where bseq = tblBoard.seq) as ccnt,
    content,
    depth
    
from tblBoard order by thread desc;

-- 
select * from vwBoard;


commit;

-- 댓글
create table tblComment (
    seq number primary key,                                 -- 번호(PK)
    content varchar2(2000) not null,                        -- 댓글내용
    id varchar2(50) not null references tblUser(id),        -- 아이디(FK)
    regdate date default sysdate not null,                  -- 날짜
    bseq number not null references tblBoard(seq)       -- 부모글(FK)
);

create sequence seqComment;

drop table tblComment;
drop table tblBoard;

----------------------계층형 게시판---------------------------------

-- 게시판
create table tblBoard (
    seq number primary key,             -- 번호(PK)
    subject varchar2(300) not null,      -- 제목
    content varchar2(4000) not null,    -- 내용
    id varchar2(30) not null references tblUser(id), --아이디(FK)
    regdate date default sysdate not null,  -- 작성시각
    readcount number default 0 not null,     -- 읽음
    thread number not null,               -- 답변형(정렬)
    depth number not null                 -- 답변형(출력)
);


create table tblComment (
    seq number primary key,                                 -- 번호(PK)
    content varchar2(2000) not null,                        -- 댓글내용
    id varchar2(50) not null references tblUser(id),        -- 아이디(FK)
    regdate date default sysdate not null,                  -- 날짜
    bseq number not null references tblBoard(seq)       -- 부모글(FK)
);

create sequence seqComment;

--------------------------------- Place -----------------------------------------------
drop table tblPlace;

create table tblPlace (
    seq number primary key,
    name varchar2(100) not null,
    content varchar2(1000) not null,
    pic varchar2(100) not null,
    regdate date default sysdate not null,
    id varchar2(50) not null references tblUser(id)
);

drop sequence seqPlace;

create sequence seqPlace;

select * from tblPlace;

create table tblHashTag (
    seq number primary key,
    tag varchar2(100) not null
);

create sequence seqHashTag;

create table tblPlaceHashTag (
    seq number primary key,
    pseq number not null references tblPlace(seq),
    hseq number not null references tblHashTag(seq)
);

create sequence seqPlaceHashTag;
--------------------------------------------------------------------
select * from tblPlace;
select * from tblHashTag;
select * from tblPlaceHashTag;

select tblPlace.*, 
    (select name from tblUser where id = tblPlace.id) as uname 
from tblPlace 
    where seq in (select seq from tblPlaceHashTag
    where hseq = (select seq from tblHashTag where tag = '돼지' and rownum = 1)) 
    order by seq desc;
    
select seq from tblPlaceHashTag
    where hseq = (select seq from tblHashTag where tag = '돼지' and rownum = 1);


