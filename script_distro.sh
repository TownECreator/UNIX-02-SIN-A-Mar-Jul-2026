sudo apt update
sudo apt upgrade
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86
git clone --depth 1 https://github.com/torvalds/linux.git 
cd linux
make menuconfig