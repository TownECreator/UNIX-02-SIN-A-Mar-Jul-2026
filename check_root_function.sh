#!/bin/bash

check_if_root(){
# Declares a function named check_if_root using standard Bash syntax.

if [[ "${EUID}" -eq "0" ]]; then # Evaluates if the Effective User ID variable (EUID) is numerically equal (-eq) to 0, which represents the root user.

return 0 # Returns a shell exit status of 0 (success) if the current user running the script is root.

else # Executes this alternative block if the user's EUID is anything other than 0.

return 1 # Returns a shell exit status of 1 (failure) indicating the user is a standard, non-privileged user.

fi # Closes the conditional statement inside the function block.

} # Marks the closing boundary of the check_if_root function definition.

if check_if_root; then # Invokes the check_if_root function and evaluates its returned status as a conditional test.

echo "User is root!" # Prints a success confirmation message if the function returns a 0 exit status.

else # Handles the fallback flow if the function returns a non-zero exit code.

echo "User is not root!" # Prints an output indicating that the current runtime environment does not have root privileges.

fi # Closes the main conditional block of the script.