#!/bin/bash

system_auth="/etc/pam.d/system-auth"
system_auth_ac="/etc/pam.d/system-auth-ac"
password_auth="/etc/pam.d/password-auth"
password_auth_ac="/etc/pam.d/password-auth-ac"


if [[ $(grep '^password.* requisite.* pam_cracklib.so' "$system_auth") ]]; then
  sed -i 's/^password.* requisite.* pam_cracklib.so.*/password    requisite     pam_cracklib.so try_first_pass retry=3 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1 difok=8 maxrepeat=3/' "$system_auth"
fi

if [[ $(grep '^password.* requisite.* pam_cracklib.so' "$system_auth_ac") ]]; then
  sed -i 's/^password.* requisite.* pam_cracklib.so.*/password    requisite     pam_cracklib.so try_first_pass retry=3 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1 difok=8 maxrepeat=3/' "$system_auth_ac"
fi



#if [[ $(grep '^password.* requisite.* pam_cracklib.so' "$password_auth") ]]; then
#  sed -i 's/^password.* requisite.* pam_cracklib.so.*/password    requisite     pam_cracklib.so try_first_pass retry=3 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1 difok=8 maxrepeat=3/' "$password_auth"
#fi

#if [[ $(grep '^password.* requisite.* pam_cracklib.so' "$password_auth_ac") ]]; then
#  sed -i 's/^password.* requisite.* pam_cracklib.so.*/password    requisite     pam_cracklib.so try_first_pass retry=3 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1 difok=8 maxrepeat=3/' "$password_auth_ac"
#fi


