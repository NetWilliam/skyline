#!/usr/bin/env python
# coding: utf-8


from public import communicate as cm


def main():
    receiver = cm.MQReceiver("./")
    while True:
        print receiver.receive_message()


if __name__ == "__main__":
    main()
