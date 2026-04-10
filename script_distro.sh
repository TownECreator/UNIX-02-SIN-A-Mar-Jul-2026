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
# Creates the /boot-files directory in the root filesystem with administrator privileges

sudo cp arch/x86/boot/bzImage /boot-files/
# Copies the compiled kernel (bzImage) from its location into the /boot-files directory

cd ..
# Moves one directory up (goes back to the parent directory, exiting /linux)

git clone --depth 1 https://git.busybox.net/busybox
# Clones a shallow copy (latest version only) of the BusyBox source code

cd busybox
# Enters the BusyBox source directory

make menuconfig
# Opens a configuration menu to select BusyBox features

make -j 2
# Compiles BusyBox using 2 parallel jobs

sudo mkdir /boot-files/initramfs
# Creates the directory that will act as the initramfs root filesystem

sudo make CONFIG_PREFIX=/boot-files/initramfs install
# Installs BusyBox into the initramfs directory structure

cd /boot-files/initramfs
# Moves into the initramfs directory

sudo vi init
# Creates or edits the init file (first program executed by the kernel)

#! /bin/sh
/bin/sh
# Minimal init script that launches a shell

sudo rm linuxrc
# Removes the default linuxrc file to avoid conflicts

sudo chmod +x init
# Makes the init script executable

sudo sh -c "find . | cpio -o -H newc > ../init.cpio"
# Creates the initramfs archive (init.cpio) from current directory

cd
# Returns to the home directory

sudo su
# Switches to root user

dd if=/dev/zero of=boot bs=1M count=50
# Creates a 50MB empty file to be used as a virtual disk

mkfs -t fat boot
# Formats the file as a FAT filesystem

syslinux boot
# Installs the Syslinux bootloader into the disk image

mkdir m
# Creates a mount point directory

mount boot m
# Mounts the disk image into directory m

cp bzImage init.cpio m
# Copies the kernel and initramfs into the mounted disk

umount m
# Unmounts the disk image

qemu-system-x86_64 -nographic -append "console=ttyS0" \
-kernel bzImage -initrd init.cpio -drive file=boot,format=raw
# Starts QEMU without GUI, using serial console, loading kernel and initramfs