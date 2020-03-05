#!/bin/sh

echo "Build ssmtp.conf ..."
envsubst < /mail-config/ssmtp.conf.template >/etc/ssmtp/ssmtp.conf
