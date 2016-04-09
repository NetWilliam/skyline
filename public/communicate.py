#!/usr/bin/env python
# coding: utf-8

import os
import sys
import hashlib
sys.path.append("..")
from skyconf import ZMQ_BIND_TO, ZMQ_CONNECT_TO # noqa
import zmq


MULTIPART = False

PROC_TYPE_INPROC = "inproc://"  #local in-process (inter-thread) communication transport, see zmq_inproc(7)
PROC_TYPE_IPC = "ipc://"        #local inter-process communication transport, see zmq_ipc(7)
PROC_TYPE_TCP = "tcp://"        #unicast transport using TCP, see zmq_tcp(7)
PROC_TYPE_PGM = "pgm://"        #reliable multicast transport using PGM, see zmq_pgm(7)


class MQ(object):

    def __init__(self, addr, mq_model_type):
        self.addr = addr

        ctx = zmq.Context()
        self.socket = ctx.socket(mq_model_type)


class MQSender(MQ):

    def __init__(self, path, proto_type=PROC_TYPE_IPC, mq_model_type=zmq.PUB, multipart=MULTIPART):
        self.path = path
        self.proto_type = proto_type
        self.multipart = multipart
        super(MQSender, self).__init__(self.get_addr_from_path(), mq_model_type)
        self.socket.bind(self.addr)

    def send_message(self, message):
        if self.multipart:
            self.socket.send_multipart(message)
        else:
            self.socket.send(message)

    def get_addr_from_path(self):
        if self.proto_type == PROC_TYPE_IPC and not os.path.exists(self.path):
            raise Exception("Path:[%s] not exists!!" % self.path)
        addr = self.proto_type + self.path
        if self.proto_type != PROC_TYPE_TCP:
            addr_md5 = hashlib.md5(addr).hexdigest()
            addr = self.proto_type + "/tmp/" + addr_md5 + ".zmq"
        return addr


class MQReceiver(MQ):

    def __init__(self, path, proto_type=PROC_TYPE_IPC, mq_model_type=zmq.SUB, multipart=MULTIPART):
        self.path = path
        self.proto_type = proto_type
        self.multipart = multipart
        super(MQReceiver, self).__init__(self.get_addr_from_path(), mq_model_type)

    def receive_message(self, message):
        if self.multipart:
            self.socket.send_multipart(message)
        else:
            self.socket.send(message)

    def get_addr_from_path(self):
        if self.proto_type == PROC_TYPE_IPC and not os.path.exists(self.path):
            raise Exception("Path:[%s] not exists!!" % self.path)
        addr = self.proto_type + self.path
        if self.proto_type != PROC_TYPE_TCP:
            addr_md5 = hashlib.md5(addr).hexdigest()
            addr = self.proto_type + "/tmp/" + addr_md5 + ".zmq"
        return addr
