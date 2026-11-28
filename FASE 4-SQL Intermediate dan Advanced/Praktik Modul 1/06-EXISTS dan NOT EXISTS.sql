-- Active: 1795691861475@@127.0.0.1@5432@Data Transaksi

-- Apa itu EXISTS?

-- EXISTS digunakan untuk memeriksa apakah sebuah Subquery menghasilkan minimal satu baris data.
-- - EXISTS: bernilai TRUE jika Subquery menghasilkan minimal satu baris.
-- - NOT EXISTS: bernilai TRUE jika Subquery tidak menghasilkan baris sama sekali.
-- Perbedaannya dengan IN:
-- - IN memeriksa apakah suatu nilai cocok dengan nilai-nilai dari Subquery.
-- - EXISTS memeriksa apakah ada baris yang memenuhi kondisi Subquery.

SELECT
    p.product_id,
    p.product_name,
    p.category
from dim_produk as p
WHERE EXISTS(
        SELECT 1
        FROM fact_penjualan as f
        WHERE f.product_id = p.product_id
)
ORDER BY p.product_id asc;