#!/bin/bash

# Remove any old entry for the local port to avoid any issue. The main SSH
# connection is still protected against mitm attacks. But local connections are
# usually new VMs in a trusted network. There is little worry about.

source common.sh

echo "$worker Worker deployment detected"
echo "Removing ssh key entries"
echo
for ((i=2; i < $(( 2 + $worker)); i++))
do
    host1="127.0.0.1:$(( $port + $i ))"
    host2="localhost:$(( $port + $i ))"
    echo "Cleaning up $host1 & $host2"
    
    ssh-keygen -R "$host1"
    ssh-keygen -R "$host2"

done
echo 
echo "Cleanup complete!"