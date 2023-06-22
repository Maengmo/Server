
-- 카테고리
create table tblPlaceCategory (
    seq number primary key,
    name varchar2(100) not null,
    marker varchar2(50) not null
);


-- 장소 등록
create table tblPlace (
    seq number primary key,         -- 번호(PK)
    name varchar2(100) not null,    -- 장소
    lat number not null,                -- 위도
    lng number not null,               -- 경도
    cseq number not null references tblPlaceCategory(seq)
);

create sequence seqPlaceCategory;
create sequence seqPlace;

insert into tblPlaceCategory values (seqPlaceCategory.nextVal, '맛집', 'default');
insert into tblPlaceCategory values (seqPlaceCategory.nextVal, '카페', 'default');
insert into tblPlaceCategory values (seqPlaceCategory.nextVal, '운동', 'default');
insert into tblPlaceCategory values (seqPlaceCategory.nextVal, '빵집', 'default');
insert into tblPlaceCategory values (seqPlaceCategory.nextVal, '술집', 'default');

commit;

select * from tblPlace;