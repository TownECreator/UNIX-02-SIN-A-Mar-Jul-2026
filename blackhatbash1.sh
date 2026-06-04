#!/bin/bash
set -x
bash --version
env
echo ${SHELL}
echo ${RANDOM}
echo ${UID}
echo ${OSTYPE}

#man ls 
#ls -l
#ls --help
#ls -a
#ls -all
ps -ef
df --human-readable
#bash -r blackhatbash1.sh
#bash -n blackhatbash1.sh
#bash -x blackhatbash1.sh

set +x