#!/usr/bin/env python
# coding: utf-8


import sys
from threading import Timer
import time


file_des = None


def do_write():
    log_str = '''14.19.198.82 08/Apr/2016:18:11:58 +0800 "GET /v2/ad/show.json?slot_name=homepage_banner_ad1&version=145&origin=android&height=2560&width=1440&supported_types=1&api_key=07e72bef932537c71f9cafbe4c94df1c&api_sign=d0b693ef913643bf451d6c2e7f3a1647& HTTP/1.1" 200 503 "-" "Dalvik/2.1.0 (Linux; U; Android 5.1.1; SM-G925F Build/LMY47X) xiachufang-android/V5.2.7 Build/145" 0.009 0.009 192.168.2.79:8903
    223.198.138.249 08/Apr/2016:18:11:58 +0800 "GET /v2/ad/show.json?slot_name=homepage_banner_ad2&sk=9hO3Uc7QT6iSAcqAdGyYXA&version=142&origin=android&height=1280&width=720&supported_types=1&api_key=07e72bef932537c71f9cafbe4c94df1c&api_sign=ec05100e1bf322ce58ad40db8af34d3c& HTTP/1.1" 200 352 "-" "Dalvik/2.1.0 (Linux; U; Android 5.0; F103L Build/LRX21M) xiachufang-android/V5.2.4 Build/142" 0.007 0.007 192.168.2.79:8903
    183.38.71.42 08/Apr/2016:18:11:58 +0800 "GET /v2/ad/lookup.json?origin=android&sk=CSLec1R2R9awHObf7xtUdA&api_sign=a1c860dfe941a2559d12aa7d08ec3339&slot_names=stick_event_ad1%2Cstick_event_ad2&supported_types=4&api_key=07e72bef932537c71f9cafbe4c94df1c&version=142& HTTP/1.1" 200 384 "-" "Dalvik/1.6.0 (Linux; U; Android 4.3; SM-N900 Build/JSS15J) xiachufang-android/V5.2.4 Build/142" 0.009 0.009 192.168.2.79:8903
    14.151.10.133 08/Apr/2016:18:11:58 +0800 "GET /v2/dishes/lookup_v2.json?version=5.3.1&id=106456446%2C106396046&api_sign=d8fe8e50c4473afc2549bbb1455c318b&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=znibQGcXTH2c-Xm4eK71jw HTTP/1.1" 200 1338 "-" "Mozilla/5.0 (iPhone; CPU iPhone OS 9.0 like Mac OS X) xiachufang-iphone/5.3.1 Build/75" 0.020 0.020 192.168.2.79:8901
    121.26.43.173 08/Apr/2016:18:11:58 +0800 "GET /v2/search/universal_search.json?offset=0&origin=iphone&via=&api_sign=d2ad79ff21d7d1a805759efdc9e3d702&q=%E8%8A%B1%E8%8F%9C&limit=20&version=5.3.1&api_key=0f9f79be1dac5f003e7de6f876b17c00 HTTP/1.1" 200 10436 "-" "Mozilla/5.0 (iPhone; CPU iPhone OS 9.0.2 like Mac OS X) xiachufang-iphone/5.3.1 Build/75" 0.008 0.008 192.168.2.79:8885
    223.104.20.170 08/Apr/2016:18:11:58 +0800 "GET /v2/recipes/1004020/collected_by_me.json?origin=android&api_key=07e72bef932537c71f9cafbe4c94df1c&sk=X7NS71UrQXS__XfAiatkRQ&api_sign=8f85df9111361a3f54bc2aed4aa1505c&version=154& HTTP/1.1" 200 237 "-" "Dalvik/2.1.0 (Linux; U; Android 5.1; vivo X6D Build/LMY47I) xiachufang-android/5.3.6 Build/154" 0.025 0.025 127.0.1.1:8882
    14.19.198.82 08/Apr/2016:18:11:58 +0800 "GET /v2/ad/show.json?slot_name=recipe_bottom_text_ad&version=145&origin=android&height=0&width=0&supported_types=2&api_key=07e72bef932537c71f9cafbe4c94df1c&api_sign=9f516cb4185e3c6eac69cd32ef12a85c& HTTP/1.1" 200 353 "-" "Dalvik/2.1.0 (Linux; U; Android 5.1.1; SM-G925F Build/LMY47X) xiachufang-android/V5.2.7 Build/145" 0.005 0.005 192.168.2.147:8903
    113.225.147.231 08/Apr/2016:18:11:58 +0800 "GET /v2/account/feeds_v4.json?origin=android&api_key=07e72bef932537c71f9cafbe4c94df1c&sk=DzZeWlJeQjmtnpPTLYIiHQ&api_sign=bff0aa05212015fa4e45111cadca2ee5&limit=1&offset=0&version=150& HTTP/1.1" 200 260 "-" "Dalvik/2.1.0 (Linux; U; Android 5.1; HUAWEI RIO-AL00 Build/HuaweiRIO-AL00) xiachufang-android/5.3.3 Build/150" 0.006 0.006 192.168.2.79:8882
    117.136.40.33 08/Apr/2016:18:11:58 +0800 "GET /v2/recipes/100265225/dishes_v2.json?sk=UqmQuS4QQXO7dEyuwgDxaQ&id=100265225&offset=0&version=154&origin=android&api_key=07e72bef932537c71f9cafbe4c94df1c&api_sign=d80dafefc780291e27fe82c9f01a2330&limit=6& HTTP/1.1" 200 342 "-" "Dalvik/2.1.0 (Linux; U; Android 5.1; m2 note Build/LMY47D) xiachufang-android/5.3.6 Build/154" 0.007 0.007 192.168.2.113:8882
    59.38.247.188 08/Apr/2016:18:11:58 +0800 "GET /v2/ad/show.json?sk=7JBKvlo4QWqkjHtvQUB-wA&height=1920&api_key=07e72bef932537c71f9cafbe4c94df1c&width=1080&origin=android&api_sign=8bb8c2d583637fc28731904f9604e659&supported_types=1&version=138&slot_name=homepage_banner_ad2& HTTP/1.1" 200 349 "-" "-" 0.006 0.006 127.0.1.1:8903\n'''
    global file_des
    print "do_write was call, ", time.time()
    for i in xrange(1, 200):
        file_des.write(log_str)
    t = Timer(1, do_write)
    print "do_write done:", time.time()
    t.start()


if __name__ == "__main__":
    file_name = sys.argv[1]
    file_des = open(file_name, "r+")
    do_write()
