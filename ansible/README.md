END 2 END tests
---------------

Tested on:
- macOS: 12.3.1
- Vagrant: 2.2.19
- VMware Fusion: 12.2.3

Installation
============

Prerequisites (Instructions for macOS):
- VMware Fusion (personal license): https://customerconnect.vmware.com/web/vmware/evalcenter?p=fusion-player-personal
- Vagrant: https://www.vagrantup.com/downloads
- VMware Fusion provider for vagrant: https://www.vagrantup.com/docs/providers/vmware/installation
- Vagrant VMware Utility: https://www.vagrantup.com/docs/providers/vmware/vagrant-vmware-utility

Ansible, molecule installation:
- create venv: ```cd ansible; mkdir .venv; python3 -m venv .venv```
- update pip: ```source .venv/bin/activate; pip3 install -U pip```
- install pip packages: ```pip install -r requirements.txt```

Ansible roles, collection installation:
- enter venv: ```source .venv/bin/activate```
- install roles,collections: ```ansible-galaxy role install -r requirements.yml```
- install collections: ```ansible-galaxy collection install -r requirements.yml```

Usage
=====

All commands must be executed inside venv.

Create test environment: ```molecule converge```
Run tests: ```molecule verify```

Contribute
==========

All tests located in verify playbook inside molecule tree. You can use variable ```libvirt_exporter_metrics``` to querry specific metrics and their values. Example:

```yaml
    - name: Assert that 'libvirt_up' in metrics
      assert:
        that: "libvirt_exporter_metrics | selectattr('name', 'equalto', 'libvirt_up') | first"
```

In this example, we use assert ansible module (https://docs.ansible.com/ansible/latest/collections/ansible/builtin/assert_module.html) to verify that there is a element in ```libvirt_exporter_metrics``` array with property ```name``` equals to  ```libvirt_up```. ```libvirt_exporter_metrics``` array is a parsed json response from libvirt-exporter.
