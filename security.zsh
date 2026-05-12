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
chown luna mi_archivo feat: initialize user account 'luna' and configure file ownership

- Set system umask to 022 for standard directory/file permissions
- Provision new system user 'luna' with Zsh as the default shell
- Create 'mi_archivo' and transfer ownership to user 'luna'
- Verify environment state via whoami and long-format file listing# Transfers ownership of 'mi_archivo' from the current user to the new user 'luna'.