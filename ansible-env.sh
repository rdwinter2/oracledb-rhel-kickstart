#!/bin/bash -ex
cd /opt/ansible
. /opt/ansible/hacking/env-setup -q
export ANSIBLE_HOME=/opt/ansible
#export PYTHONPATH=$PYTHONPATH:/opt/ansible/lib/ansible
cd $OLDPWD
python --version
ansible --version
python -c 'import sys; print sys.path'
