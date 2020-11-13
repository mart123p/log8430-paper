#!/bin/sh

# Setup the port forwarding from ssh connexion for remote server
ip=$(cat ../creds/ip)
ssh -L 6052:10.0.0.4:22 \
    -L 6053:10.0.0.5:22 \
    -L 6054:10.0.0.6:22 \
    -L 6055:10.0.0.7:22 \
    -i ../creds/ssh/id_rsa \
    azureuser@$ip
