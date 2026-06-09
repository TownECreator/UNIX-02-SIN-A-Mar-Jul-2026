#!/bin/bash
# This line is the shebang; it tells the OS to run this script using the Bash interpreter.

# Assign the first and second terminal arguments to descriptive variables
FIRST_NAME="${1}"
LAST_NAME="${2}"

# Create the file named output.txt (or update its timestamp if it already exists)
touch output.txt

# Write the current date in DD-MM-YYYY format and append (>>) it to output.txt
# Note: %d is day, %m is month, and %Y is the 4-digit year.
date +"%d-%m-%Y" >> output.txt

# Append the user's first and last name as a new line at the bottom of output.txt
echo "${FIRST_NAME} ${LAST_NAME}" >> output.txt

# Copy (cp) the entire contents of output.txt into a new replica file named backup.txt
cp output.txt backup.txt

# Print (concatenate) the final contents of output.txt directly to the terminal screen
cat output.txt