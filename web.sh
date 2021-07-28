#!/bin/bash

echo "Installation des paquets requies pour debian buster"

cd /tmp
sudo apt-get install -y apt-transport-https wget curl gnupg2 ca-certificates lsb-release
#Nginx
sudo wget https://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key
sudo echo "deb https://nginx.org/packages/debian/ buster nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
sudo echo "deb-src https://nginx.org/packages/debian/ buster nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
sudo apt-get update
sudo apt-get install -y nginx

#Certbot
echo "Installation de Certbot"
sleep 2
sudo apt-get -y install certbot python-certbot-nginx

#PHP-FPM 8.0
echo "Installation de PHP et ces addons"
sleep 3
wget https://packages.sury.org/php/apt.gpg
sudo apt-key add apt.gpg
echo "deb https://packages.sury.org/php/ buster main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt-get update
sudo apt-get -y install php8.0 php8.0-fpm php8.0-mysql php8.0-cli php8.0-json php8.0-curl php8.0-zip

echo "Installation de MariaDB"
sleep 3
sudo apt-get install mariadb-server mariadb-client
sudo mysql_secure_installation

echo -e "-----Fin de l'installation------ \nNe pas oublier de modifier l'user nginx ainsi que vérifier le PATH et le socket FPM"

