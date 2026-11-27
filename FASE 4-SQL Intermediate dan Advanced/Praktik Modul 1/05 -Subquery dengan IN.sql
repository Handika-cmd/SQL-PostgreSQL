Konsep IN digunakan untuk memeriksa apakah suatu nilai terdapat di dalam sekumpulan nilai.

Studi Kasus:
Cari produk yang pernah memiliki harga jual yang sama dengan salah satu produk dalam kategori Elektronik.

SELECT
    product_id,
    product_name,
    category,
    selling_price
FROM dim_produk
WHERE selling_price IN(
    SELECT selling_price
    FROM dim_produk
    WHERE category = 'Elektronik'
)
ORDER BY selling_price DESC;

-- Pertanyaan bisnis:
-- Carilah seluruh produk yang harga jualnya tidak sama dengan harga jual produk mana pun dalam kategori Minuman.

SELECT
    product_name,
    category,
    selling_price
from dim_produk
WHERE selling_price NOT IN(
    SELECT selling_price
    FROM dim_produk
    WHERE category = 'Minuman'
)
ORDER BY selling_price DESC;