#!/bin/sh

# Remove any old entry for the local port to avoid any issue. The main SSH
# connection is still protected against mitm attacks. But local connections are
# usually new VMs in a trusted network. There is little worry about.

ssh-keygen -R "127.0.0.1:6051"
ssh-keygen -R "127.0.0.1:6052"
ssh-keygen -R "127.0.0.1:6053"
ssh-keygen -R "127.0.0.1:6054"