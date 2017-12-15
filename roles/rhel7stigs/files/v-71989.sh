#!/bin/bash

if egrep "(SELINUX=disabled)" /etc/selinux/config; then
  sed --follow-symlink -i -e '/SELINUX=disabled/ s/SELINUX=disabled/SELINUX=enforcing/' /etc/selinux/config
else
  egrep "(SELINUX=permissive)" /etc/selinux/config;
  sed --follow-symlink -i -e '/SELINUX=permissive/ s/SELINUX=permissive/SELINUX=enforcing/' /etc/selinux/config
fi
