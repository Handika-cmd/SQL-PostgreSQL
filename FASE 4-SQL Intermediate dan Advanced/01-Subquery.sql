-- Apa itu Subquery?
-- Subquery adalah sebuah query SQL yang berada di dalam query SQL lainnya.
-- Dengan kata lain, kita menjalankan sebuah query untuk mendapatkan hasil yang kemudian digunakan oleh query utama.

-- Misalnya, perusahaan ingin mengetahui:

-- Produk apa saja yang memiliki harga jual di atas rata-rata harga seluruh produk?
-- Untuk menjawabnya, kita membutuhkan dua proses:
-- - Proses pertama: menghitung rata-rata harga seluruh produk.
-- - Proses kedua: mencari produk yang harga jualnya lebih tinggi daripada rata-rata tersebut.

-- proses 1: mencari rata rata harga jual seluruh produk
select
	round(avg(selling_price)::numeric,2)
from dim_produk;

-- Proses ke 2: setelah tahu rata rata gabungkan 
select
	product_id,
	product_name,
	selling_price
from dim_produk
where selling_price > (
	select
		avg(selling_price)
	from dim_produk
)
order by selling_price desc;