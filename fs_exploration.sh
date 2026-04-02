cd / #changes the directory to the root directory of the filesystem.
ls -F #list files and directories, adding a symbol to show their type.
#we have both libs (normal and 64) because of compatibility
#the first thing that happens when we start a computer is the POST
#THE INITRD.ING is a file used during the boot process to temporarily load essential drivers and tools into memory before the main system starts.
# THE VMLINUZ.OLD its the backup of the Linux kernel
#FHS
#carga de firmware, the bootloader, then kernel
sudo apt update #Updates the list of available packages from the repositories.
sudo apt upgrade #Upgrades all installed packages to their latest available versions.
sudo apt install parted #Installs the parted program on your system.

#sometimes you can turn up with a dependencies hell haha
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e "\n---\n" # Lists disk partitions and filesystem information, separating the output for readability, and only proceeds if each command succeeds.
# && means 'and', and sicnce "\n---\n" will always be true, it will depend of the previos commands to be executed perfectly, both must be true 
#msdos is an old name for an MBR tablr
#a loop device acts as a disk or an store unit, we work with this when we use sessions
[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS" #The command `[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS"` checks whether the system is using UEFI or BIOS firmware. The first part `[ -d /sys/firmware/efi ]` is a test expression: `-d` verifies if a directory exists at the given path, and `/sys/firmware/efi` only exists on systems booted with UEFI, so this condition returns true if the system is running UEFI. The `&&` operator means “run the next command only if the previous one succeeds,” so if the directory exists, it executes `echo "UEFI"` and prints that to the terminal. The `||` operator means “run the next command only if the previous one fails,” so if the test does not find the directory (indicating a BIOS system), the first echo is skipped and `echo "BIOS"` runs instead. Overall, it’s a compact way to conditionally print “UEFI” or “BIOS” based on how the system was booted.
#GRUB2 es el estandar actual en Linux, cargar el Kernel de linux en la memoria RAM

cat /etc/default/grub #ONLY IN DUAL BOOTS 
boot/archivos #needes to run the S.O
#Mounting means attaching a filesystem (like a disk or USB) to a directory so you can access its files
#A file system is a method used by an operating system to organize, store, and manage data on a storage device
#en un disco magnetico se guarda info mediante magnetismo, y en un ssd se usan cargas electricas con SLC, MLC, TLC, QLC 
#fylesystem toma un conjunto de compuertas nand y forma un bloque, pero tiene una desventaja, no se puede usar medio bloque al leer. La fragmentación en el disco ocurre cuando partes de un archivo se guardan en diferentes lugares físicos del disco
#Un inode es una estructura de datos usada en Linux para guardar información sobre un archivo, es único}
# nosotros estamos estudiando el ti´po de ploque ext4

echo "mi archivo" > test.txt   # Creates a file called test.txt and writes "mi archivo" inside it (overwrites if it already exists)
ls                            # Lists all files and directories in the current folder
cat test.txt                  # Displays the content of the file test.txt in the terminal
stat test.txt                # Shows detailed metadata about the file (size, permissions, inode, timestamps, etc.)