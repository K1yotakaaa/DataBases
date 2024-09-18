--1st task
create database lab1;

--2nd task
create table users (
    id serial not null,
    first_name varchar(50),
    last_name varchar(50)
);

--3rd task
alter table users
add column isadmin integer;

--4th task
alter table users
alter column isadmin type boolean using isadmin::boolean;

--5th task
alter table users
alter column isadmin set default false;

--6th task
alter table users
add primary key(id);

--7th task
create table tasks (
    id serial not null primary key,
    name varchar(50),
    user_id integer
);

--8th task
drop table tasks;

--9th task
drop database lab1;