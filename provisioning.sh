#!/bin/bash

#update repo lists
echo "apt-get update"
apt-get update
#upgrade all the things
echo "apt-get upgrade -y"
apt-get upgrade -y
#install dependencies
echo "apt-get install -y apache2 git mysql"
apt-get install -y apache2 git mysql-server mysql-client
#get respond
#echo "git clone https://github.com/madoublet/respond.git /var/www/html"
#git clone https://github.com/madoublet/respond.git /var/www/html

