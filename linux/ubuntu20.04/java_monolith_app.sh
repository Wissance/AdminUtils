#!/bin/sh
JAVA_VERSION="18"
JAVA_PKG="openjdk-$JAVA_VERSION-jdk"
NODE_VERSION="16.x"
NODE_URL="https://deb.nodesource.com/setup_$NODE_VERSION"
# This script should be run with sudo
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