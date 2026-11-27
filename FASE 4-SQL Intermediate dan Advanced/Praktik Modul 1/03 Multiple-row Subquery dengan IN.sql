SELECT
    product_id,
    product_name,
    category,
    selling_price
FROM dim_produk
WHERE selling_price IN(
    SELECT selling_price
    FROM dim_produk
    WHERE category ='Elektronik'
);