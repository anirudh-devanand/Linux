#!/bin/bash

apt-get update
apt-get upgrade

apt install mysql-server

mysql -e "CREATE USER 'test'@'localhost' IDENTIFIED BY '12345';"
mysql -e "CREATE DATABASE test;"
mysql -e "GRANT ALL PRIVILEGES ON test.* TO 'test'@'localhost';" 
mysql -e "FLUSH PRIVILEGES;"
