# ansible

```
#!/usr/bin/env bash

## Install Ansible
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y curl git software-properties-common ansible

## Pull Ansible
sudo ansible-pull -U https://github.com/loonskai/ansible.git
```

```
ansible-playbook -t dotfiles --ask-vault-pass local.yml
```
