-- dml.sql

-- 회원
insert into tblUser (id, pw, name, email, lv, pic, profile)
    values ('hong', '1111', '홍길동', 'hong@gmail.com', '1', default, '자바를 공부하는 학생입니다');
   
-- 관리자
insert into tblUser (id, pw, name, email, lv, pic, profile)
    values ('admin', '1111', '관리자', 'admin@gmail.com', '3', default, '프로젝트 관리자입니다. 언제든지 연락주세요~');
  
  
commit;

select * from tblUser;


select * from (select a.*, rownum as rnum from vwBoard a) where rnum between 1 and 10;


select count(*) from tblBoard;


select nvl(max(thread), 0) as thread from tblBoard;

select * from tblBoard;


----------------------------------
-- 특정 회원(hong)이 특정 날짜(2023.05.25)에 
-- 어떤 행동(글/댓글/장소쓰기)을
-- 어떤 시간에 했는지?

select
    level
from dual
    connect by level <= 24;
    
select to_char(regdate, 'hh24') from tblBoard where id = 'minji' and to_char(regdate, 'yyyymmdd') = '20230525';
    
select 
    lv, count(hour) as cnt
from (select level -1 as lv from dual connect by level <= 24) a 
    left outer join 
        (select to_char(regdate, 'hh24') as hour from tblBoard where id = 'min' and to_char(regdate, 'yyyymmdd') = '20230525') b 
            on a.lv = b.hour
                group by lv
                    order by lv asc;

select 
    lv, count(dd) as cnt
from (select level as lv from dual connect by level <= 31) a 
    left outer join 
        (select to_char(regdate, 'dd') as dd from tblBoard 
            where id = 'min' and to_char(regdate, 'yyyymm') = '202305') b 
                on a.lv = b.dd
                    group by lv
                        order by lv asc;



