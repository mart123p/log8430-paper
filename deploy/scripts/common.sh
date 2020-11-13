#/bin/bash

#Common script for the variables used throughout the scripts

ip=$(cat ../creds/ip)
worker=$(cat ../vars/default.yml | grep "amount_worker:" | xargs | cut -d ' ' -f2 | tr -d '\n')
port=$(cat ../vars/default.yml | grep "port_base:" | xargs | cut -d ' ' -f2 | tr -d '\n')
user=$(cat ../vars/default.yml | grep "username:" | xargs | cut -d ' ' -f2 | tr -d '\n')