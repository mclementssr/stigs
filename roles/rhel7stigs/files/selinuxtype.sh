#!/bin/bash

if egrep "(SELINUXTYPE=minimum)" /etc/selinux/config; then
  sed --follow-symlink -i -e '/SELINUXTYPE=minimum/ s/SELINUXTYPE=minimum/SELINUXTYPE=targeted/' /etc/selinux/config
else
  egrep "(SELINUXTYPE=mls)" /etc/selinux/config;
  sed --follow-symlink -i -e '/SELINUXTYPE=mls/ s/SELINUXTYPE=mls/SELINUXTYPE=targeted/' /etc/selinux/config
fi

