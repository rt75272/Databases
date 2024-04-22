-- Inner join
select product_id, product_name, category_name
from products
inner join categories on products.category_id = categories.category_id;

-- Left join
select product_id, product_name, category_name
from products
left join categories on products.category_id = categories.category_id;

-- Right join
select product_id, product_name, category_name
from products
right join categories on products.category_id = categories.category_id;

-- Full outer join
select product_id, product_name, category_name
from products
full join categories on products.category_id = categories.category_id;