-- Materi pertama: COUNT(), digunakan untuk menghitung jumlah baris atau nilai yang tidak NULL.
-- select count(*) as jumlah_data from dim_product;

-- Hitung seluruh jumlah produk dalam tabel dim_product
-- Hitung jumlah produk berdasarkan masing-masing kategori.
-- Hitung jumlah produk berdasarkan masing-masing brand.
-- Tampilkan kategori dan jumlah produk, urutkan dari jumlah produk terbanyak.
-- Hitung jumlah produk yang memiliki stok lebih dari 200.

-- soal 1
select count(*) as count_product from dim_product;

-- soal 2
select category, count(*) as count_category from dim_product group by category order by count_category desc;

-- Soal 3
select brand, count(*) as count_brand from dim_product group by  brand order by brand asc;

-- Soal 4
select category, count(*) as count_product from dim_product group by category order by count_product desc;

-- soal 5
select count(*) as count_product from dim_product where stock_qty >200;