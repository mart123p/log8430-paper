#!/bin/bash
# Setup the port forwarding from ssh connexion for remote server

source common.sh

test_vm=$(cat ../vars/default.yml | grep "test_vm:" | xargs | cut -d ' ' -f2 | tr -d '\n' | awk '{print tolower($0)}')

echo "$worker Worker deployment detected"
workerCount=$(( $worker + 1 ))

if $test_vm; then
    echo "Test VM detected"
    workerCount=$(( $worker + 1 ))
fi

command="ssh"
for ((i=2; i < $(( 2 + $workerCount)); i++))
do
    command="${command} -L $(( $port + $i )):10.0.0.$(( $i + 2 )):22"
done
command="${command} -i ../creds/ssh/id_rsa $user@$ip"
echo "Connecting to Bastion"
echo $command

eval $command
