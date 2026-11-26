-- Prkatik Gabungan INNER JOIN, CASE WHEN, GROUP BY
-- Studi Kasus Bisnis:
-- Manajer ingin mengetahui berapa jumlah promo dalam setiap kategori diskon.

-- select
-- 	case
-- 		when discount_value >=30 then'Diskon Besar'
-- 		when discount_value >=15 then 'Diskon Standar'
-- 		when discount_value >= 1 then 'Diskon Kecil'
-- 		else 'Tanpa Diskon'
-- 	end as kategori_diskon,
-- 	count(*) as jumlah_diskon
-- from dim_promosi
-- group by
-- 	case
-- 		when discount_value >=30 then'Diskon Besar'
-- 		when discount_value >=15 then 'Diskon Standar'
-- 		when discount_value >= 1 then 'Diskon Kecil'
-- 		else 'Tanpa Diskon'
-- 	end
-- order by jumlah_diskon desc;

select
	case
		when discount_value >= 30 then 'Diskon Besar'
		when discount_value >= 15 then 'Diskon Standar'
		when discount_value >=1 then 'Diskon Kecil'
		else 'Tanpa Diskon'
	end as kategori_diskon,
	count(*) as jumlah_diskon
from dim_promosi
group by
	case
		when discount_value >= 30 then 'Diskon Besar'
		when discount_value >= 15 then 'Diskon Standar'
		when discount_value >=1 then 'Diskon Kecil'
		else 'Tanpa Diskon'
	end
order by jumlah_diskon desc;