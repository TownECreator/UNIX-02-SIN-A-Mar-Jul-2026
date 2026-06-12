#!/bin/bash
for file in example_file*; do  # Loop through all files in the current folder matching the pattern "example_file*"
    if [[ "${file}" == "example_file1" ]]; then  # Check if the current file name is exactly "example_file1"
        echo "Skipping the first file"  # Print a message indicating that this specific file is being skipped
        continue  # Skip the remaining commands in this loop iteration and immediately jump to the next file
    fi  # End of the if condition block
    echo "${RANDOM}" > "${file}"  # Generate a random integer and overwrite the current file's contents with it
done  # End of the for loop code block