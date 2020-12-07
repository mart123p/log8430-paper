## Run caliper

Requis
* npm
* git
* curl
* docker
* docker-compose

Clone le repo de benchmark
```bash
git clone https://github.com/hyperledger/caliper-benchmarks.git
```

Cd dans le repo
```bash
cd caliper-benchmarks/
```

On doit utiliser la même release des benchmarks que la version de caliper téléchargé. On doit donc checkout sur le tag voulu.

```bash
git checkout v0.4.0
```

Configurer npm et intaller caliper (on peut utiliser docker à la place). **On doit prendre la même version que le tag du git**
```bash
npm init -y
npm install --only=prod @hyperledger/caliper-cli@0.4.0
```

Ensuite on doit bind caliper à un sdk pour qu'il sache quel type de database blockchain utiliser.
Bizarrement certaines versions ne marche pas pour fabric (ex: 1.4.0)
```bash
npx caliper bind --caliper-bind-sut fabric:1.4.11
```

Avant de pouvoir lancer les benchmarks ont doit générer la configuration pour certains networks.
On peut lancer le script generate pour tous les types de configuration. **Dans mon cas config_solo** ne marchait pas.
```bash
cd /networks/fabric/config_raft/
./generate.sh
cd /networks/fabric/config_kafka/
./generate.sh
...
```

On peut essayer de lancer les benchmarks par la suite.
* --caliper-workspace doit pointer vers le dossier *caliper/benchmark*
* --caliper-benchconfig doit pointer vers les scénarios de tests à effectuer
* --caliper-networkconfig doit pointer vers le type de network à tester

```bash
npx caliper launch manager \
    --caliper-workspace . \
    --caliper-benchconfig benchmarks/samples/fabric/marbles/config.yaml \
    --caliper-networkconfig networks/fabric/v1/v1.4.0/2org1peergoleveldb_kafka/fabric-go.yaml
```

Si caliper chiale en raison d'un tag latest qui n'est plus disponible une des solutions est de changer le tag de l'image manuellement:

```bash
docker pull hyperledger/fabric-ccenv:1.4.x
docker tag hyperledger/fabric-ccenv:1.4.x hyperledger/fabric-ccenv:latest

```

ou en utilisant une variable d'environnement (semblait pas marcher):

https://stackoverflow.com/questions/62860545/instantiation-of-chaincode-using-fabric-node-sdk-gives-api-error-404-manifest
