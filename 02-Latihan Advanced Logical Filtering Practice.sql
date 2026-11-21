

-- Challenge 1 ============================
-- Tim inventaris ingin mencari produk kategori Elektronik
-- atau Perabot yang memiliki stok lebih dari 150 dan margin lebih dari 200.000.
select * from dim_product where (category ='Elektronik' or category ='Perabot')
and stock_qty >150 and margin >200000;

-- Challenge 2 ============================
-- Tim pemasaran ingin mencari produk dari brand Nike, Adidas, atau Samsung, 
-- tetapi harga jualnya harus berada di antara 300.000 dan 2.000.000.
select * from dim_product where (brand ='Nike' or brand = 'Adidas' or brand ='Samsung')
and selling_price between 300000 and 2000000 order by brand ASC;

-- Challenge 3 ============================
-- Tim manajemen ingin mencari produk kategori Elektronik atau Makanan 
-- yang memenuhi salah satu kondisi berikut:
-- -Stok kurang dari 100.
-- -Margin lebih dari 350.000.
select * from dim_product where(category ='Elektronik' or category ='Makanan')
and (stock_qty < 100 or margin > 350000) order by category asc;

-- Challenge 4 ================================
-- Tim inventaris ingin mencari produk yang bukan berasal dari brand IKEA atau Philips, dengan ketentuan:
-- - Kategori produk adalah Elektronik atau Perabot.
-- - Stok lebih dari 100.
select * from dim_product where brand not in ('IKEA','Philips')
and (category ='Elektronik' or category ='Perabot')
and stock_qty >100 order by brand asc;

-- Challenge 5 =================================
-- Tim manajemen ingin membuat daftar produk potensial untuk diprioritaskan. Kriteria bisnisnya:
-- - Kategori harus Elektronik atau Perabot.
-- - Brand bukan IKEA dan bukan Samsung.
-- - Produk harus memenuhi salah satu kondisi:
--   - Margin lebih dari 250.000 dan stok kurang dari 200.
--   - Harga jual lebih dari 1.000.000 dan stok lebih dari 100.

select product_id, product_name, category, brand, selling_price, margin, stock_qty from dim_product
where category in('Elektronik','Perabot')
and brand not in('IKEA','Samsung')
and ((margin >250000 and stock_qty <200) or (selling_price > 1000000 and stock_qty >100))
order by margin desc;