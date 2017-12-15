# stigs
Ansible Playbooks for Linux STIGs


I would like to thank both Sam Doran and Daniel Shephard. I originally came across Sam Doran project in October 2016 and used it to create the ansible STIG playbooks for RHEL 6 and RHEL 7. Currently my project has inherited over a 100 RHEL 5 system not STIG'd so I went looking for a RHEL 5 STIG playbook again and came across Daniel Shepherd project which I'm currently using to create a RHEL 5 playbook.   


References:

Doran, S. (2016) Ansible role for Red Hat 6 DISA STIG. URL: https://github.com/samdoran/ansible-role-rhel6stig
Shepherd, D. (2015) Ansible role for Red Hat 5 DISA STIG. URL: https://github.com/MindPointGroup/RHEL5-STIG


# How to run any of these playbooks:

cd /etc/ansible/playbooks
ansible-playbook rhel7-stigs.yml

Then answer yes to the categories you want to fix.
Note: Nothing will be correct unless you answer "y" to that category or category the finding is part of.

Single host:
ansible-playbook rhel7-stigs.yml --limit <hostname>

Single finding:
ansible-playbook rhel7-stigs.yml --tags V-38473

Single Category:
ansible-playbook rhel7-stigs.yml --tags fix_cat1

Dry Run with changes to be made shown:
ansible-playbook rhel7-stigs.yml --check --diff

List available tags:
ansible-playbook rhel7-stigs.yml --list-tags

To run RHEL 5 or 6 just replace rhel7 accordingly. 

Example menu:
Fix CAT 1 findings? Answer 'Yes/No' [No]:

Fix CAT 2 findings? Answer 'Yes/No' [No]:

Fix CAT 3 findings? Answer 'Yes/No' [No]:

Fix CAT 1 GUI findings? Answer 'Yes/No' [No]:

Fix CAT 2 GUI findings? Answer 'Yes/No' [No]:
Remove X Windows (V-72307)? Recommended if not needed.  Answer 'Yes/No' [No]:
Remove FTP server (LFTPD) (V-72299)? Removal required if not if use. Answer 'Yes/No' [No]:
Remove TFTP/TFTP-Server (V-72301)? Removal required if not if use.  Answer 'Yes/No' [No]:
Disable router functions (V-72309)? Required if not configured as a router? Answer 'Yes/No' [No]:
Set SELinux to enforcing (V-71989)? Answer 'Yes/No' [No]:


