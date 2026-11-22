-- Praktik mandiri – SUM() dan AVG()
-- Coba kerjakan empat soal berikut menggunakan dim_product.
-- 1. Hitung total seluruh stok produk.
-- 2. Hitung total stok berdasarkan masing-masing kategori.
-- 3. Hitung rata-rata selling price berdasarkan masing-masing brand.
-- 4. Tampilkan kategori dan rata-rata margin, urutkan dari rata-rata margin tertinggi.

-- Praktik 1
select sum(stock_qty) as total_stock_produk from dim_product;

-- Praktik 2
select category, sum(stock_qty) as total_stock from dim_product group by category order by total_stock;

-- Praktik 3
select brand, avg(selling_price) as avg_selling_price from dim_product group by brand order by avg_selling_price desc;

-- Praktik 4
select category, avg(margin) as rata_rata_margin from dim_product group by category order by rata_rata_margin desc;

-- =======================================================================================================
-- ============ PRAKTIK MIN() dan MAX() ==================

-- Praktik mandiri berikutnya
-- Gunakan tabel dim_product.
-- 1. Cari harga jual paling murah dari seluruh produk.
-- 2. Cari harga jual paling mahal dari seluruh produk.
-- 3. Tampilkan kategori, harga jual termurah, dan harga jual termahal untuk setiap kategori.
-- 4. Tampilkan brand dan margin tertinggi untuk setiap brand, urutkan dari margin tertinggi ke terendah.
-- 5. Tampilkan kategori dengan rata-rata harga jual dan total stoknya.

-- Praktik 1
select min(selling_price) as harga_termurah from dim_product;

-- Praktik 2
select max(selling_price) as harga_termahal from dim_product;

-- Praktik 3
select category, min(selling_price) as harga_termurah, max(selling_price) as harga_termahal from dim_product
group by category;

-- Praktik 4
select brand, max(margin) as margin_tertinggi from dim_product group by brand order by margin_tertinggi desc;

-- Praktik 5
select category, avg(selling_price) as avg_selling_price, sum(stock_qty) as total_stock from dim_product group by category;


-- =======================================================================================================
-- ============ PRAKTIK Having ==================

-- Tampilkan kategori yang mempunyai rata-rata margin lebih dari 200.000.

select category, avg(margin) as avg_margin from dim_product group by category having avg(margin) >10000;


-- ============ Praktik tingkat 2  Having
Latihan HAVING — Tingkat 2

-- 1. Tampilkan setiap kategori yang memiliki total stok lebih dari 1.000 unit.
-- 2. Tampilkan setiap brand yang memiliki jumlah produk lebih dari 5.
-- 3. Tampilkan kategori yang memiliki rata-rata selling_price lebih dari 500.000, urutkan dari rata-rata harga tertinggi.

-- Praktik 1
select category, sum(stock_qty) as total_stock from dim_product group by category having sum(stock_qty) >1000;

-- Praktik 2
select brand, count(*) as jumlah_produk from dim_product group by brand having count(*) > 5;

-- Praktik 3
select category, avg(selling_price) as avg_selling_price from dim_product group by category having avg(selling_price) >100000
order by avg_selling_price desc;