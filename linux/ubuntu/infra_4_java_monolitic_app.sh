#!/bin/bash
# IMPORTANT NOTES: If you edit in any text editor ensure that ALL lines ends witn \n (LF) NOT a \r\n (CRLF),  
# otherwise it won't work!
# This script MUST be run with sudo
# args: $1 - download install dir
# OS: Ubuntu 22.04 
########################################### VARIABLES #####################################
CURRENT_DIRECTORY=$(pwd)
JAVA_VERSION="18"
JAVA_PKG="openjdk-$JAVA_VERSION-jdk"
NODE_VERSION="16.x"
NODE_URL="https://deb.nodesource.com/setup_$NODE_VERSION"
KEYCLOAK_INSTALL_DIR=$1
KEYCLOAK_VERSION="19.0.3"
KEYCLOAK_ARCH_FILE="keycloak-$KEYCLOAK_VERSION.tar.gz"
KEYCLOAK_DOWNLOAD_URL="https://github.com/keycloak/keycloak/releases/download/$KEYCLOAK_VERSION/keycloak-$KEYCLOAK_VERSION.tar.gz"
###########################################################################################
echo "******* Welcome to Wissance (https://wissance.com) pure server installation for monolith Java app *******"
echo "###################################################################################"
# 1. Install Backend SDK Open JDK 18
echo "******* Backend: Java Development Kit installation started *******"
# todo(umv): think about java version parametrization
add-apt-repository -y ppa:openjdk-r/ppa
echo "Installing following JDK package(s): $JAVA_PKG"
apt-get update
apt-get install -y $JAVA_PKG
echo "******* Backend: Java Development Kit installation finished *******"
echo "###################################################################################"
# 2. Install NodeJs and npm
echo "******* Frontend: NodeJS && Npm installation started *******"
echo "Installing NodeJs of version: $NODE_VERSION"
curl -fsSL $NODE_URL | sudo -E bash -
apt-get install -y nodejs
apt-get install -y aptitude
# apt-get install -y npm ## cause error in ubuntu 22.04, however npm installs simultaneously with nodejs
echo "******* Frontend: NodeJS && Npm installation finished *******"
echo "###################################################################################"
# 3. Install PosgtreSQL
echo "******* DB Server: Postgresql installation started *******"
apt-get install -y postgresql postgresql-contrib
echo "******* DB Server: Postgresql installation finished *******"
# 4. Install Depending services
# 4.1 Nginx
echo "******* Reverse proxy: Nginx installation started *******"
apt-get install -y nginx
echo "******* Reverse proxy: Nginx installation finished *******"
# 4.2 KeyCloak
echo "******* Authorization Server: Keycloak installation started *******"
if [ -z "$KEYCLOAK_INSTALL_DIR" ] 
then
    KEYCLOAK_INSTALL_DIR="/usr/local/sbin/keycloak"
fi
# check is Keycloak dir exists
if [ ! -d $KEYCLOAK_INSTALL_DIR ]
then
    mkdir -p $KEYCLOAK_INSTALL_DIR
    cd $KEYCLOAK_INSTALL_DIR
    wget $KEYCLOAK_DOWNLOAD_URL
    tar -xf $KEYCLOAK_ARCH_FILE
	cd $CURRENT_DIRECTORY
else
	echo "Keycloak directory - \"$KEYCLOAK_INSTALL_DIR\" already exists, we assume that keycloak already installed"
fi
echo "******* Authorization Server: Keycloak installation finished *******"
# 4.3 Elasticsearch
echo "******* Search Engine Server: Elasticsearch installation started *******"
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
apt-get update
apt-get install elasticsearch
systemctl enable elasticsearch
systemctl start elasticsearch
echo "******* Search Engine Server: Elasticsearch installation finished *******"
# 4.4 Certbot
echo "******* SSL: Certbot installation started *******"
snap install core; snap refresh core
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
snap set certbot trust-plugin-with-root=ok
echo "******* SSL: Certbot installation finished *******"
# 5. Configure installed servers
# 5.1 PostgresSQL password 4 postgre
# 5.2 Minimal 4 kc (user, certs, & so on ....)
echo "******* Please don't forget to give us a STAR on github: https://github.com/Wissance/AdminUtils and FOLLOW our organization *******"