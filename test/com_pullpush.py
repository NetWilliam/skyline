#!/usr/bin/env python
# coding: utf-8

from public import communicate as cm
# import zmq


path = "/home/liuweibo/skyline/a.log"
recv_addr = "ipc:///tmp/b91aa7b6ff854f2f2d044833bccddf6c.zmq"
send_addr = "ipc:///tmp/6368978e253a52b88c340cf203878855.zmq"
recv = cm.MQReceiver(path, mq_model_type=cm.PULL)
send = cm.MQSender(path+".filter", mq_model_type=cm.PUSH, ctx=recv.ctx, bind_flag=False, connect_flag=True)
# context = zmq.Context()
# send = recv.ctx.socket(zmq.PUSH)
# send.connect(send_addr)
while True:
    msg = recv.receive_message()
    # print msg
    # send.send("%s" % len(msg))
    send.send_message(msg)
    print "send a msg done"
