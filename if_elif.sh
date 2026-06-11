#!/bin/bash

USER_INPUT="watajaiji_dir" # Assigns the first positional argument passed to the script to the variable named USER_INPUT.

mkdir -p "${USER_INPUT}" 

if [[ -z "${USER_INPUT}" ]]; then # Checks if the USER_INPUT variable is empty or null.

echo "You must provide an argument!" # Prints an error message to the terminal stating that an argument is required.

exit 1 # Terminates the script immediately with a non-zero exit status, indicating an error occurred.

fi # Closes the first if statement block.

if [[ -f "${USER_INPUT}" ]]; then # Checks if the path stored in USER_INPUT exists and is a regular file.

echo "${USER_INPUT} is a file." # Prints a message confirming that the input is a regular file.

elif [[ -d "${USER_INPUT}" ]]; then # Alternative condition that checks if the path stored in USER_INPUT exists and is a directory.

echo "${USER_INPUT} is a directory." # Prints a message confirming that the input is a directory.

else # Catches any other case where the input path is neither a regular file nor a directory (or doesn't exist).

echo "${USER_INPUT} is not a file or a directory." # Prints a message indicating the input does not match a standard file or directory.

fi # Closes the second conditional block.