#!/bin/bash
echo "Quel utilisateur doit utiliser Docker: "
read user
echo "Lancement Installation de Docker "
sleep 1
#Install Docker
curl -sSL get.docker.com | sh

usermod -aG docker $user