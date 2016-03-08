#!/usr/bin/env python
#! coding: utf-8


import sys
from threading import Timer
import time


file_des = None


def do_write():
    global file_des
    print "do_write was call, ", time.time()
    for i in xrange(1, 4000):
        #write(file_des, 'HTTP/1.1" 589')
        file_des.write('HTTP/1.1" 589"\n')
    t = Timer(1, do_write)
    print "do_write done:", time.time()
    t.start()


if __name__ == "__main__":
    file_name = sys.argv[1]
    file_des = open(file_name, "r+")
    do_write()
