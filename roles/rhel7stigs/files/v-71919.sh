#!/bin/bash

sed -i 's/sha256/sha512/g' /etc/pam.d/system-auth-ac >> /dev/null

if [[ $(grep -x "^password [[:space:]].* sufficient [[:space:]].* pam_unix.so.* sha512.*" /etc/pam.d/system-auth-ac | wc -l) -eq 0 ]] ; then
  if [[ $(grep -x "^password [[:space:]].* sufficient [[:space:]].* pam_unix.so.*" /etc/pam.d/system-auth-ac | wc -l)l ]] ; then
    #echo "Didn't find password sufficient pam_unix.so"
    sed -i 's/^password [[:space:]].* sufficient [[:space:]].* pam_unix.so/& sha512/' /etc/pam.d/system-auth-ac
  #else
    #echo "Found password sufficient pam_unix.so"
  fi
#else
 #echo "exist"
fi
 
