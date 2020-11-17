#!/bin/bash
# Setup the port forwarding from ssh connexion for remote server

source common.sh

echo "$worker Worker deployment detected"

command="ssh"
for ((i=1; i <= $(( $worker)); i++))
do
    command="${command} -L $(( $port + $i -1 )):10.0.0.$(( $i + 3 )):22"
done

for ((i=1; i <= $(( $test )); i++))
do
    command="${command} -L $(( $port + 49 + $i )):10.0.0.$(( $i + 49 )):22"
done

if [[ $monitor -eq 1 ]]; then
    command="${command} -L $(( $port + 205 )):10.0.0.$(( 205 )):22"
fi

command="${command} -i ../creds/ssh/id_rsa $user@$ip"



echo "Connecting to Bastion"
echo $command

eval $command
