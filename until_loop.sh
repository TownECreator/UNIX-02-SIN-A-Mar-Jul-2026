#!/bin/bash
FILE="outputi.txt" # Assign the name of the target file to the variable FILE
touch "${FILE}" # Create the file if it doesn't exist, or update its timestamp if it does
until [[ -s "${FILE}" ]]; do # Loop continuously UNTIL the file exists and has a size greater than 0 bytes
    echo "${FILE} is empty..." # Print a status message indicating the file currently contains no data
    echo "Checking again in 2 seconds..." # Print a notice that the script will wait before testing again
    sleep 2 # Pause execution for 2 seconds to avoid overloading the CPU
done # End of the until loop code block
echo "${FILE} appears to have some content in it!" # Print final message once the loop ends because data was detected