#!/bin/bash
# Setup the port forwarding from ssh connexion for remote server

ip=$(cat ../creds/ip)
worker=$(cat ../azure.yml | grep "amount_worker:" | xargs | cut -d ' ' -f2 | tr -d '\n')
port=6050
user="azureuser"


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
