#!/bin/bash

system_auth="/etc/pam.d/system-auth"
system_auth_ac="/etc/pam.d/system-auth-ac"
password_auth="/etc/pam.d/password-auth"
password_auth_ac="/etc/pam.d/password-auth-ac"


if [[ $(grep '^password.* sufficient.* pam_unix.so.*' "$system_auth") ]]; then
  sed -i 's/^password.* sufficient.* pam_unix.so.*/password    sufficient    pam_unix.so sha512 shadow try_first_pass use_authtok remember=5/' "$system_auth"
fi


if [[ $(grep '^password.* sufficient.* pam_unix.so.*' "$system_auth_ac") ]]; then
  sed -i 's/^password.* sufficient.* pam_unix.so.*/password    sufficient    pam_unix.so sha512 shadow try_first_pass use_authtok/' "$system_auth_ac_ac"
fi


if [[ $(grep '^password.* sufficient.* pam_unix.so.*' "$password_auth") ]]; then
  sed -i 's/^password.* sufficient.* pam_unix.so.*/password    sufficient    pam_unix.so sha512 shadow try_first_pass use_authtok remember=5/' "$password_auth"
fi


if [[ $(grep '^password.* sufficient.* pam_unix.so.*' "$password_auth_ac") ]]; then
  sed -i 's/^password.* sufficient.* pam_unix.so.*/password    sufficient    pam_unix.so sha512 shadow try_first_pass use_authtok/' "$password_auth_ac"
fi
