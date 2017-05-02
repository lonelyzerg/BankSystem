create database bank;
use bank;

create table if not exists user(
user_id int(10) not null auto_increment,
user_name varchar(20) not null,
password varchar(20) not null,
firstname varchar(20) not null,
lastname varchar(20) not null,
email varchar(50) not null,
addr varchar(100) not null,
addr2 varchar(20) not null,
postal int(10) not null,
phone int(15) not null,
city varchar(15) not null,
state varchar(15) not null,
country varchar(30) not null,
balance decimal(40,4) not null,
primary key(user_id))
engine=innodb default charset=utf8 auto_increment=1;

create table if not exists admin(
admin_id int(10) not null auto_increment,
admin_name varchar(10) not null,
admin_password varchar(20) not null,
primary key(admin_id))
engine=innodb default charset=utf8 auto_increment=1;

create table if not exists transaction(
tran_id int(20) not null auto_increment,
tran_time timestamp default current_timestamp,
tran_source int(10) not null,
tran_dest int(10) not null,
tran_amount decimal(40,4) not null,
tran_type varchar(15) not null,
primary key(tran_id))
engine=innodb default charset=utf8 auto_increment=1;

insert into admin(admin_name, admin_password) values("admin","123456");