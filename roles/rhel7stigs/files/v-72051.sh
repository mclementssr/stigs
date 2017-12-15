#!/bin/bash

sed -i 's|/var/log/cron|/var/log/cron.log|g' /etc/rsyslog.conf
 
