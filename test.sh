#!/bin/sh
curl -XPOST -F "token=123" -F "user_name=${USER}" -F "channel_name=test" -F "text=$*" http://localhost:9393
