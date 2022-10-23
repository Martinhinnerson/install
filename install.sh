#!/bin/bash

set -e

ROOTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOSTS="$ROOTDIR/ansible/hosts"
PLAYBOOK="$ROOTDIR/ansible/playbook.yml"


function main {
    echo "Running install script"
    echo "---------------------"
    echo "Root directory: $ROOTDIR"
    echo "Hosts file: $HOSTS"
    echo "Playbook: $PLAYBOOK"
    echo "---------------------"
    if ! command -v ansible &> /dev/null
    then
        echo "Ansible could not be found"
        echo "Installing ansible"
        sudo pacman -S ansible
        echo "---------------------"
    fi
    echo "Running playbook"
    ansible-playbook -i $HOSTS $PLAYBOOK --ask-become-pass

}

main
exit 0
