generate_markdown
=========

Role intended to generate READMEs for roles, define your variables and run the example playbook.  Adding other templates is possible, have to define vars for each one though.

Requirements
------------

- none

Role Variables
--------------

- template_source
- roles_dir
- role
- file_name
- readme.role_name
- readme.description
- readme.requirements
- readme.role_variables
- readme.dependencies
- readme.example_playbook
- readme.license
- readme.author_info

Dependencies
------------

- Ubuntu system

Example Playbook
----------------

- name: Converge
  hosts: all
  roles:
    - role: mathat13.role_book.generate_markdown


License
-------

BSD

Author Information
------------------

mathat13