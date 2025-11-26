-- DQL - SELECT
--
-- 5 SELECT - column, column as alias, *, constant, calculated column
-- 1 FROM - table name
-- 2 WHERE - condition - OR/AND
-- 3 GROUP BY - column
-- 4 HAVING - condition
-- 6 ORDER BY - asc (by default), desc
-- 7 LIMIT - number

-- 1. show first_name, last_name from Latvia
select first_name, last_name
from userinfo
where country = 'Latvia';

-- 2. show first_name, last_name from Latvia and Poland
select first_name, last_name
from userinfo
where country = 'Latvia'
   or country = 'Poland';

-- 3. show first_name, last_name from Latvia and Poland, China
select first_name, last_name
from userinfo
where country in ('Latvia', 'Poland', 'China');

-- 4. show unique countries
select distinct country
from userinfo;

select country
from userinfo
group by country;

-- 5. show countries and genders and and number of people
select country, gender, count(*)
from userinfo
group by country, gender;

-- 6. show countries and number of different genders in it
select country, count(distinct gender) as genders_count
from userinfo
group by country;

-- 7. show countries with more than 5 users
select country, count(*) as users_count
from userinfo
group by country
having count(*) > 5;

-- 8. show all users with google email
select *
from userinfo
where email like '%@google.%';
