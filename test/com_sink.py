#!/usr/bin/env python
# coding: utf-8

from public import communicate as cm
import zmq


bind_addr = "ipc:///tmp/6368978e253a52b88c340cf203878855.zmq"
path = "/home/liuweibo/skyline/a.log"
# recv = cm.MQReceiver(path, mq_model_type=cm.PULL)
recv = cm.MQReceiver(path+".filter", mq_model_type=cm.PULL, bind_flag=True, connect_flag=False)
context = zmq.Context()
recv = context.socket(zmq.PULL)
recv.bind(bind_addr)
while True:
    msg = recv.recv()
    print msg
