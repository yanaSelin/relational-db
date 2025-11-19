--show first_name, last_name from Latvia
select first_name, last_name
from userinfo
where country = 'Latvia';

--show first_name, last_name from Latvia and Poland
select first_name, last_name
from userinfo
where country = 'Latvia'
   or country = 'Poland';

--show first_name, last_name from Latvia and Poland, China
select first_name, last_name
from userinfo
where country in ('Latvia', 'Poland', 'China');

--show unique countries
select distinct country
from userinfo;

--show countries and number of different genders in it
select country, count(distinct gender) as genders_count
from userinfo
group by country;

--show countries and genders and and number of people
select country, gender, count(*)
from userinfo
group by country, gender;

--show number of female, male, others by country
select country,
       count(case when gender = 'Male' then 1 end)                  as Male,
       count(case when gender = 'Female' then 1 end)                as Female,
       count(case when gender not in ('Male', 'Female') then 1 end) as Others
from userinfo
group by country;

--show countries with more than 5 users
select country, count(*) as users_count
from userinfo
group by country
having count(*) > 5;

--show all users with google email
select *
from userinfo
where email like '%@google.%';