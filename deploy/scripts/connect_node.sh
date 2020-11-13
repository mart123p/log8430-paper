#!/bin/sh

# Setup the port forwarding from ssh connexion for remote server
ssh -i ../creds/ssh/id_rsa \
    -p 605$1 \
    azureuser@localhost