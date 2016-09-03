#!/usr/bin/python
#coding=utf8

import sys
import re
import datetime
import time
from prettytable import PrettyTable

PROVINCE_MAP = {11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",
            22:"吉林", 23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:" 安徽",
            35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",
            44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",
            53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",
            65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}

def validate(fn):
    def wrapper(*args, **kwargs):
        id = kwargs.get("id", '')
        if id == '' and len(args) > 0:
            id = args[0]
        r='^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])(\d{4}|\d{3}X)$'
        if re.match(r, id) is None:
            raise ValueError("'%s' is not a valid ID Number!" % id)
        return fn(*args, **kwargs)
    return wrapper

@validate
def get_location_by_id(id, database = "data/行政区划代码.txt"):
    location_code = id[:6]
    province = PROVINCE_MAP[int(location_code[:2])] 
    city = None
    with open(database, "r") as f:
        for record in f:
             fields = record.split()
             if location_code == fields[0].strip():
                 city = fields[1].strip('\xe3\x80')
                 break
        if city is None:
            raise ValueError("'%s' is not a valid location code!" % location_code)
        return province + "省" +  city

@validate
def get_gender_by_id(id):
    gender = '男' if int(id[16]) % 2 == 1 else '女'
    return gender

@validate
def get_checkcode_by_id(id):
    weight = [7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2]
    check_code = ['1','0','X','9','8','7','6','5','4','3','2']
    sum = 0
    for i in range(len(id) - 1):
        sum += int(id[i]) * weight[i]
    return check_code[sum % 11]

@validate
def get_birthday_by_id(id):
    year = int(id[6:10])
    month = int(id[10:12])
    day = int(id[12:14])
    return datetime.date(year=year, month=month, day=day)

@validate
def get_age_by_id(id):
    birth_year = int(id[6:10])
    current_year = time.localtime().tm_year
    return current_year - birth_year

@validate
def get_info_by_id(id):
    return id, get_gender_by_id(id), get_age_by_id(id), get_birthday_by_id(id), get_location_by_id(id),get_checkcode_by_id(id)

def print_info(data):
    table = PrettyTable(["身份证", "性别", "年龄", "出生年月", "发证地点", "校验码"])
    if type(data) == "str":
        table.add_row(get_info_by_id(data))
    else:
        for id in data:
            table.add_row(get_info_by_id(id))
    print(table)

if __name__ == "__main__":
    data = list()
    with open("test_id_number.txt", "r") as f:
        for line in f:
            data.append(line.split()[0].strip())
    print_info(data)
