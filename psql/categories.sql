-- Run sql file with psql
--  $ sudo -u postgres psql
--  # \i path_to_sql_file
create table if not exists categories (
    category_id     serial not null,
    category_name   varchar(15),
    primary key     (category_id)
);

insert into categories (category_name) values ('Beverages');
insert into categories (category_name) values ('Condiments');
insert into categories (category_name) values ('Confections');
insert into categories (category_name) values ('Dairy');