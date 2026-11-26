-- Praktik 9 — Analisis kategori diskon berdasarkan kategori produk
-- Skenario bisnis:
-- Manajer pemasaran ingin mengetahui jumlah promo berdasarkan kategori produk dan tingkat diskon.

select
	p.category,
	case
		when pr.discount_value >=30 then 'Diskon Besar'
		when pr.discount_value >=15 then 'Diskon Standar'
		when pr.discount_value >= 1 then 'Diskon Kecil'
		else 'Tanpa Diskon'
	end as kategori_diskon,
	count(*) as jumlah_diskon
from dim_product as p
inner join dim_promosi as pr
	on p.product_id = pr.product_id
group by p.category, kategori_diskon
order by p.category asc, jumlah_diskon desc;
-- ==========================================================
-- Praktik 10 — JOIN + GROUP BY + HAVING

-- Skenario:
-- Manajer ingin mengetahui kategori produk yang memiliki lebih dari 5 promo dengan diskon minimal 15.

select
	p.category,
	count(*) as jumlah_promo
from dim_product as p
inner join dim_promosi as pr
	on p.product_id = pr.product_id
where pr.discount_value >= 15
group by p.category
having count(*) >5
order by jumlah_promo desc;

-- Praktik 10.1
-- Hitung jumlah promo untuk setiap kategori produk, tetapi hanya tampilkan kategori yang memiliki lebih dari 10 promo.
select p.category,
	count(*) as jumlah_promo
from dim_product as p
inner join dim_product as pr
	on p.product_id = pr.product_id
group by p.category
having count(*)>10
order by jumlah_promo desc;

-- Praktik 10.2
-- manajer meminta laporan jumlah promosi per kategori produk dengan ketentuan:
-- 1. Hanya promosi berstatus 'Aktif'.
-- 2. Setiap kategori harus memiliki lebih dari 3 promosi aktif.
-- 3. Urutkan dari jumlah promosi terbanyak.

select
	p.category,
	pr.status,
	count(*) as jumlah_promo
from dim_product as p
inner join dim_promosi as pr
	on p.product_id = pr.product_id
where pr.status ='Akan Datang'
group by p.category
having count(*) > 3
order by jumlah_promo desc;