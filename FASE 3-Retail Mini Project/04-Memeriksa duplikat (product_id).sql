-- Memeriksa duplikasi product_id di dim_promosi

select product_id,
	count(*) as jumlah_promo
from dim_promosi
group by product_id
having count(*) >1;