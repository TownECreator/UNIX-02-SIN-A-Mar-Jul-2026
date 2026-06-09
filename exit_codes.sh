#!/bin/bash
# Experimenting with exit codes24 Chapter 1
ls -l > /dev/null
echo "The exit code of the ls command was: $?"
lzl 2> /dev/null
echo "The exit code of the non-existing lzl command was: $?"

ls
exit 223
echo "The exit code of 223 is: $?" #for this towork, we have to put it directly in the terminal