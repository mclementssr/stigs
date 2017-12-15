#!/bin/bash

sed --follow-symlinks -i 's/public//g' /etc/snmp/snmpd.conf
#sed --follow-symlinks -i 's/private//g' /etc/snmp/snmpd.conf
