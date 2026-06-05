#!/bin/bash
top # Displays real-time information about running processes, CPU usage, memory usage, and system load.
top & # Runs the 'top' command in the background, allowing you to continue using the terminal while 'top' keeps running. 
kill -9 process ID # Forcefully terminates the process with the specified Process ID (PID) using the SIGKILL signal.
kill -9 7843 # Forcefully terminates the process whose PID is 7843.