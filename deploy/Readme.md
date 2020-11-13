# Test infrastructre for MongoDb vs Hyperledger Fabric

## Infrastructure Deployment

This architecture can be deployed on any cloud environnement. However, there is a playbook to deploy it on the
Azure Infrastructre where most of our tests will take place. In order to make sure to have the correct version
of the ansible modules. A docker-compose.yml is provided to help you have a working ansible version. To deploy

1. Execute the deployment container `docker-compose run ansible`
2. You will see a shell. You can connect to azure with the command `az login` inside the container.
3. Run the playbook azure.yml This will deploy the infrastructure in Azure `ansible-playbook azure.yml`
4. The playbook will save the IP address in the `creds` folder as a file.

## Kubernetes Installation

Since there is little use to have many public IP adresses for every node, a script is provided to connect to every
node and expose a port locally. This way a single IP can be used for to access and control the entire system.

1. Connect to the cluster with the script `scripts/connect.sh`
2. Install Docker and Kubernetes on the cluster `ansible-playbook cluster-install.yml`
3. Configure the cluster `ansible-playbook cluster-config.yml`

Kubernetes is now installed on the cluster