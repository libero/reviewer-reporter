#!/bin/sh

# This test email is temporary to be replaced with the result of:
# https://github.com/elifesciences/elife-xpub/blob/develop/scripts/prod-status.sh
echo "Sending mail $(date)"
/scripts/report-generator.sh
