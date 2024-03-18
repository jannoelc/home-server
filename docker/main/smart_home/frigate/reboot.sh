#!/bin/bash

while [ ! "$(docker ps -a | grep frigate)" ]; do sleep 1; done && sleep 16 && cd /root/main/smart_home && (docker compose restart frigate || :) && docker compose up frigate -d