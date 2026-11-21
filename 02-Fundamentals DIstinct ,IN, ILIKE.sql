-- ======= Menampilkan Data tanpa Duplikat ========
SELECT DISTINCT brand from dim_product ORDER BY brand ASC;

-- -- ======= Mencari data yang cocok dengan daftar nilai (ingin mencari  produk dari 3 brand) =====
SELECT product_name, category, brand FROM dim_product WHERE brand IN('IKEA', 'Indofood', 'Nike');

-- ====== Mencari produk mengandung kata "Laptop" =======
SELECT * FROM dim_product WHERE brand ILIKE '%Indofood';

-- select * from dim_product;