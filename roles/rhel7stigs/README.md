Role Name
=========

A brief description of the role goes here.

Requirements
------------

 How to run this playbook:

 ansible-playbook rhel7-stigs.yml

 Note: Nothing will be correct unless you answer "y" to that category or finding category.

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
 
 #### or

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


Role Variables
--------------

TASK TAGS: [cat1, cat1-gui, cat2, cat2-gui, cat3, disable_autofs, high, low, medium, removal_lftpd, removal_router, removal_tftp, selinux_enforce]

You can also use either the STIG Rule ID or Vuln ID as a tag to correct the individual vulnerability.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

   - hosts: all
     gather_facts: true
     #become: yes
     #become_method: su
     become: true
     become_flags: '-s'
    
    - hosts: servers
      roles:
         - roles/rhel7stigs

License
-------

MIT

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
