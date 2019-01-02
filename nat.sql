
create DATABASE  if not EXISTS xue;
use xue;
drop TABLE if EXISTS nat_detect;
create TABLE nat_detect(if_succ int UNSIGNED not null, ip VARCHAR(32) not null);
SET GLOBAL local_infile = 1; 
load data local infile 'C:/Users/xueyu/Desktop/stat.txt' INTO TABLE nat_detect FIELDS TERMINATED by ':';

drop table if EXISTS txt_data;
CREATE TABLE txt_data AS SELECT ip, count(case when if_succ = 1 then if_succ end) as succ, count(case when if_succ = 0 then if_succ end) as fail from nat_detect group by ip;

alter table txt_data add COLUMN (region VARCHAR(32) NOT NULL, city VARCHAR(32) NOT NULL, isp VARCHAR(32) NOT NULL, isp_id VARCHAR(32) NOT NULL);

