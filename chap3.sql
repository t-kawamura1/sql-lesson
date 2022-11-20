select count(*)
from Shohin;

select count(shiire_tanka)
from Shohin;

select SUM(hanbai_tanka) as sum1, sum(shiire_tanka) as sum2
from Shohin;

select avg(hanbai_tanka)
from Shohin;

select count(distinct shohin_bunrui)
from Shohin;

select shiire_tanka, count(*)
from Shohin
group by shiire_tanka;

select shiire_tanka, count(*)
from Shohin
where shohin_bunrui = '衣服'
group by shiire_tanka;

select shohin_bunrui, count(*)
from Shohin
group by shohin_bunrui
having count(*) = 2;

select shohin_bunrui, avg(hanbai_tanka)
from Shohin
group by shohin_bunrui
having avg(hanbai_tanka) >= 2500;

select shohin_id as id, shohin_mei, hanbai_tanka as ht, shiire_tanka
from Shohin
order by ht, id;

select shohin_bunrui, sum(hanbai_tanka), sum(shiire_tanka)
from Shohin
group by shohin_bunrui
having sum(hanbai_tanka) > sum(shiire_tanka) * 1.5;

select *
from Shohin
order by torokubi desc, hanbai_tanka;