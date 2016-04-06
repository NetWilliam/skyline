#!/usr/bin/env python
# coding: utf-8

ZMQ_BIND_TO = "tcp://127.0.0.1:5678"
ZMQ_CONNECT_TO = "tcp://127.0.0.1:5678"

REDIS_HOST = "redis"
REDIS_PORT = 6379

ZMQ_TYPE = "zmq"
REDIS_TYPE = "redis"
PUBSUB_TYPE = ZMQ_TYPE

WARNING_ALERT = [
    {
        "name": "common_alert",
        "emails": ["alert@xiachufang.com"],
        "phones": ["18612345678"],
    }
]

ALERT_URL = "http://localhost:9999/api/alert/send_alert.json"

# 发邮件使用的邮箱名和用户名
SYS_EMAIL_SENDER = "noreply@xiachufang.com"
INTERNAL_EMAIL_SENDER = "noreply@info.xiachufang.com"
SYS_EMAIL_SENDER_NAME = "下厨房"

# 发信使用send cloud配置
SEND_CLOUD_CONFIG = dict(
    url="https://sendemail.com/send_email",
    api_user="xiachufang_user",
    api_key="xiachufang_key"
)
INTERNAL_SEND_CLOUD_CONFIG = SEND_CLOUD_CONFIG

SMSCENTER_HOST = "https://sms.xiachufang.com"
SMSCENTER_PUBLIC_KEY = 'xiachufang_public_key'
SMSCENTER_SECRET_KEY = 'xiachufang_secret_key'
