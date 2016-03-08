#!/usr/bin/env python
#! coding: utf-8

import gevent
from gevent import monkey
monkey.patch_all()
from public import pubsub
#import time
#import threading


def pub_thread(ps):
    ps.pub_message("hello")
    ps.pub_message("hello")
    while True:
        ps.pub_message("hello")
        print "after 1 second will pub msg"
        # yield the controll
        gevent.sleep(1)
        #gevent.sleep(1)


def sub_thread(ps, sub):
    while True:
        msg = ps.sub_message(sub)
        print "message is: ", msg


if __name__ == "__main__":
    ps = pubsub.PubSub()
    pub = ps
    sub1 = ps.create_sub()
    sub2 = ps.create_sub()
#    tp = threading.Thread(target=pub_thread, args=(ps, ))
#    ts1 = threading.Thread(target=sub_thread, args=(ps, sub1))
#    ts2 = threading.Thread(target=sub_thread, args=(ps, sub2))
#    tp.start()
#    ts1.start()
#    ts2.start()
#    tp.join()
#    ts1.join()
#    ts2.join()

    gevent.joinall([
        gevent.spawn(pub_thread, ps),
        gevent.spawn(sub_thread, ps, sub1),
        gevent.spawn(sub_thread, ps, sub2),
    ])
