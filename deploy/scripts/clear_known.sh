#!/bin/bash

# Remove any old entry for the local port to avoid any issue. The main SSH
# connection is still protected against mitm attacks. But local connections are
# usually new VMs in a trusted network. There is little worry about.

ip=$(cat ../creds/ip)
worker=$(cat ../azure.yml | grep "amount_worker:" | xargs | cut -d ' ' -f2 | tr -d '\n')
port=6050
user="azureuser"

echo "$worker Worker deployment detected"
echo "Removing ssh key entries"
echo
for ((i=2; i < $(( 2 + $worker)); i++))
do
    host="127.0.0.1:$(( $port + $i ))"
    echo "Cleaning up $host"
    ssh-keygen -R "$host"
done
echo 
echo "Cleanup complete!"