create database if not exists store;
use store;

create table if not exists accounts (
    acc_id          varchar(15) not null,
    acc_num         numeric(15),
    user_name         varchar(15),
    primary key (acc_id)
);

create table if not exists users (
    user_id         varchar(15) not null,
    acc_id          varchar(15),
    user_name       varchar(15),
    phone_number    char(10),
    email           varchar(50),
    home_address    varchar(100),
    primary key (user_id)
);

create table if not exists payments (
    pay_id          varchar(15) not null,
    user_id         varchar(15),
    pay_desc        varchar(30),
    pay_amount      numeric(10),
    pay_date        varchar(15),
    primary key (pay_id)
);

create table if not exists user_login (
    login_id        varchar(15) not null,
    user_id         varchar(15),
    user_name       varchar(20),
    user_password   varchar(15),
    primary key (login_id)
);


