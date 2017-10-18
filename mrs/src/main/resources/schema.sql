drop table if exists meeting_room cascade;
drop table if exists reservable_room cascade;
drop table if exists reservation cascade;
drop table if exists usr cascade;

create table if not exists meeting_room (room_id serial not null, room_name varchar(255) not null, primary key (room_id));
create table if not exists reservable_room (reserved_date date not null, room_id int4 not null, primary key (reserved_date, room_id));
create table if not exists reservation (reservation_id serial not null, end_time time not null, start_time time not null, reserved_date date not null, room_id int4 not null, user_id varchar(255) not null, primary key (reservation_id));
create table if not exists usr (user_id varchar(255) not null, first_name varchar(255) not null, last_name varchar(255) not null, password varchar(255) not null, role_name varchar(255) not null, primary key (user_id));

alter table reservable_room drop constraint if exists fk_f4wnx2qj0d59s9tl1q5800fw7;
alter table reservation drop constraint if exists fk_p1k4iriqd4eo1cpnv79uvni9g;
alter table reservation drop constraint if exists fk_recqnfjcp370rygd9hjjxjtg;
alter table reservable_room add constraint fk_f4wnx2qj0d59s9tl1q5800fw7 foreign key (room_id) references meeting_room;
alter table reservation add constraint fk_p1k4iriqd4eo1cpnv79uvni9g foreign key (reserved_date, room_id) references reservable_room;
alter table reservation add constraint fk_recqnfjcp370rygd9hjjxjtg foreign key (user_id) references usr;
