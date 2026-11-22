-- Studi kasus: Product & Inventory Analysis

-- Saya bekerja sebagai Junior Data Analyst di perusahaan retail. 
-- Manajer meminta laporan ringkasan produk untuk mengevaluasi kategori, brand, harga, dan persediaan barang.

-- Challenge 1 — Product Overview
-- Tampilkan jumlah seluruh produk dalam tabel.
select * from dim_product;

-- =====================================================================
-- Challenge 2 — Category Performance
-- Tampilkan setiap kategori beserta:
-- - Jumlah produk.
-- - Total stok.
-- - Rata-rata harga jual.
-- - Rata-rata margin.
-- Urutkan berdasarkan total stok terbesar.

select category, 
	count(*) as count_produk, 
	sum(stock_qty) as sum_stock_qty, 
	avg(selling_price) as avg_price,
	avg(margin) as avg_margin
from dim_product
group by category
order by sum_stock_qty;

-- ===================================================================
-- Challenge 3 — Brand Analysis
-- Tampilkan setiap brand beserta:
-- - Jumlah produk.
-- - Rata-rata harga jual.
-- - Margin tertinggi.
-- Hanya tampilkan brand yang memiliki lebih dari 5 produk. Urutkan berdasarkan jumlah produk terbanyak.

select brand,
	count(*) as count_product,
	avg(selling_price) as selling_price,
	max(margin) as max_margin
from dim_product
group by brand
having count(*)>5
order by count_product desc;

-- ======================================================================
-- Challenge 4 — Inventory Analysis
-- Tampilkan kategori yang memiliki total stok kurang dari 1.000 unit.

-- Tampilkan:
-- - Kategori.
-- - Jumlah produk.
-- - Total stok.
-- - Rata-rata stok per produk.
-- Urutkan berdasarkan total stok terkecil.

select category,
	count(*) as count_product,
	sum(stock_qty) as sum_stock,
	avg(stock_qty) as avg_stock
from dim_product
group by category
having sum(stock_qty)<1000
order by sum_stock asc;

-- =========================================================================
-- Challenge 5 — Pricing Analysis
-- Tampilkan kategori yang memiliki rata-rata harga jual lebih dari 100.000.

-- Tampilkan:
-- - Kategori.
-- - Harga jual minimum.
-- - Harga jual maksimum.
-- - Rata-rata harga jual.
-- Urutkan berdasarkan rata-rata harga jual tertinggi.

select category, 
	min(selling_price) as min_selling_price,
	max(selling_price) as max_selling_price,
	avg(selling_price) as avg_selling_price
from dim_product
group by category
having avg(selling_price)>100000
order by avg_selling_price desc;