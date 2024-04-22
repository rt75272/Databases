-- Run sql file with psql
--  $ sudo -u postgres psql
--  # \i path_to_sql_file

create table if not exists users (
    user_id     varchar(15) not null,
    user_name   varchar(15),
    age         numeric(15),
    primary key (user_id)
);

insert into users (user_id, user_name, age) values (00, 'Jolynne', 32);
insert into users (user_id, user_name, age) values (01, 'Bill', 82);
insert into users (user_id, user_name, age) values (02, 'Frank', 19);
insert into users (user_id, user_name, age) values (03, 'Ryan', 32);
