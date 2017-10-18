-- ダミーユーザー(password = demo)
insert into usr(user_id, first_name, last_name, role_name, password) values ('taro-yamada', '太郎', '山田', 'USER', '$2a$10$oxSJl.keBwxmsMLkcT9lPeAIxfNTPNQxpeywMrF7A3kVszwUTqfTK')/;
-- 認証確認用のテストユーザー
insert into usr(user_id, first_name, last_name, role_name, password) values ('aaaa', 'Aaa', 'Aaa', 'USER', '$2a$10$oxSJl.keBwxmsMLkcT9lPeAIxfNTPNQxpeywMrF7A3kVszwUTqfTK')/;
insert into usr(user_id, first_name, last_name, role_name, password) values ('bbbb', 'Bbb', 'Bbb', 'USER', '$2a$10$oxSJl.keBwxmsMLkcT9lPeAIxfNTPNQxpeywMrF7A3kVszwUTqfTK')/;
insert into usr(user_id, first_name, last_name, role_name, password) values ('cccc', 'Ccc', 'Ccc', 'ADMIN', '$2a$10$oxSJl.keBwxmsMLkcT9lPeAIxfNTPNQxpeywMrF7A3kVszwUTqfTK')/;

--
insert into meeting_room(room_name) values ('新木場')/;
insert into meeting_room(room_name) values ('辰巳')/;
insert into meeting_room(room_name) values ('豊洲')/;
insert into meeting_room(room_name) values ('月島')/;
insert into meeting_room(room_name) values ('新富町')/;
insert into meeting_room(room_name) values ('銀座一丁目')/;
insert into meeting_room(room_name) values ('有楽町')/;

-- Stored Procedure
drop function if exists register_reservable_rooms()/;
create or replace function register_reservable_rooms()
  returns
    int as $$
declare
  total int;
  i int4;
  id int4;
begin
  total :=0;
  for id in select room_id from meeting_room loop
    i := 0;
    for i in 0..77 loop
      insert into reservable_room (reserved_date, room_id) values (current_date + i -7, id);
    end loop;
    total := total + i;
  end loop;
  return total;
end;
$$ language plpgsql
 /;
select register_reservable_rooms() /;

commit /;
