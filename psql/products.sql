-- Run sql file with psql
--  $ sudo -u postgres psql
--  # \i path_to_sql_file

create table if not exists products (
    product_id      serial not null,
    product_name    varchar(15),
    category_id     numeric(15),
    primary key     (product_id)
);

insert into products (product_name, category_id) values ('Geitost', 4);
insert into products (product_name, category_id) values ('Sasquatch Ale', 1);
insert into products (product_name, category_id) values ('Steeleye Stout', 1);
insert into products (product_name, category_id) values ('Inalgd Sill', 8);