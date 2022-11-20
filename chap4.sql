create table ShohinIns
(
    shohin_id   char(4) not null,
    shohin_mei   varchar(100) not null,
    shohin_bunrui   varchar(32) not null,
    hanbai_tanka   integer default 0,
    shiire_tanka   integer,
    torokubi    date,
    primary key (shohin_id)
);

insert into ShohinIns
(
    shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi
)
values
(
    '0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20'
);

insert into ShohinIns values
(
    '0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20'
),
(
    '0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11'
),
(
    '0003', 'カッターシャツ', '衣服', 4000, 2800, null
),
(
    '0004', '包丁', 'キッチン用品', 3000, 2800, '2009-09-20'
),
(
    '0005', '圧力鍋', 'キッチン用品', 6800, 5000, '2009-01-15'
),
(
    '0006', 'フォーク', 'キッチン用品', 500, null, '2009-09-20'
);

insert into ShohinIns values (
    '0007', 'おろしがね', 'キッチン用品', default, 790, '2009-04-28'
);

select * from ShohinIns where shohin_id = '0007';

insert into ShohinIns (
    shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, torokubi
) values (
    '0008', 'ボールペン', '事務用品', 100, '2009-11-11'
);

select * from ShohinIns where shohin_id = '0008';

create table ShohinCopy
(
    shohin_id   char(4) not null,
    shohin_mei   varchar(100) not null,
    shohin_bunrui   varchar(32) not null,
    hanbai_tanka   integer,
    shiire_tanka   integer,
    torokubi    date,
    primary key (shohin_id)
);

insert into ShohinCopy (
    shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi
)
select
    shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi
from Shohin;

create table ShohinBunrui (
    shohin_bunrui   varchar(32) not null,
    sum_hanbai_tanka    integer,
    sum_shiire_tanka    integer,
    primary key (shohin_bunrui)
);

insert into ShohinBunrui (
    shohin_bunrui, sum_hanbai_tanka, sum_shiire_tanka
)
select shohin_bunrui , sum(hanbai_tanka), sum(shiire_tanka)
from Shohin
group by shohin_bunrui;

delete from Shohin
where hanbai_tanka >= 4000;

update Shohin
set torokubi = '2009-10-10';

update Shohin
set hanbai_tanka = hanbai_tanka * 10
where shohin_bunrui = 'キッチン用品';

update Shohin
set torokubi = null
where shohin_id = '008';

update Shohin
set hanbai_tanka = hanbai_tanka * 10,
    shiire_tanka = shiire_tanka / 2
where shohin_bunrui = 'キッチン用品';

begin transaction;
    update Shohin
    set hanbai_tanka = hanbai_tanka - 1000
    where shohin_mei = 'カッターシャツ';

    update Shohin
    set hanbai_tanka = hanbai_tanka + 1000
    where shohin_mei = 'Tシャツ';
commit;

create table ShohinSaeki (
    shohin_id char(4) not null,
    shohin_mei varchar(100) not null,
    hanbai_tanka integer ,
    shiire_tanka integer ,
    saeki integer ,
    primary key (shohin_id)
);

insert into ShohinSaeki (
    shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, saeki
)
select
    shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka
from Shohin;

insert into ShohinSaeki values (
    '003', 'カッターシャツ', 4000, 2800, 1200
);

update ShohinSaeki
set hanbai_tanka = hanbai_tanka - 1000,
    saeki = hanbai_tanka - shiire_tanka
where shohin_mei = 'カッターシャツ';

update ShohinSaeki
set saeki = hanbai_tanka - shiire_tanka
where shohin_mei = 'カッターシャツ';