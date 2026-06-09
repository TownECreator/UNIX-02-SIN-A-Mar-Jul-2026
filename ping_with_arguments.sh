#!/bin/bash
# This script will ping any address provided as an argument.
SCRIPT_NAME="${0}"
TARGET="${1}"
echo "Running the script ${SCRIPT_NAME}..."
echo "Pinging the target: ${TARGET}..."
ping -c 5 "${TARGET}"

#to execute it use:
#chmod u+x ping_with_arguments.sh 
#./ping_with_arguments.sh nostarch.com
#-c 5 is to ONLY ping 5 times
#the order 127.0.0.1 is in $1, and is saved in TARGET

echo "The arguments are $ @"
echo "The total number of arguments is: $#"

# Change "$@" to "$*" to observe behavior.
for args in "$@"; do
echo "${args}"
done

#!/bin/bash
# Takes input from the user and assigns it to variables
echo "What is your first name?"
read -r firstname
echo "What is your last name?"
read -r lastname
echo "Your first name is ${firstname} and your last name is ${lastname}"