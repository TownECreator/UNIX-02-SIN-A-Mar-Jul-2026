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
