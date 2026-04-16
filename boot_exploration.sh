ls -a #shows all files, includding hidden ones (those starting with .)

ls --all #Does the same as -a, it's just the long form version of the flag

ls -l #Displays files in long format (permissions, owner, size, date, filename, etc)

ls -h #shows the file sizes in human-readable format

ls -l -a -h #combines everything the previous ls do

ls -lah #Same as above, just the short combined version of the flags

mkdir -- -rf 
# -- tells the command to stop parsing options (flags)
# -rf is treated as a literal name, not as flags
# this creates a directory named "-rf"

rm -rf #forcefully and recursively deletes files and directories without confirmation (very dangerous) usually it does not work with directories with '-' 

rmdir -- -rf #removes an empty directory named "-rf" by using -- to stop option parsing, it works with direcories starting with '-'