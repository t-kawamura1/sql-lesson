create table Shohin (
    shohin_id char(4) not null,
    shohin_mei varchar(100) not null,
    shohin_bunrui varchar(32) not null,
    hanbai_tanka integer ,
    shiire_tanka integer ,
    torokubi date ,
    primary key (shohin_id)
);

-- DML : データ登録
begin transaction;

insert into Shohin values ('001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20');
insert into Shohin values ('002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11');
insert into Shohin values ('003', 'カッターシャツ', '衣服', 4000, 2800, null);
insert into Shohin values ('004', '包丁', 'キッチン用品', 3000, 2800, '2009-09-20');
insert into Shohin values ('005', '圧力鍋', 'キッチン用品', 6800, 5000, '2009-01-15');
insert into Shohin values ('006', 'フォーク', 'キッチン用品', 500, null, '2009-09-20');
insert into Shohin values ('007', 'おろしがね', 'キッチン用品', 880, 790, '2008-04-28');
insert into Shohin values ('008', 'ボールペン', '事務用品', 100, null, '2009-11-11');

commit;

select shohin_id, shohin_mei, shiire_tanka from Shohin;
select * from Shohin;
select shohin_id as id,
    shohin_mei as names,
    shiire_tanka as tanka
     from Shohin;

select '商品' as mojiretu, 38 as kazu, '2009-02-24' as hizuke, shohin_id, shohin_mei
    from Shohin;

select distinct shohin_bunrui from Shohin;

select distinct shiire_tanka from Shohin;

select distinct shohin_bunrui, torokubi from Shohin;

select distinct shohin_bunrui, shohin_id as id, torokubi from Shohin;

select shohin_mei, shohin_bunrui
from Shohin
where shohin_bunrui = '衣服';

select shohin_mei, hanbai_tanka,
        hanbai_tanka * 2 as "hanbai_tanaka_x2"
    from Shohin;

select shohin_mei, shohin_bunrui
    from Shohin
    where hanbai_tanka = 500;

select shohin_mei, shohin_bunrui
    from Shohin
    where hanbai_tanka <> 500;

select shohin_mei, shohin_bunrui, hanbai_tanka
    from Shohin
    where hanbai_tanka >= 1000;

select shohin_mei, shohin_bunrui, hanbai_tanka
    from Shohin
    where NOT hanbai_tanka >= 1000;

select shohin_mei, shohin_bunrui, torokubi
    from Shohin
    where torokubi < '2009-09-27';

select shohin_mei, hanbai_tanka, shiire_tanka
    from Shohin
    where hanbai_tanka - shiire_tanka >= 500;

select shohin_mei, shiire_tanka
from Shohin
where shiire_tanka = 2800;

select shohin_mei, shiire_tanka
from Shohin
where shiire_tanka <> 2800;

select shohin_mei, shiire_tanka
from Shohin
where shiire_tanka is null;

select shohin_mei, shiire_tanka
from Shohin
where shiire_tanka is not null;

select shohin_mei, shiire_tanka
from Shohin
where shohin_bunrui = 'キッチン用品'
and hanbai_tanka >= 3000;

select shohin_mei, shohin_bunrui, torokubi
from Shohin
where shohin_bunrui = '事務用品'
and (torokubi = '2009-09-11'
    or torokubi = '2009-09-20');

select shohin_mei, torokubi
from Shohin
where torokubi >= '2009-04-28';

select *
from Shohin
where shiire_tanka > null;

select shohin_mei, shohin_bunrui, hanbai_tanka * 0.9 - shiire_tanka as "rieki"
from Shohin
where hanbai_tanka * 0.9 - shiire_tanka > 100
and (shohin_bunrui = '事務用品' or shohin_bunrui = 'キッチン用品');