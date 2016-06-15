#!/bin/bash
if [ -z "$1" ]
	then
		printf "No file name specified\nExecute runMe.sh [NameOfFile]\n"
		exit
fi
printf "\033[1;47m  Version 0.5 \033[1;m\n\033[1;46m  Created by Philip Kohn | https://www.philipkohn.com | @pin3c0n3  \033[1;m\n"
now=$(date +"%m%d%Y%H%M")
fileName=whoisResults_$now.txt
while read domains
do
	echo -e "\n==================\n" >> $fileName
	whois "$domains" | grep -E 'Domain Name|Domain Status|Registrant Name|Registrant Organization|Admin Name|Admin Organization|Name Server' >> $fileName
done < $1
cat $fileName | more
