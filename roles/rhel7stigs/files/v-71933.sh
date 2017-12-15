#!/bin/bash

sed -i -e '/remember=[0-9]*/! s/\(^password [[:space:]].* sufficient [[:space:]].* pam_unix.so.*\)/\1 remember=5/g' \
       -e '/remember=5{1}/! s/\(^password [[:space:]].* sufficient [[:space:]].* pam_unix.so.* remember=\)[0-9]*/\15/g' \
/etc/pam.d/system-auth-ac

