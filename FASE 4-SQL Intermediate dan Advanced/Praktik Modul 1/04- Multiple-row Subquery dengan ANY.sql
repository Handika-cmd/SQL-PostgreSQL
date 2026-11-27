-- Operator any digunakan untuk membandingkan dengan sekumpulan nilai yagn dihasilkan oleh subquery
-- artinya nilai cukup terpenuhi minimal satu nilai dari sekumpulan yang dihasilkan oleh subqery

Studi Kasus Bisnis:
Carilah seluruh produk yang memiliki harga jual lebih rendah daripada minimal satu produk dalam kategori Elektronik.

SELECT
    product_id,
    product_name,
    category,
    selling_price
from dim_produk
WHERE selling_price < ANY(
    SELECT selling_price
    FROM dim_produk
    WHERE category = 'Elektronik'
);