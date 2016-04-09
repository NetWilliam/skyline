#!/usr/bin/env python
# coding: utf-8


import time
from public import communicate as cm


def main():
    sender = cm.MQSender("./")
    while True:
        print "pub 123"
        sender.send_message("123")
        time.sleep(1)


if __name__ == "__main__":
    main()
