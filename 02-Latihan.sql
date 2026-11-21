-- Challenge 1 ================================
select * from dim_product where category = 'Elektronik' and stock_qty >100 order by stock_qty ASC;

-- Challenge 2 ================================
select product_name, brand from dim_product where brand in('Nike','Adidas') order by brand ASC;

-- Challenge 3 ================================
select product_name, brand,margin, selling_price from dim_product  where margin >150000 and selling_price < 1000000
order by margin ASC;

-- Challenge 4 ================================
select product_name, brand, category, stock_qty from dim_product
where (category='Elektronik' or category = 'Perabot')
and stock_qty <100;

-- Challenge 5 ================================
select product_name, brand, category, selling_price from dim_product
where (brand ='Samsung' or brand ='Xiaomi')
and selling_price > 500000;

-- challenge 6 ================================
-- Tampilkan produk yang bukan berasal dari kategori Makanan dan memiliki stok lebih dari 200.
select product_name, category, brand, stock_qty from dim_product
where category not in('Makanan') and stock_qty >200;

-- Challenge 7 ===============================
-- Tampilkan produk dengan harga jual antara 300.000 sampai 1.500.000, 
-- tetapi kecualikan brand IKEA dan Philips.
select product_name, category, brand, selling_price from dim_product
where selling_price between 300000 and 1500000
and brand not in('IKEA', 'Philips');

-- Challenge 8 ================================
-- Tim inventaris ingin mencari produk kategori Elektronik atau Perabot yang memenuhi salah satu kondisi berikut:
-- - Stok kurang dari 100.
-- - Margin lebih dari 300.000.
-- Tampilkan seluruh kolom produk.
select * from dim_product where (category ='Elektronik' or category ='Perabot')
and (stock_qty < 100 or margin > 300000);

-- Challenge 9 =================================
-- Tim pemasaran ingin mencari produk dengan brand Nike atau Adidas, tetapi hanya produk yang:
-- - Memiliki margin lebih dari 200.000.
-- - Stok lebih dari 50.
select * from dim_product where (brand='Nike' or brand ='Adidas')
and margin > 200000 and stock_qty >50;

-- Challenge 10 =================================
-- Tim manajemen ingin mencari produk kategori Makanan dengan subcategory Snack atau Minuman, 
-- tetapi hanya produk yang harga jualnya lebih dari 200.000 dan stoknya kurang dari 300.
select * from dim_product where category ='Makanan' 
and (subcategory ='Snack' or subcategory ='Minuman')
and selling_price > 200000
and stock_qty < 300;
