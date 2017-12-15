#!/bin/bash

grep -qF '/usr/sbin p+i+n+u+g+s+m+S+sha512+acl+xattrs+selinux' /etc/aide.conf  || sed -i '/DIR = p+i+n+u+g+acl+selinux+xattrs/a /usr/sbin p+i+n+u+g+s+m+S+sha512+acl+xattrs+selinux' /etc/aide.conf

grep -qF '/usr/bin p+i+n+u+g+s+m+S+sha512+acl+xattrs+selinux' /etc/aide.conf || sed -i '/DIR = p+i+n+u+g+acl+selinux+xattrs/a /usr/bin p+i+n+u+g+s+m+S+sha512+acl+xattrs+selinux' /etc/aide.conf

grep -qF '/etc p+i+n+u+g+s+m+S+sha512+acl+xattrs+selinux' /etc/aide.conf || sed -i '/DIR = p+i+n+u+g+acl+selinux+xattrs/a /etc p+i+n+u+g+s+m+S+sha512+acl+xattrs+selinux' /etc/aide.conf


