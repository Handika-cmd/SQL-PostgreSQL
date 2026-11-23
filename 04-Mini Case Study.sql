-- Mini Case Study 06

-- Skenario: Manajer ingin mengetahui produk yang memiliki promo dengan diskon di atas 20.

-- Tampilkan:
-- - product_id
-- - product_name
-- - category
-- - promo_name
-- - discount_value
-- - status

select 
	p.product_id,
	p.product_name,
	p.category,
	pr.promo_name,
	pr.discount_value,
	pr.status
from dim_product as p
inner join dim_promosi as pr
	on p.product_id = pr.product_id
where pr.discount_value >20
order by discount_value desc;

-- ===========================================================================
-- Mini Case Study 07 Analisis promo aktif
-- Skenario bisnis:
-- Manajer ingin melihat seluruh produk yang sedang memiliki promo berstatus Aktif, dengan diskon minimal 15.

-- Tampilkan:
-- - product_name
-- - category
-- - promo_name
-- - discount_value
-- - status

select 
	p.product_name,
	p.category,
	pr.promo_name,
	pr.discount_value,
	pr.status
from dim_product as p
inner join dim_promosi as pr
	on p.product_id = pr.product_id
where pr.status ='Aktif'
	and pr.discount_value >=15
order by pr.discount_value desc, p.product_name asc;

-- ====================================================================
-- Mini Case Study 08 CASE WHEN + JOIN
-- Skenario;
-- Manajer ingin mengelompokkan promo berdasarkan tingkat diskon agar lebih mudah mengevaluasi strategi pemasaran.
-- Buat query yang menampilkan:
-- - product_name
-- - category
-- - promo_name
-- - discount_value
-- - status
-- - Kolom baru bernama kategori_diskon

select 
	p.product_name,
	p.category,
	pr.promo_name,
	pr.discount_value,
	pr.status,
	case
		when pr.discount_value >=30 then 'Diskon Besar'
		when pr.discount_value >=15 then 'Diskon Standar'
		when pr.discount_value >= 1 then 'Diskon Kecil'
		else 'Tanpa Diskon'
	end as kategori_diskon
from dim_product as p
inner join dim_promosi as pr
	on p.product_id = pr.product_id
order by pr.discount_value desc;
	