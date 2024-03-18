#!/bin/bash

crontab -l | head -n -1 | { cat; echo "$CRON_EXPR /data/backup.sh"; } | crontab -
crond -f -d 0
