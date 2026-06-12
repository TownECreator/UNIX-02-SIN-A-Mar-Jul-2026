#!/bin/bash
for ip_address in "$@"; do  # Loop through each argument (IP address) passed to the script line-by-line
    echo "Taking some action on IP address ${ip_address}"  # Print a status message showing the current IP being processed
    ping -c 1 "${ip_address}"  # Send exactly 1 ICMP packet to the target IP to test local connectivity
done  # End of the for loop code block


#the ips used are:127.0.0.1 0.0.0.0 172.17.0.1