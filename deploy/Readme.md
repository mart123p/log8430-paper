# Test infrastructre for MongoDb vs Hyperledger Fabric

## Infrastructure Deployment

This architecture can be deployed on any cloud environnement. However, there is a playbook to deploy it on the
Azure Infrastructre where most of our tests will take place.

## Kubernetes Installation

Since there is little use to have many public IP adresses for every node, a script is provided to connect to every
node and expose a port locally. This way a single IP can be used for to access and control the entire system.