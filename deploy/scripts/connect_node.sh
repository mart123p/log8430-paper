#!/bin/bash

# Setup the port forwarding from ssh connexion for remote server
ssh -i ../creds/ssh/id_rsa \
    -p $(( 6050 + $1 )) \
    azureuser@localhost