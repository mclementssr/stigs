#!/bin/bash

system_auth="/etc/pam.d/system-auth"
system_auth_ac="/etc/pam.d/system-auth-ac"
password_auth="/etc/pam.d/password-auth"
password_auth_ac="/etc/pam.d/password-auth-ac"


if [[ $(grep '^auth.* required.* pam_faillock.so' "$system_auth") ]]; then
  sed -i 's/^auth.* required.* pam_faillock.so.*/auth        required      pam_faillock.so preauth silent deny=3 unlock_time=604800 fail_interval=900/' "$system_auth"
else
  sed -i '/^auth.* required.* pam_env.so/s/.*/&\nauth        required      pam_faillock.so preauth silent deny=3 unlock_time=604800 fail_interval=900/' "$system_auth"
fi

if [[ $(grep '^auth.* \[default=die].* pam_faillock.so' "$system_auth") ]]; then
  sed -i 's/^auth.* [default=die].* pam_faillock.so.*/auth    [default=die]    pam_faillock.so authfail deny=3 unlock_time=604800 fail_interval=900/' "$system_auth"
else
  sed -i 's/^auth.* required.* pam_deny.so.*/auth        [default=die]    pam_faillock.so authfail deny=3 unlock_time=604800 fail_interval=900\n&/' "$system_auth"
fi

if [[ $(grep '^account.* required.* pam_faillock.so' "$system_auth") ]]; then
  sed -i 's/^account.* required.* pam_faillock.so.*/account     required      pam_faillock.so/' "$system_auth"
else
  sed -i 's/^account.* required.* pam_unix.so.*/account     required      pam_faillock.so\n&/' "$system_auth"
fi


if [[ $(grep '^auth.* required.* pam_faillock.so' "$system_auth_ac") ]]; then
  sed -i 's/^auth.* required.* pam_faillock.so.*/auth        required      pam_faillock.so preauth silent deny=3 unlock_time=604800 fail_interval=900/' "$system_auth_ac"
else
  sed -i '/^auth.* required.* pam_env.so/s/.*/&\nauth        required      pam_faillock.so preauth silent deny=3 unlock_time=604800 fail_interval=900/' "$system_auth_ac"
fi

if [[ $(grep '^auth.* \[default=die].* pam_faillock.so' "$system_auth_ac") ]]; then
  sed -i 's/^auth.* [default=die].* pam_faillock.so.*/auth    [default=die]    pam_faillock.so authfail deny=3 unlock_time=604800 fail_interval=900/' "$system_auth_ac"
else
  sed -i 's/^auth.* required.* pam_deny.so.*/auth        [default=die]    pam_faillock.so authfail deny=3 unlock_time=604800 fail_interval=900\n&/' "$system_auth_ac"
fi

if [[ $(grep '^account.* required.* pam_faillock.so' "$system_auth_ac") ]]; then
  sed -i 's/^account.* required.* pam_faillock.so.*/account     required      pam_faillock.so/' "$system_auth_ac"
else
  sed -i 's/^account.* required.* pam_unix.so.*/account     required      pam_faillock.so\n&/' "$system_auth_ac"
fi



if [[ $(grep '^auth.* required.* pam_faillock.so' "$password_auth") ]]; then
  sed -i 's/^auth.* required.* pam_faillock.so.*/auth        required      pam_faillock.so preauth silent deny=3 unlock_time=604800 fail_interval=900/' "$password_auth"
else
  sed -i '/^auth.* required.* pam_env.so/s/.*/&\nauth        required      pam_faillock.so preauth silent deny=3 unlock_time=604800 fail_interval=900/' "$password_auth"
fi

if [[ $(grep '^auth.* \[default=die].* pam_faillock.so' "$password_auth") ]]; then
  sed -i 's/^auth.* [default=die].* pam_faillock.so.*/auth    [default=die]    pam_faillock.so authfail deny=3 unlock_time=604800 fail_interval=900/' "$password_auth"
else
  sed -i 's/^auth.* required.* pam_deny.so.*/auth        [default=die]    pam_faillock.so authfail deny=3 unlock_time=604800 fail_interval=900\n&/' "$password_auth"
fi

if [[ $(grep '^account.* required.* pam_faillock.so' "$password_auth") ]]; then
  sed -i 's/^account.* required.* pam_faillock.so.*/account     required      pam_faillock.so/' "$password_auth"
else
  sed -i 's/^account.* required.* pam_unix.so.*/account     required      pam_faillock.so\n&/' "$password_auth"
fi


if [[ $(grep '^auth.* required.* pam_faillock.so' "$password_auth_ac") ]]; then
  sed -i 's/^auth.* required.* pam_faillock.so.*/auth        required      pam_faillock.so preauth silent deny=3 unlock_time=604800 fail_interval=900/' "$password_auth_ac"
else
  sed -i '/^auth.* required.* pam_env.so/s/.*/&\nauth        required      pam_faillock.so preauth silent deny=3 unlock_time=604800 fail_interval=900/' "$password_auth_ac"
fi

if [[ $(grep '^auth.* \[default=die].* pam_faillock.so' "$password_auth_ac") ]]; then
  sed -i 's/^auth.* [default=die].* pam_faillock.so.*/auth    [default=die]    pam_faillock.so authfail deny=3 unlock_time=604800 fail_interval=900/' "$password_auth_ac"
else
  sed -i 's/^auth.* required.* pam_deny.so.*/auth        [default=die]    pam_faillock.so authfail deny=3 unlock_time=604800 fail_interval=900\n&/' "$password_auth_ac"
fi

if [[ $(grep '^account.* required.* pam_faillock.so' "$password_auth_ac") ]]; then
  sed -i 's/^account.* required.* pam_faillock.so.*/account     required      pam_faillock.so/' "$password_auth_ac"
else
  sed -i 's/^account.* required.* pam_unix.so.*/account     required      pam_faillock.so\n&/' "$password_auth_ac"
fi

