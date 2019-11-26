Role Name
=========
nginx

Requirements
------------
None

Role Variables
--------------

state: present

Dependencies
------------

None
Example Playbook
----------------

```yaml
- name: Installing nginx role
  hosts: all
  become: true
  roles:
    - roles/nginx
```

License
-------

BSD

Author Information
------------------
Loki (lokesh.mydilse@gmail.com)
