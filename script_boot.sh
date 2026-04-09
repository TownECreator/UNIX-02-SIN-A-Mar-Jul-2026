git checkout branch name #is used to switch to another branch in your Git repository.
#An absolute route (or absolute path) is the full path to a file or directory starting from the root of the file system, no matter where you currently are.
#A relative path (or relative route) is a path that is defined based on your current location (current directory), not from the root.
mkdir proyecto # Creates a new directory (folder) named "proyecto"
ls # Lists the files and directories in the current folder
cd proyecto/ # Moves into the "proyecto" directory
cd .. # Goes up one level to the parent directory
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto # Moves to this directory using an absolute path (from the root)
cd #change directory to home directory
pwd # Prints the current working directory (shows where you are)
cd / # Changes directory to the root folder (/) 
#it does not matter what directory you are in, if u put cd it will move you into that
cd /workspaces/   # Changes directory to the /workspaces folder using an absolute path
# this ~ identifies the home directory
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/   # Changes directory to this specific project folder using an absolute path
cd /home/codespace/   # Changes directory to the codespace user's home directory using an absolute path
#Environment variables are values stored in the operating system that programs can use to configure their behavior.
#the most basic thing you can do is write something in one archive and make another one read it
echo $HOME   # Prints the user's home directory path (environment variable)
echo $BASH   # Prints the path to the Bash shell executable
echo $PATH   # Prints the list of directories where the system looks for executable commands
cd /usr/local   # Changes directory to /usr/local, a system folder where locally installed software is stored
ls -lai  or ls -l -a -i # Lists all files (including hidden ones) in long format, shows inode numbers, and displays detailed info like permissions, owner, size, and modification date
man ls   # Opens the manual page for the "ls" command, showing detailed documentation, options, and usage examples
ls --all   # Lists all files in the directory, including hidden files (those starting with .) these directories are hard links
cd /workspaces   # Changes directory to the /workspaces folder
cd /bin          # Changes directory to /bin, which contains essential system binaries (commands)
ls -a            # Lists all files, including hidden files (starting with .)
ls -all          # Same idea as detailed listing; in most systems this is equivalent to "ls -l -a" or may not be valid as a separate option (correct form is usually "ls -la")
# . means actual directory, while .. represents the parent directory
# drwxr-xr-x directory read, write, execute, meaning the owner has these permissions. drwxr is the user that creates the directory, and u can identenitfy the user that creater that right after the hard link umber 

total 8
1572986 drwxrwxrwx+ 2 codespace codespace 4096 Apr  9 12:19 .
1572874 drwxrwxrwx+ 5 codespace root      4096 Apr  9 12:19 ..
# 1572986 and 1572874 are the inode number, unique IDs of this directory in the filesystem,
# the d means directory, and the rest of the letters here splin into groups:
#rwx (owner) → read, write, execute
#rwx (group) → read, write, execute
#rwx (others) → read, write, execute
#+ → there are extra ACL permissions (advanced access control rules)
#the 2 and 5 meand the number of hard links in this inode, codespace is the group  owner, 4096 is the size in bytes for the directory, and the date eans the last modification made.

