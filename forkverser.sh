#!/bin/bash
# Example:  ./reverser.sh  179.11.18.144/28

for i in $(prips $1)
do
	echo "### Checking $i ###"
	lynx -source "https://securitytrails.com/list/ip/$i"  | sed 's/","/\n/g'   | grep "hostname"  | egrep -o "(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$"| grep -v hostname.placeholder
	sleep 0.1
done
