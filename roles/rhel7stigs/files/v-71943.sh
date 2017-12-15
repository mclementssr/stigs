#!/bin/bash

system_auth_ac="/etc/pam.d/system-auth-ac"
password_auth_ac="/etc/pam.d/password-auth-ac"

if [[ ! $(grep 'auth.* required.* pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=900 unlock_time=604800' "$system_auth_ac") ]] ; then
  sed -i 's/\(^auth .* required .* pam_env.so\)$/\1\nauth        required      pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=900 unlock_time=604800/' "$system_auth_ac";
fi

if [[ ! $(grep 'auth.* sufficient.* pam_unix.so try_first_pass' "$system_auth_ac") ]]; then
  sed -i 's/^auth.* required.* pam_faillock.so preauth silent audit deny=[0-9]* even_deny_root fail_interval=[0-9]* unlock_time=[0-9]*$/&\nauth        sufficient    pam_unix.so try_first_pass/g' "$system_auth_ac"
fi

if [[ ! $(grep 'auth.* \[default=die\].* pam_faillock.so authfail audit deny=3 even_deny_root fail_interval=900 unlock_time=604800' "$system_auth_ac") ]]; then
  sed -i 's/auth.* requisite.* pam_succeed_if.so uid >= 1000 quiet_success/&\nauth        [default=die] pam_faillock.so authfail audit deny=3 even_deny_root fail_interval=900 unlock_time=604800/g' "$system_auth_ac"
fi



if [[ ! $(grep 'auth.* required.* pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=900 unlock_time=604800' "$password_auth_ac") ]]; then
  sed -i 's/\(^auth .* required .* pam_env.so\)$/\1\nauth        required      pam_faillock.so preauth silent audit deny=3 even_deny_root fail_interval=900 unlock_time=604800/' "$password_auth_ac";
fi

if [[ ! $(grep 'auth.* sufficient.* pam_unix.so try_first_pass' "$password_auth_ac") ]]; then
  sed -i 's/^auth.* required.* pam_faillock.so preauth silent audit deny=[0-9]* even_deny_root fail_interval=[0-9]* unlock_time=[0-9]*$/&\nauth        sufficient    pam_unix.so try_first_pass/g' "$password_auth_ac"
fi

if [[ ! $(grep 'auth.* \[default=die\].* pam_faillock.so authfail audit deny=3 even_deny_root fail_interval=900 unlock_time=604800' "$password_auth_ac") ]]; then
  sed -i 's/auth.* sufficient.* pam_unix.so try_first_pass/&\nauth        [default=die] pam_faillock.so authfail audit deny=3 even_deny_root fail_interval=900 unlock_time=604800/g' "$password_auth_ac"
fi 
