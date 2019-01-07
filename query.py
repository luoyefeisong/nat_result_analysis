#!/usr/bin/env pyhton
# -*- coding:utf-8 -*-

"""
@Name: re_01_ip_location.py
@Author: lvah
@Date:1/11/18
@Connect: xc_guofan@163.com
@Desc:

    根据API查询IP的地理位置
"""

import urllib
import json
from urllib.request import urlopen
import pymysql
import time


def dict_get(dict1, obj):
    for k, v in dict1.items():
        if k == obj:
            return v
        else:
            if type(v) is dict:
                ret = dict_get(v, obj)
                if ret is not None:
                    return ret


def ip_query():
    conn = pymysql.connect(host='127.0.0.1', port=3306, user='root', passwd='123', db='xue')
    cursor = conn.cursor()


    flag = 1
    while flag:
        flag = 0
        cursor.execute("select ip from txt_data_1_7")
        all_ip_address = cursor.fetchall()
        for ip in all_ip_address:
            cursor.execute("select city from txt_data_1_7 where ip = %s", ip)
            city = cursor.fetchone()
            if city[0] != '':
                continue
            else:
                flag = 1
            url = 'http://ip.taobao.com/service/getIpInfo.php?ip=%s' % ip
            try:
                url_object = urlopen(url)
            except Exception as e:
                print(e)
                continue

            url_content = url_object.read()
            res = json.loads(url_content)
            cursor.execute("update txt_data_1_7 set region = %s, city = %s, isp = %s, isp_id = %s where ip = %s",
                           (
                            dict_get(res, 'region'), dict_get(res, 'city'), dict_get(res, 'isp'),
                            dict_get(res, 'isp_id'), dict_get(res, 'ip')))
        conn.commit()
    cursor.close()
    conn.close()

ip_query()