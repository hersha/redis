#!/bin/bash

set -e

kind=${1:-server}

cd /etc/ansible/roles/role

ansible-playbook -i tests/inventory tests/test-${kind}.yml --syntax-check
ansible-playbook -i tests/inventory tests/test-${kind}.yml --connection=local --sudo
ansible-playbook -i tests/inventory tests/test-${kind}.yml --connection=local --sudo \
      | grep -q 'changed=0.*failed=0' \
      && (echo 'Idempotence test: pass' && exit 0) \
      || (echo 'Idempotence test: fail' && exit 1)
