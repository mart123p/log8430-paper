#!/bin/bash
# Setup the port forwarding from ssh connexion for remote server

source common.sh

echo "$worker Worker deployment detected"

command="ssh"
for ((i=2; i < $(( 2 + $worker)); i++))
do
    command="${command} -L $(( $port + $i )):10.0.0.$(( $i + 2 )):22"
done
command="${command} -i ../creds/ssh/id_rsa $user@$ip"
echo "Connecting to Bastion"
echo $command

eval $command
