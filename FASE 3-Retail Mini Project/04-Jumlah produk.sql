-- Tampilkan jumlah produk

select count(*) as total_product
	from dim_product;

select count(*) as total_promo
	from dim_promosi;