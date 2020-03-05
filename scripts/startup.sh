#!/bin/sh

echo "Building config..."
. /mail-config/build_ssmtp_conf.sh

echo "Modifying cron..."
echo "*       8       *       *       *       run-parts /etc/periodic/daily8am" >> /etc/crontabs/root
echo "*       13       *       *       *       run-parts /etc/periodic/daily1pm" >> /etc/crontabs/root
crontab -l

echo "Starting cron..."
crond -f -l 8
