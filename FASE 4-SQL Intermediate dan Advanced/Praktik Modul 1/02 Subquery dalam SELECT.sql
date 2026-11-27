
-- 02-Product Price Comparison

-- Studi kasus bisnis:
-- Manajemen ingin mengetahui perbandingan harga setiap produk dengan rata-rata harga jual seluruh produk.

-- Buat query dengan ketentuan:
-- 1. Tampilkan product_id.
-- 2. Tampilkan product_name.
-- 3. Tampilkan category.
-- 4. Tampilkan selling_price.
-- 5. Tambahkan kolom rata_rata_harga menggunakan Scalar Subquery di dalam SELECT.
-- 6. Tambahkan kolom selisih_harga, yaitu harga jual produk dikurangi rata-rata harga jual seluruh produk.
-- 7. Urutkan berdasarkan selisih_harga dari nilai terbesar ke terkecil.

select
	product_id,
	product_name,
	category,
	selling_price,
	(
		select round(avg(selling_price)::numeric,2)
		from dim_produk
	) as rata_rata_harga,
	selling_price - (
		select round(avg(selling_price)::numeric,2)
		from dim_produk
	) as selisih_harga
from dim_produk
order by selisih_harga desc;