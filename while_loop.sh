#!/bin/bash
SIGNAL_TO_STOP_FILE="stoploop"  # Assign the string "stoploop" to the variable tracking the trigger file
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do  # Loop continuously as long as the specified file does NOT exist
    echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."  # Print status indicating the file is missing
    echo "Checking again in 2 seconds..."  # Print notice that a re-check is scheduled
    sleep 2  # Pause script execution for 2 seconds to reduce CPU consumption
done  # End of the while loop code block
echo "File was found! Exiting..."  # Print final message after the loop breaks because the file was detected

# if we want to stop the loop, we have to create the file! do this by creating a secondary terminal.