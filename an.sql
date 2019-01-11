drop table if EXISTS result_1_11;
create table result_1_11 as SELECT 
isp,
count(case when fail = 0 then fail end) as number_succ, 
COUNT(case when fail != 0 then fail end) as number_fail,
COUNT(case when fail = 0 then fail end)/COUNT(*) as rate_succ
FROM `txt_data_1_11` GROUP BY isp;

drop table if EXISTS result_region_1_11;
create table result_region_1_11 as SELECT
region,
count(case when fail = 0 then fail end) as number_succ, 
COUNT(case when fail != 0 then fail end) as number_fail,
COUNT(case when fail = 0 then fail end)/COUNT(*) as rate_succ
from txt_data_1_11 GROUP BY region;

drop table if EXISTS result_city_1_11;
create table result_city_1_11 as SELECT
city,
count(case when fail = 0 then fail end) as number_succ, 
COUNT(case when fail != 0 then fail end) as number_fail,
COUNT(case when fail = 0 then fail end)/COUNT(*) as rate_succ
from txt_data_1_11 GROUP BY city;

drop table if EXISTS result_city_isp_1_11;
create table result_city_isp_1_11 as SELECT
city, isp,
count(case when fail = 0 then fail end) as number_succ, 
COUNT(case when fail != 0 then fail end) as number_fail,
COUNT(case when fail = 0 then fail end)/COUNT(*) as rate_succ
from txt_data_1_11 GROUP BY city, isp
;