#!/bin/bash
# Specifies the path to the Bash executable to interpret and run this script

# Assign the first positional command-line argument to the NAME variable
NAME="${1}"

# Assign the second positional command-line argument to the DOMAIN variable
DOMAIN="${2}"

# Define the destination CSV file name where the execution metrics will be saved
OUTPUT_FILE="results.csv"

# Check if the two expected arguments are set
# The -z operator evaluates to true if the given string variable length is zero (empty)
if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then
  # Print an error message informing the user about the missing parameters
  echo "You must provide two arguments to this script."
  
  # Display an explicit execution example using the script's own name ($0)
  echo "Example: ${0} mysite nostarch.com"
  
  # Exit the script immediately with a failure status code of 1
  exit 1
# End of the conditional verification block
fi

# Write CSV header to the file
# The single redirection operator (>) creates or overwrites the file with the column headers
echo "status,name,domain,timestamp" > ${OUTPUT_FILE}

# Execute a network connectivity test using a single ICMP packet (-c 1)
# Both standard output and standard error are redirected (&>) to /dev/null to silence the console
if ping -c 1 "${DOMAIN}" &> /dev/null; then
  # If the ping command succeeds (exit code 0), log a 'success' record into the CSV file
  # The double redirection operator (>>) appends the new entry without erasing previous data
  echo "success,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
else
  # If the ping command fails (non-zero exit code), log a 'failure' record into the CSV file
  echo "failure,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
# End of the conditional ping check statement
fi