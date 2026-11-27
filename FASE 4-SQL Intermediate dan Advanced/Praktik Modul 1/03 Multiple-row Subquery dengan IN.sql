-- SELECT
--     product_id,
--     product_name,
--     category,
--     selling_price
-- FROM dim_produk
-- WHERE selling_price IN(
--     SELECT selling_price
--     FROM dim_produk
--     WHERE category ='Elektronik'
-- );

Studi kasus bisnis
-- Manajemen ingin mengetahui produk apa saja yang memiliki harga jual lebih tinggi daripada seluruh produk dalam kategori Elektronik.

SELECT
    product_id,
    product_name,
    category,
    selling_price
FROM dim_produk
WHERE selling_price > ALL (
    SELECT selling_price
    FROM dim_produk
    WHERE category ='Elektronik'
)
ORDER BY selling_price desc;