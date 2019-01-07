drop table if EXISTS result_1_7;
create table result_1_7 as SELECT 
COUNT(case when fail != 0 then fail end) as number_fail,
count(case when fail = 0 then fail end) as number_succ, 
COUNT(case when fail = 0 then fail end)COUNT() as rate_succ,
isp
FROM `txt_data_1_7` GROUP BY isp;

drop table if EXISTS result_region_1_7;
create table result_region_1_7 as SELECT
COUNT(case when fail != 0 then fail end) as number_fail,
count(case when fail = 0 then fail end) as number_succ, 
COUNT(case when fail = 0 then fail end)COUNT() as rate_succ,
region
from txt_data_1_7 GROUP BY region;

drop table if EXISTS result_city_1_7;
create table result_city_1_7 as SELECT
COUNT(case when fail != 0 then fail end) as number_fail,
count(case when fail = 0 then fail end) as number_succ, 
COUNT(case when fail = 0 then fail end)COUNT() as rate_succ,
city
from txt_data_1_7 GROUP BY city;