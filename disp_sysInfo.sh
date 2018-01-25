#!/bin/bash

file="sysInfo.txt"
if [ -f "$file" ]
then
	rm $file
fi

printf "User Information:\n" > $file
id >> $file
printf "\nOS Information:\n" >> $file
cat /etc/*-release >> $file
printf "\nKernel Information:\n" >> $file
cat /proc/version >> $file
printf "\nSystem Architecture Information:\n" >> $file
lscpu >> $file
printf "\nFile System Memory Information:\n" >> $file
df -h >> $file

