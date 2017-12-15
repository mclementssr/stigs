#!/bin/bash

#if [[ $(grep password /etc/pam.d/passwd | grep required | grep pam_pwquality.so | grep retry=3 ) ]] ; then
if [[ $(grep "^password [[:space:]] required " /etc/pam.d/passwd | grep pam_pwquality.so | grep retry=3 | wc -l) -eq 1 ]] ; then
  echo "Exist"
else 
  sed -i -e '$a\password   required     pam_pwquality.so retry=3\' /etc/pam.d/passwd 
fi
