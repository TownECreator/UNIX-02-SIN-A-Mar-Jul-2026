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

#el guionsito al inicio de -rw-rw-rw-  1 codespace root        906 Apr 16 12:23 doci_no_cifrado_firmado.txt significa que es un archivo notmal
# cuando tiene l al principio es un enlace simbólico, si entre el rwx hay algun - que reemplace a las letras mencionadas, significa que no posee dicho permiso

chmod #means change mode, it has two sintaxes, one symbolic and one numeric

touch script.sh #creates an empty file named script.sh

chmod +x script.sh #adds execute permission for all users (user, group, others)

chmod u+x script.sh #adds execute permission only for the owner (user)

touch secreto.txt #creates an empty file named secreto.txt

chmod o-r secreto.txt #removes read permission for others (public)

touch privado #creates an empty file named privado

chmod u+rw,go-rwx privado #gives read/write to owner, removes all permissions from group and others

sudo chmod +x init # init is the first process that the linux model executes, we have in the init a shell waiting to write what do we want to execute, in some cases, bash
#comprobamos q esta hecho con ls -l
Commands like
sudo echo "hola" > /etc/archivo_protegido 
#does NOT work because 'sudo' only applies to echo, not to the redirection '>'
#the '>' is handled by the shell without sudo, so it fails due to permission denied

#/etc = carpeta donde se guardan configuraciones globales del sistema y de programas

echo "hola" | sudo tee /etc/archivo_protegido #this works because tee runs with sudo and writes to the protected file

echo "hola" | sudo tee /etc/archivo_protegido > /dev/null #writes “hola” into a protected file using sudo, without showing output. If we were to erase this /dev/null, it would definitely show the info inside.

ls -l /etc/archivo_protegido or as well ls /etc #shows file details like permissions, owner, and size

cat /etc/archivo_protegido #displays the file’s content (if you have permission)

echo "hola" | sudo tee /etc/archivo_protegido #writes “hola” into a protected file using sudo and also prints “hola” on the screen
#both of these are absolute routes (cat and ls)

sudo sh -c 'echo "chao" >> /etc/archivo_protegido'  # Runs a root shell that appends "chao" to a protected file in /etc (creates it if it doesn't exist) the >> means it's appending  something

# Interactive shell: user types commands and gets immediate output (has prompt, e.g., terminal session)
# Non-interactive shell: runs commands automatically without user input (e.g., scripts, sudo sh -c)
# Kernel: core of the OS (not interactive/non-interactive)
# Folders (directories): just storage locations (not interactive/non-interactive)
#when using sudo, we need to also remember to close the session in a superuser

sudo -i # Starts an interactive root shell (logs in as root with full privileges)
exit # Exits the current shell (returns from root shell to normal user)
sudo su # Switches to the root user by starting a shell as root (uses sudo to gain superuser privileges)
sudo su -   # Switches to the root user and loads root’s full login environment (like a fresh root login shell)
echo "$HOME"   # Prints the value of the HOME environment variable (your home directory) because double quotes allow variable expansion
echo '$HOME'   # Prints the literal text "$HOME" because single quotes prevent variable expansion

echo '#!/bin/sh' > hola.sh
# echo           → command: prints text to standard output
# '#!/bin/sh'    → argument (string literal): shebang line indicating the script should use /bin/sh
# >              → redirection operator: overwrites/creates the file
# hola.sh        → filename (target file)
# RESULT         → creates hola.sh with the shebang line

echo 'echo "Hola desde mi primer script"' >> hola.sh
# echo           → command
# 'echo "Hola desde mi primer script"' → argument (string literal containing another command)
# >>             → redirection operator: appends to the file (does NOT overwrite)
# hola.sh        → filename
# RESULT         → adds a line that will print a message when the script runs

cat hola.sh
# cat            → command: displays file contents
# hola.sh        → argument (file to read)
# RESULT         → shows the script content in the terminal

./hola.sh
# ./             → path indicator: run file from current directory
# hola.sh        → executable script
# RESULT         → executes the script (if it has execute permissions), printing the message

ls -l hola.sh # Lists detailed info of hola.sh (permissions, owner, size, date)
chmod +x hola.sh # Grants execute permission so the file can be run as a script
ls -l hola.sh # Displays updated permissions (you’ll now see "x" in the permission bits)
./hola.sh # Executes the script in the current directory, running its commands