#!/bin/bash

file="env_setup.log"
if [ -f "$file" ]
then
	rm $file
fi

sudo apt-get update

# Install packages to setup the development environment

## Install apt-show-versions
echo "Checking apt-show-versions ..."
if [ $(apt-cache policy apt-show-versions | grep "Installed" | awk '{ print $2 }') = "(none)" ]
then
  echo "Installing apt-show-versions..."
	sudo apt-get install apt-show-versions
else
	echo "apt-show-versions is already installed in the system."
fi
printf "%s %s %s %s\n" "[INSTALLED]  apt-show-versions  | " $(apt-show-versions apt-show-versions | awk 'NR==1') >> $file

## Install an editor (to be added)

## Install git
echo "Checking git ..."
if [ $(apt-cache policy git | grep "Installed" | awk '{ print $2 }') = "(none)" ]
then
	echo "Installing Git..."
	sudo apt-get install git
else
	echo "Git is already installed in the system."
fi
printf "%s %s %s %s\n" "[INSTALLED]  git  | " $(apt-show-versions git | awk 'NR==1') >> $file

## Install ARM Linux compilers (to be added)

## install libelf-del (required for building kernel)
echo "Checking libelf-dev..."
if [ $(apt-cache policy libelf-dev | grep "Installed" | awk '{ print $2 }') = "(none)" ]
then
  echo "Installing libelf-dev..."
	sudo apt-get install libelf-dev
else
	echo "libelf-dev is already installed in the system."
fi
printf "%s %s %s %s\n" "[INSTALLED]  libelf-dev  | " $(apt-show-versions libelf-dev | awk 'NR==1') >> $file

## Install OpenSSL development package (required for building kernel)
echo "Checking libssl-dev..."
if [ $(apt-cache policy libssl-dev | grep "Installed" | awk '{ print $2 }') = "(none)" ]
then
  echo "Installing libssl-dev..."
	sudo apt-get install libssl-dev
else
	echo "libssl-dev is already installed in the syste.m"
fi
printf "%s %s %s %s\n" "[INSTALLED]  libssl-dev  | " $(apt-show-versions libssl-dev | awk 'NR==1') >> $file


# Install my own utility scripts
echo "Installing my utility scripts..."
cd ~
git clone https://github.com/Embedded-Phelps/myUtils.git
## Note that the scripts in the repo are already executable
echo "export PATH=$PATH:$HOME/myUtils/" >> ~/.bashrc
source ~/.bashrc

echo "Environment setup completed. Please reopen the terminal for the changes to take effects."
