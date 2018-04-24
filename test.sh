#!/bin/bash 
cd /opt/ansible
. /opt/ansible/hacking/env-setup -q
cd $OLDPWD

/opt/ansible/bin/ansible-playbook -v \
    ${WORKSPACE}/play.yml \
    -i ${WORKSPACE}/inventory \
    --forks 5 --syntax-check
    
env ANSIBLE_FORCE_COLOR=1  /opt/ansible/bin/ansible-playbook -v \
    ${WORKSPACE}/play.yml \
    -i ${WORKSPACE}/inventory \
    --forks 5
    
    
/opt/ansible/bin/ansible-playbook -v \
    ${WORKSPACE}/play.yml \
    -i ${WORKSPACE}/inventory \
    --forks 5 \
    | grep -q 'changed=0.*failed=0' \
    && (echo 'Idempotence test: pass' && exit 0) \
    || (echo 'Idempotence test: fail' && exit 1)
