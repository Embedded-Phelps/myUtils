#!/bin/bash

cd /usr/src/

# Download the kernel source files
sudo wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.13.tar.xz

# Unzip the kernel files
sudo tar -xvJf linux-4.14.13.tar.xz

cd linux-4.14.13/

# Open the kernel config menu for build configuration
sudo make menuconfig

# Compile the kernel
sudo make -j 4

# Compile the modules
sudo make modules

# Install the modules
sudo make module_install

# Install the kernel
sudo make install

# Update grub
sudo update-grub2

# Reboot the system
sudo systemctl reboot
