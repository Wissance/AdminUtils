#!/bin/sh
# This script MUST be run with sudo
########################################### VARIABLES #####################################
JAVA_VERSION="18"
JAVA_PKG="openjdk-$JAVA_VERSION-jdk"
NODE_VERSION="16.x"
NODE_URL="https://deb.nodesource.com/setup_$NODE_VERSION"
###########################################################################################
# 
echo "*************** Welcome to Wissance (https://wissance.com) pure server installation for monolith Java app ***************"
echo "###################################################################################"
# 1. Install Backend SDK Open JDK 18
echo "*************** Backend: Java Development Kit installation started"
# todo(umv): think about java version parametrization
add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install -y $JAVA_PKG
echo "*************** Backend: Java Development Kit installation finished ***************"
echo "###################################################################################"
# 2. Install NodeJs and npm
echo "*************** Frontend: NodeJS && Npm installation started ***************"
curl -fsSL $NODE_URL | sudo -E bash -
apt-get install -y nodejs
apt-get install -y npm
echo "*************** Frontend: NodeJS && Npm installation finished ***************"
echo "###################################################################################"
# 3. Install PosgtreSQL
echo "*************** DB Server: Postgresql installation started ***************"
apt-get install -y postgresql postgresql-contrib
echo "*************** DB Server: Postgresql installation finished ***************"
# 4. Install Depending services
# 4.1 Nginx
echo "*************** Reverse proxy: Postgresql installation started ***************"
apt-get install -y nginx
# 4.2 KeyCloak
wget https://github.com/keycloak/keycloak/releases/download/19.0.3/keycloak-19.0.3.tar.gz
tar -xf keycloak-19.0.3.tar.gz
# 4.3 Elasticsearch
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
apt-get update
apt-get install elasticsearch
systemctl enable elasticsearch
systemctl start elasticsearch
# 4.4 Certbot
# 5. Configure installed servers
# 5.1 PostgresSQL
echo "*************** Please don't forget to give us a STAR on github: https://github.com/Wissance/AdminUtils and FOLLOW our organization ***************"