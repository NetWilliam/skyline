#!/usr/bin/env python
# coding: utf-8

from public import communicate as cm


path = "/home/liuweibo/skyline/a.log.filter"
recv = cm.MQReceiver(path, mq_model_type=cm.PULL, bind_flag=True)
while True:
    print recv.receive_message()
