-- Praktik 1
-- Skenario bisnis
-- Manajer retail ingin mengetahui daftar produk beserta informasi promonya. Data produk dan data promo tersimpan di dua tabel berbeda.

-- Tugas kamu:
-- Buat query SQL untuk menampilkan:
-- 1. product_id dari tabel produk.
-- 2. product_name dari tabel produk.
-- 3. category dari tabel produk.
-- 4. promo_name dari tabel promosi.
-- 5. discount_value dari tabel promosi.

select p.product_id,
	p.product_name,
	p.category,
	pr.promo_name,
	pr.discount_value
from dim_product as p
inner join dim_promosi as pr
	on p.product_id = pr.product_id;
-- ============================================================
-- Praktik 2
-- Praktik 2 — LEFT JOIN

-- Skenario bisnis:
-- Manajer ingin mengetahui seluruh produk, termasuk produk yang belum mempunyai promo.
-- Buat query untuk menampilkan:
-- 1. product_id
-- 2. product_name
-- 3. promo_name
-- 4. status
-- Ketentuan:
-- - Gunakan LEFT JOIN.
-- - Gunakan alias p dan pr.
-- - Urutkan berdasarkan product_id secara ASC.

select p.product_id,
	p.product_name,
	pr.promo_name,
	pr.status
from dim_product as p
left join dim_promosi as pr
	on p.product_id = pr.product_id
order by p.product_id asc;

-- =============================================================================
-- Praktik 3
-- Skenario:
-- Manajer ingin mengetahui produk mana saja yang belum pernah mendapatkan promo
select p.product_id,
	p.product_name,
	p.category
from dim_product as p
left join dim_promosi as pr
	on p.product_id = pr.product_id
where pr.product_id is null
order by p.product_id asc;

-- ===============================================================================
-- Praaktik 4
-- Skenario:
-- Manajer ingin mengetahui kategori produk mana yang memiliki jumlah promo terbanyak.
select p.category,
	count(*) as jumlah_promo
from dim_product as p
inner join dim_promosi as pr
	on p.product_id = pr.product_id
group by p.category
order by jumlah_promo desc;

-- ==================================================================================
-- Praktik 5-Analisis promo berdasarkan kategori dan status
-- Skenario:
-- Manajer ingin mengetahui jumlah promo berdasarkan kategori produk dan status promo.

select
	p.category,
	pr.status,
	count(*) as jumlah_promo
from dim_product as p  
inner join dim_promosi as pr
	on p.product_id = pr.product_id
group by p.category, pr.status
order by p.category desc, pr.status asc, jumlah_promo desc;