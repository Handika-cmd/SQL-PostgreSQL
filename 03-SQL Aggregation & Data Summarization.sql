-- Materi 2: SUM() dan AVG()

-- 1. SUM() — Menghitung total
-- Misalnya manajer ingin mengetahui total seluruh stok produk.
select sum(stock_qty) as total_stock from dim_product;

-- contoh
-- select category, sum(stock_qty) as total_stock from dim_product group by category;

-- 2. AVG() — Menghitung rata-rata
-- Misalnya manajer ingin mengetahui rata-rata harga jual seluruh produk.
-- contoh
select avg(selling_price) as rata_rata_penjualan from dim_product;

-- Contoh berdasarkan brand:
select brand, avg(selling_price) as rata_rata_penjualan_berdasarkan_brand from dim_product group by brand order by brand desc;

-- =====================================================================
-- =========== Materi 3: MIN() dan MAX() ==================

-- 1. MIN() — Nilai minimum
-- Contoh: mencari harga jual paling murah.
select min(selling_price) as harga_termurah from dim_product;

-- 2. MAX() — Nilai maksimum
-- Contoh: mencari harga jual paling mahal.
select max(selling_price) as harga_termahal from dim_product;

-- 3. MIN() dan MAX() berdasarkan kategori
select category, min(selling_price) as harga_termurah, max(selling_price) as harga_termahal 
from dim_product group by category;

-- =====================================================================
-- =========== Materi 4: HAVING ==================
-- WHERE menyaring baris data sebelum proses pengelompokan.
-- HAVING menyaring kelompok setelah proses agregasi.

-- Perhatikan perbedaan dua kebutuhan bisnis berikut:
-- Kasus A: Tampilkan produk yang harga jualnya lebih dari 500.000.
select * from dim_product where selling_price >500000

-- Kasus B: Tampilkan kategori yang memiliki rata-rata harga jual lebih dari 500.000.
SELECT category, AVG(selling_price) AS avg_selling_price FROM dim_product GROUP BY category HAVING avg(selling_price) > 500000;