-- 1. add gender_group with values - male, female, others (use CASE) and show first_name, last_name, gender_group
select first_name,
       last_name,
       case
           when gender = 'Male' then 'male'
           when gender = 'Female' then 'female'
           else 'others'
           end as gender_group
from userinfo;

-- 2. count how many people in each gender_group
select case
           when gender = 'Male' then 'male'
           when gender = 'Female' then 'female'
           else 'others'
           end  as gender_group,
       count(*) as count
from userinfo
group by gender_group;

-- 3. show number of female, male, others by country in next way:
select country,
       count(case when gender = 'Male' then 1 end)                  as male,
       count(case when gender = 'Female' then 1 end)                as female,
       count(case when gender not in ('Male', 'Female') then 1 end) as others
from userinfo
group by country;