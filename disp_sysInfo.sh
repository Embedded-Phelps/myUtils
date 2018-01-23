file="sysInfo.txt"
if [ -f "$file" ]
then
	rm $file
fi

printf "%s%s\n" "Username=" $(id -u -n) > $file

printf "%s\n" $(cat /etc/*-release | grep -i "DISTRIB_ID") >> $file

printf "%s\n" $(cat /etc/*-release | grep -i "VERSION_ID") >> $file

printf "%s " $(cat /proc/version | grep -i "version") >> $file

printf "\n%s" $(lscpu | grep -i "Architecture") >> $file
