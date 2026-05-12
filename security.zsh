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