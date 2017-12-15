#!/bin/bash

if [[ $(grep -x "^session [[:space:]].* required [[:space:]].* pam_lastlog.so.* showfailed" /etc/pam.d/postlogin-ac | wc -l) -eq 0 ]] ; then
  if [[ $(grep -x "^session [[:space:]].* required [[:space:]].* pam_lastlog.so.*" /etc/pam.d/postlogin-ac | wc -l)l ]] ; then
    echo "Inserting new line"
    sed -i '$ a session     required      pam_lastlog.so showfailed' /etc/pam.d/postlogin-ac
  else
    echo "Didn't find showfailed"
    sed -i 's/^session [[:space:]].* required [[:space:]].* pam_lastlog.so.*/& showfailed/' /etc/pam.d/postlogin-ac
  fi
#else
 #echo "exist"
fi
 
