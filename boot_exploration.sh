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

ls --help #displays a quick summary of ls command options and usage in the terminal

man ls #opens the full manual page for ls with detailed documentation (navigation with N for fast rewind, n for fast foward, exit with 'q', search with '/')

man git #opens the main Git manual page with an overview of the system, common commands, and general usage (press 'q' to exit)

man git-clone #opens the manual page for the git clone command, showing detailed usage, options, and examples (press 'q' to exit)

--depth # Create a shallow clone with a history truncated to the specified number of commits. Implies --single-branch unless --no-single-branch is given to fetch the histories near the tips of all branches. If you want to clone submodules shallowly, also pass --shallow-submodules.
    #it creates a shallow copy because with depth, we can choose some commits to copy from