#!/bin/bash

if [[ $(firewall-cmd --direct --get-rule ipv4 filter IN_public_allow) ]] ; then
  echo "DDoS rule exists"
else
  firewall-cmd --direct --permanent --add-rule ipv4 filter IN_public_allow 0 -p tcp -m limit --limit 25/minute --limit-burst 100 -j ACCEPT
  firewall-cmd --reload
fi
