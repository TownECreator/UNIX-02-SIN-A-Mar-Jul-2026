#!/bin/bash
IP_ADDRESS="${1}"  # Capture the first command-line argument passed to the script and store it in a variable
case ${IP_ADDRESS} in  # Begin the case conditional block to evaluate the value stored in IP_ADDRESS
192.168.*)  # Check if the string starts with "192.168." followed by any characters (wildcard *)
echo "Network is 192.168.x.x"  # Print a message if the IP address matches the 192.168 prefix pattern
;;  # Terminate this specific case option block (acting like a break statement)
10.0.*)  # Check if the string starts with "10.0." followed by any characters (wildcard *)
echo "Network is 10.0.x.x"  # Print a message if the IP address matches the 10.0 prefix pattern
;;  # Terminate this specific case option block
*)  # Catch-all wildcard pattern that matches absolutely anything else if previous checks fail
echo "Could not identify the network"  #Print a fallback error message when no known prefix matches
;;  # Terminate the catch-all option block
esac  # Close the case conditional block ("case" spelled backwards)

# to test this, I used the 192.168.holaaaa