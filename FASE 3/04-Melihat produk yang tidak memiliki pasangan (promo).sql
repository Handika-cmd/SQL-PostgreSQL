-- produk yang belum memiliki promo

-- Ambil semua produk dari dim_product (p).
-- Cocokkan dengan dim_promosi (pr) berdasarkan product_id.
-- Jika setelah dicocokkan pr.product_id bernilai NULL, berarti produk tersebut tidak memiliki promosi.
-- Tampilkan product_id dan product_name produk yang tidak pernah masuk promosi.

select p.product_id,
	p.product_name
from dim_product as p
left join dim_promosi as pr
	on p.product_id = pr_product_id
where pr.product_id is null;