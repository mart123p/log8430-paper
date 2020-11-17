#/bin/bash

#Common script for the variables used throughout the scripts

ip=$(cat ../creds/ip)

worker=$(cat ../vars/default.yml | grep "worker:" -A 1 | grep "count" | xargs | cut -d ' ' -f2 | tr -d '\n')
test=$(cat ../vars/default.yml | grep "test:" -A 1 | grep "count" | xargs | cut -d ' ' -f2 | tr -d '\n')
master=$(cat ../vars/default.yml | grep "master:" -A 1 | grep "count" | xargs | cut -d ' ' -f2 | tr -d '\n')
monitor=$(cat ../vars/default.yml | grep "monitor:" -A 1 | grep "count" | xargs | cut -d ' ' -f2 | tr -d '\n')

port=$(cat ../vars/default.yml | grep "port_base:" | xargs | cut -d ' ' -f2 | tr -d '\n')
user=$(cat ../vars/default.yml | grep "username:" | xargs | cut -d ' ' -f2 | tr -d '\n')