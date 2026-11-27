SELECT
    product_id,
    product_name,
    category,
    selling_price
FROM dim_produk
WHERE selling_price >(
    SELECT avg(selling_price)
    from dim_produk
)
ORDER BY selling_price DESC;