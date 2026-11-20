-- ============== Membuat Tabel ==================
CREATE TABLE dim_product (
	product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    subcategory VARCHAR(100),
    brand VARCHAR(100),
    cost_price INT,
    selling_price INT,
    margin INT,
    stock_qty INT
);

-- ========= Menampilkan kolom/tabel ============
SELECT * FROM dim_product;
SELECT product_name, category, brand from dim_product

-- ========= Menyaring Data Sesuai kondisi tertentu===============
SELECT * FROM dim_product  where cost_price >500000;

-- ========= Mengurutkan Produk/harga tertinggi/terendah ==========
SELECT * FROM dim_product ORDER BY category ASC;
SELECT * FROM dim_product ORDER BY category DESC;

-- ========= Membatasi Jumlah Data (mengambil 5 produk hrga tertinggi) ==========
SELECT * FROM dim_product ORDER BY cost_price LIMIT 5;