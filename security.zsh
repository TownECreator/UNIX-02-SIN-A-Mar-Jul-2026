$ umask # umask sets the default permission mask that determines which file permissions are NOT granted by default when new files or directories are created
touch archivo1 # Creates an empty file named archivo1
mkdir directorio1 # Creates a directory named directorio1
ls -l # Lists files with detailed information (permissions, owner, size, date)

umask 027 # Sets default permission mask (removes write for group and all permissions for others)

touch archivo2 # Creates archivo2 using the current umask (027)
mkdir directorio2 # Creates directorio2 using the current umask

ls -l # Shows file and directory permissions to compare results

# SOLUTION (system cleanup and correction)

apt-get update # Updates the list of available packages from repositories
apt-get upgrade # Upgrades installed packages to their latest versions

chown -R $(whoami) . # Changes ownership of all files and folders in the current directory to the current user

apt-get install acl # Installs ACL tools (setfacl and getfacl) for advanced permission management

setfacl -bnR . # Removes all ACL permissions recursively from the current directory

umask 027 # Sets default permission mask again for new files and directories

touch archivo3 # Creates a new file to test updated permissions
mkdir directorio3 # Creates a new directory to test updated permissions

ls -l # Displays final permissions of all files and directories
#seach for umask problem codespaces in github

umask 077 # Sets the mask so that only the owner has permissions (Read/Write/Execute) for new items; Group and Others get nothing.
touch secreto.txt # Creates an empty file; due to umask 077, it will have permissions -rw-------.
mkdir privado # Creates a directory; due to umask 077, it will have permissions drwx------.
ls -l # Lists files in long format to verify that only the owner has access to 'secreto.txt' and 'privado'.

umask 022  # Sets default permissions so owner has full access, while group and others can only read/execute.
whoami # Displays the username of the current active user to confirm who is executing the commands.
echo "Hola" > mi_archivo # Creates (or overwrites) 'mi_archivo' with the text "Hola" inside it.
ls -l mi_archivo  # Displays the detailed permissions, owner, and group for 'mi_archivo'.
useradd -m -s /usr/bin/zsh luna # Creates user 'luna', gives her a home directory, and assigns Zsh as her default shell.
chown luna mi_archivo # Transfers ownership of 'mi_archivo' from the current user to the new user 'luna'.

groups # Lists the groups that the current user belongs to.
groupadd grupo_test # Creates a new group named 'grupo_test' (initially empty with no members).
cat /etc/group # Displays the contents of the group file to verify 'grupo_test' exists.
groups # Lists the current user's groups again to see if membership has changed.
touch comun # Creates an empty file named 'comun' using the current umask.
ls -l comun # Displays detailed permissions to check which user and group own 'comun'.

usermod -a -G grupo_test luna # Adds user 'luna' to 'grupo_test' as a secondary group (-a -G) without removing her from existing ones.
chgrp grupo_test comun # Changes the group ownership of the file 'comun' to 'grupo_test'.
ls -l comun # Displays file details to verify that 'comun' is now associated with the group 'grupo_test'.

chown luna:grupo_test mi_archivo # Simultaneously changes the owner to 'luna' and the group to 'grupo_test' for the file.
ls -l mi_archivo # Verifies the new ownership (luna) and group association (grupo_test) in the file metadata.

# The following command is used if your current user lacks permissions to access the shared group (does it ask for a passphrase?):
usermod -aG grupo_test $USER # Adds the current logged-in user to 'grupo_test' to ensure shared access without removing existing groups.

mkdir -p proyecto/sub # Creates the 'proyecto' directory and the 'sub' subdirectory simultaneously (-p ensures parent creation).
touch proyecto/readme proyecto/sub/datos  # Creates two empty files: 'readme' in the main folder and 'datos' inside the subfolder.
chown -R luna:grupo_test proyecto # Recursively (-R) changes the owner to 'luna' and the group to 'grupo_test' for the folder and all its contents.
ls -lR proyecto # Lists all files and subdirectories recursively to verify that ownership was applied to every level.

#14/5/2026
id # look the numerical identity of the current user (numerical user ID, Primary group, secondary groups)
cat /etc/passwd | head -10 # Look up all the users of the system
#cuando ejecutamos el comando de arriba, el x significa que ese usuario tiene password 
id root #looks up the identity information for the superuser account.
#In linux, the passphrases as they are are not saved, what is saved is the HASH of said passphrase (look up RainBoWtABLES AND salt)

groups # When you run this command without any arguments, it shows the groups for the current shell session.
groups $USER # The $USER part is an environment variable that holds your username. Running groups $USER tells the system: "Look at the system database (like /etc/group) and tell me every group this specific user is assigned to."