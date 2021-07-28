#!/bin/bash

echo "Lancement Installation de Docker "
sleep 1

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key   fingerprint   0EBFCD88

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update

#Installation de docker et docker-compose
apt install docker-ce docker-ce-cli containerd.io

curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose