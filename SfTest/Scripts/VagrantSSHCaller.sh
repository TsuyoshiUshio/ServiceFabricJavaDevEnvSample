#!/bin/bash
set -x
if [ $# -eq 0 ]; then
    echo "No script to run"
    exit
fi
scriptToRun=$1
parameter=$2
PATH=$PATH:/usr/local/bin
vagrant ssh  -c "cd /vagrant/SfTest;/bin/bash $scriptToRun $parameter" 