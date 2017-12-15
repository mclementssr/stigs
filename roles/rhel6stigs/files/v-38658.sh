#!/bin/bash

system_auth="/etc/pam.d/system-auth"
system_auth_ac="/etc/pam.d/system-auth-ac"
#password_auth="/etc/pam.d/password-auth"
#password_auth_ac="/etc/pam.d/password-auth-ac"


if [[ $(grep '^password.* required.* pam_pwhistory.so.*' "$system_auth") ]]; then
  sed -i 's/^password.* required.* pam_pwhistory.so.*/password    required      pam_pwhistory.so remember=5/' "$system_auth"
else
  sed -i '/^password.* sufficient.* pam_unix.so/s/.*/&\npassword    required      pam_pwhistory.so remember=5/' "$system_auth"
fi


if [[ $(grep '^password.* required.* pam_pwhistory.so.*' "$system_auth_ac") ]]; then
  sed -i 's/^password.* required.* pam_pwhistory.so.*/password    required      pam_pwhistory.so remember=5/' "$system_auth_ac"
else
  sed -i '/^password.* sufficient.* pam_unix.so/s/.*/&\npassword    required      pam_pwhistory.so remember=5/' "$system_auth_ac"
fi


#if [[ $(grep '^password.* required.* pam_pwhistory.so.*' "$password_auth") ]]; then
#  sed -i 's/^password.* required.* pam_pwhistory.so.*/password    required      pam_pwhistory.so remember=5/' "$password_auth"
#else
#  sed -i '/^password.* sufficient.* pam_unix.so/s/.*/&\npassword    required      pam_pwhistory.so remember=5/' "$password_auth"
#fi


#if [[ $(grep '^password.* required.* pam_pwhistory.so.*' "$password_auth_ac") ]]; then
#  sed -i 's/^password.* required.* pam_pwhistory.so.*/password    required      pam_pwhistory.so remember=5/' "$password_auth_ac"
#else
#  sed -i '/^password.* sufficient.* pam_unix.so/s/.*/&\npassword    required      pam_pwhistory.so remember=5/' "$password_auth_ac"
#fi
