-- Run sql file with psql
--  $ sudo -u postgres psql
--  # \i path_to_sql_file

create table if not exists accounts (
    acc_id          varchar(15) not null,
    acc_num         numeric(15),
    user_name         varchar(15),
    primary key (acc_id)
);

insert into accounts (acc_id, acc_num, user_name) values (7791, 07, 'Jolynne');
insert into accounts (acc_id, acc_num, user_name) values (3346, 00, 'Bill'); 
insert into accounts (acc_id, acc_num, user_name) values (8235, 03, 'Frank'); 
insert into accounts (acc_id, acc_num, user_name) values (7492, 05, 'Ryan');
