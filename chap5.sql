delete from Shohin;

create view ShohinSum (
    shohin_bunrui, cnt_shohin
)
as
select shohin_bunrui, count(*)
from Shohin
group by shohin_bunrui;

select shohin_bunrui, cnt_shohin
from ShohinSum;

create view ShohinSumJim (shohin_bunrui, cnt_shohin)
as
select shohin_bunrui, cnt_shohin
from ShohinSum
where shohin_bunrui = '事務用品';

select shohin_bunrui, cnt_shohin
from ShohinSumJim;

create view ShohinJim (
    shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi
)
as
select *
from Shohin
where shohin_bunrui = '事務用品';

insert into ShohinJim values (
    '009', '印鑑', '事務用品', 95, 10, '2009-11-30'
);

drop view ShohinSum CASCADE;

delete from Shohin where shohin_id = '009';

select shohin_bunrui, cnt_shohin
from (
    select shohin_bunrui, count(*) as cnt_shohin
    from Shohin
    group by shohin_bunrui
) as ShohinSum;

select shohin_id, shohin_mei, hanbai_tanka
from Shohin
where hanbai_tanka > (select avg(hanbai_tanka) from Shohin);