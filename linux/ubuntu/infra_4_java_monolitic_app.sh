#!/bin/bash
# IMPORTANT NOTES: If you edit in any text editor ensure that ALL lines ends witn \n (LF) NOT a \r\n (CRLF),  
# otherwise it won't work!
# This script MUST be run with sudo
# args: $1 - download install dir or if missing default to /usr/local/sbin/keycloak
# OS: Ubuntu 22.04 
########################################### VARIABLES #####################################
# Variables that are responsible for colored output
NOCOLOR='\033[0m'
YELLOW='\033[33;1m'
YELLOW_UNDERLINED='\033[33;4;1m'
CYAN='\033[36;1m'
MAGENTA='\033[35;1m'
GREEN='\x1b[32;1m'
# Variables that are responsible for packages installation
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
echo "${YELLOW}******* Welcome to Wissance (https://wissance.com) pure server installation for monolith Java app *******${NOCOLOR}"
echo "###################################################################################"
# 1. Install Backend SDK Open JDK 18
echo "${CYAN}******* Backend: Java Development Kit installation started *******${NOCOLOR}"
# todo(umv): think about java version parametrization
add-apt-repository -y ppa:openjdk-r/ppa
echo "${MAGENTA}Installing following JDK package(s): $JAVA_PKG ${NOCOLOR}"
apt-get update
apt-get install -y $JAVA_PKG
echo "${CYAN}******* Backend: Java Development Kit installation finished *******${NOCOLOR}"
echo "###################################################################################"
# 2. Install NodeJs and npm
echo "${CYAN}******* Frontend: NodeJS && Npm installation started *******${NOCOLOR}"
echo "${MAGENTA}Installing NodeJs of version: $NODE_VERSION ${NOCOLOR}"
curl -fsSL $NODE_URL | sudo -E bash -
apt-get install -y nodejs
apt-get install -y aptitude
# apt-get install -y npm ## cause error in ubuntu 22.04, however npm installs simultaneously with nodejs
echo "${CYAN}******* Frontend: NodeJS && Npm installation finished *******${NOCOLOR}"
echo "###################################################################################"
# 3. Install PosgtreSQL
echo "${CYAN}******* DB Server: Postgresql installation started *******${NOCOLOR}"
apt-get install -y postgresql postgresql-contrib
systemctl enable postgresql
systemctl start postgresql
echo "${CYAN}******* DB Server: Postgresql installation finished *******${NOCOLOR}"
echo "###################################################################################"
# 4. Install Depending services
# 4.1 Nginx
echo "******* Reverse proxy: Nginx installation started *******${NOCOLOR}"
apt-get install -y nginx
echo "${CYAN}******* Reverse proxy: Nginx installation finished *******${NOCOLOR}"
echo "###################################################################################"
# 4.2 KeyCloak
echo "${CYAN}******* Authorization Server: Keycloak installation started *******${NOCOLOR}"
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
	echo "${GREEN}Keycloak directory - \"$KEYCLOAK_INSTALL_DIR\" already exists, we assume that keycloak already installed.${NOCOLOR}"
fi
echo "${CYAN}******* Authorization Server: Keycloak installation finished *******${NOCOLOR}"
echo "###################################################################################"
# 4.3 Elasticsearch
echo "******* Search Engine Server: Elasticsearch installation started *******"
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elastic.gpg
echo "deb [signed-by=/usr/share/keyrings/elastic.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
apt-get update
apt-get install elasticsearch
systemctl enable elasticsearch
systemctl start elasticsearch
echo "${CYAN}******* Search Engine Server: Elasticsearch installation finished *******${NOCOLOR}"
echo "###################################################################################"
# 4.4 Certbot
echo "${CYAN}******* SSL: Certbot installation started *******${NOCOLOR}"
snap install core; snap refresh core
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
snap set certbot trust-plugin-with-root=ok
echo "${CYAN}******* SSL: Certbot installation finished *******${NOCOLOR}"
echo "###################################################################################"
# 5. Configure installed servers
# 5.1 PostgresSQL password 4 postgre
# 5.2 Minimal 4 kc (user, certs, & so on ....)
echo "${YELLOW}******* Please don't forget to give us a ${YELLOW_UNDERLINED} STAR on github: https://github.com/Wissance/AdminUtils ${NOCOLOR}${YELLOW} and FOLLOW our organization *******${NOCOLOR}"
