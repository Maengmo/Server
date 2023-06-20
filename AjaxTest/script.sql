
-- 설문 조사
create table tblResearch (
    seq number primary key,                -- 번호(PK)
    question varchar2(300) not null,        -- 질문
    item1 varchar2(300) not null,           -- 항목1
    item2 varchar2(300) not null,           -- 항목2
    item3 varchar2(300) not null,           -- 항목3
    item4 varchar2(300) not null,           -- 항목4
    cnt1 number default 0 not null,        -- 답변 1
    cnt2 number default 0 not null,        -- 답변 2
    cnt3 number default 0 not null,        -- 답변 3
    cnt4 number default 0 not null         -- 답변 4
);

insert into tblResearch values(1, '가장 자신있는 프로그래밍 언어는?' , 'JAVA', 'C#', 'Python', 'Dart', default, default, default, default);

select * from tblResearch;

update tblResearch set
        cnt1 = 7,
        cnt2 = 8,
        cnt3 = 5,
        cnt4 = 12
            where seq = 1;

commit;

select 







