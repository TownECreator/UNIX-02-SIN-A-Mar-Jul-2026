#!/bin/bash
top # Displays real-time information about running processes, CPU usage, memory usage, and system load.
top & # Runs the 'top' command in the background, allowing you to continue using the terminal while 'top' keeps running. 
kill -9 process ID # Forcefully terminates the process with the specified Process ID (PID) using the SIGKILL signal.
kill -9 7843 # Forcefully terminates the process whose PID is 7843.


touch test && touch test123
(ls; ps)
ls; ps; whoami
lzl || echo "El comando lzl ha fallado"
echo "Hola mundo" > output1.txt
cat output1.txt
echo "chao mundo" > output1.txt
echo "chao chao" >> output1.txt
cat output1.txt

ls -l / &> stdout_and_stderr.txt
cat stdout_and_stderr.txt
ls -l / &>> stdout_and_stderr.txt
ls -l / 1> stdout.txt 2> stderr.txt
lzl 2> error.txt
cat error.txt