sudo apt update  
# Updates the package list from all configured repositories (refreshes information about available software and versions).

sudo apt upgrade  
# Installs the latest versions of all currently installed packages on the system.

sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86  
# Installs required development tools and libraries:
# git (version control), vim (text editor), make (build system), gcc (compiler),
# and other dependencies needed to compile and run the Linux kernel and related tools.

git clone --depth 1 https://github.com/torvalds/linux.git  
# Downloads a shallow copy (latest snapshot only) of the Linux kernel source code from the official repository.

cd linux  
# Changes the current directory into the newly downloaded Linux kernel source folder.

make menuconfig  
# Opens a text-based configuration menu to customize the Linux kernel before building it.

make -j 2  
# Compiles the Linux kernel using 2 parallel jobs (faster build using 2 CPU threads).

sudo mkdir /boot-files
sudo cp arch/x86/boot/bzImage /boot-files/
cd ..