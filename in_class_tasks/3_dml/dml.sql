-- 1. add new record with first name and second name and email
insert into users (last_name, first_name, email)
values ('x', 'y', 'x_y@email.com');

-- 2. for last added record set id
update users
set id = 101
where first_name = 'x'
  and last_name = 'y';

-- 3. remove users who has no join_date
delete
from users
where join_date is null;

-- 4. remove users with join_date smwhere in Jan 2024
set datestyle = 'MDY';

delete
from users
where join_date >= '1/1/2024'
  and join_date < '2/1/2024';

-- 5. add new user with join_date = today for new user
insert into users (id, first_name, last_name, email, join_date, yes_no)
values (102, 'Yana', 'Asadchaya', 'yana@gmail.com', now(), false);

-- 6. add new column full_name = first_name + last_name
alter table users
    add column full_name varchar(100);

update users
set full_name = first_name || ' ' || last_name;

-- 7. swap true and false values in yes_no column
update users
set yes_no = case
                 when yes_no = 'true' then 'false'
                 when yes_no = 'false' then 'true'
                 else yes_no
    end;