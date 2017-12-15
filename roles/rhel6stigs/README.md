Role Name
=========

A brief description of the role goes here.

Requirements
------------

How to run this playbook:

ansible-playbook rhel6-stigs.yml

Note: Nothing will be correct unless you answer "y" to that category.

Single host:

ansible-playbook rhel6-stigs.yml --limit <hostname>

Single finding/vulnerability:

ansible-playbook rhel6-stigs.yml --tags V-38473

Single Category:

ansible-playbook rhel6-stigs.yml --tags fix_cat1

Dry Run with changes to be made shown:

ansible-playbook rhel6-stigs.yml --check --diff

List available tags:

ansible-playbook rhel6-stigs.yml --list-tags


Role Variables
--------------

 TASK TAGS: [cat1, cat2, cat2-gui, cat3, cat3-gui, disable_autofs, gui, high, low, medium, removal_tftp, selinux_enforce]
 
 You can also you either the STIG Rule ID or Vuln ID as a tag to correct the individual vulnerability. 

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

MIT

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
