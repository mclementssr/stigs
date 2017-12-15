#!/bin/bash

system_auth="/etc/pam.d/system-auth"
system_auth_ac="/etc/pam.d/system-auth-ac"
#password_auth="/etc/pam.d/password-auth"
#password_auth_ac="/etc/pam.d/password-auth-ac"


if [[ $(grep '^session.* required.* pam_lastlog.so.*' "$system_auth") ]]; then
  sed -i 's/^session.* required.* pam_lastlog.so.*/session     required      pam_lastlog.so showfailed/' "$system_auth"
else
  sed -i '/^session.* optional.* pam_keyinit.so/s/.*/&\nsession     required      pam_lastlog.so showfailed/' "$system_auth"
fi


if [[ $(grep '^session.* required.* pam_lastlog.so.*' "$system_auth_ac") ]]; then
  sed -i 's/^session.* required.* pam_lastlog.so.*/session     required      pam_lastlog.so showfailed/' "$system_auth_ac"
else
  sed -i '/^session.* optional.* pam_keyinit.so/s/.*/&\nsession     required      pam_lastlog.so showfailed/' "$system_auth_ac"
fi


#if [[ $(grep '^session.* required.* pam_lastlog.so.*' "$password_auth") ]]; then
#  sed -i 's/^session.* required.* pam_lastlog.so.*/session     required      pam_lastlog.so showfailed/' "$password_auth"
#else
#  sed -i '/^session.* optional.* pam_keyinit.so/s/.*/&\nsession     required      pam_lastlog.so showfailed/' "$password_auth"
#fi


#if [[ $(grep '^session.* required.* pam_lastlog.so.*' "$password_auth_ac") ]]; then
#  sed -i 's/^session.* required.* pam_lastlog.so.*/session     required      pam_lastlog.so showfailed/' "$password_auth_ac"
#else
#  sed -i '/^session.* optional.* pam_keyinit.so/s/.*/&\nsession     required      pam_lastlog.so showfailed/' "$password_auth_ac"
#fi
