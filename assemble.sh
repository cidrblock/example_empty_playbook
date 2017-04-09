#! /bin/bash

git clone -b 1.01 https://github.com/cidrblock/company_inventory inventory
ansible-galaxy install -r requirements.yml -p roles
ansible-playbook -i inventory site.yml --list-host
ansible-playbook -i inventory site.yml --list-tasks
read -p "Run playbook in check mode (y/n)?" choice
case "$choice" in
  y|Y ) ansible-playbook -i inventory site.yml --check;;
  n|N ) echo "exiting";;
  * ) echo "invalid";;
esac
