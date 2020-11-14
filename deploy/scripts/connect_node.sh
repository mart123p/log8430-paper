#!/bin/bash
# Setup the port forwarding from ssh connexion for remote server

source common.sh

ssh -i ../creds/ssh/id_rsa \
    -o StrictHostKeyChecking=no \
    -p $(( $port + $1 )) \
    $user@localhost