#!/bin/bash

# install mariadb server and start it
yum install -y mariadb-server
systemctl start mariadb

# open the db port (3306)
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
# make changes permanent
iptables-save > /etc/sysconfig/iptables

# create the database
mysql -e "CREATE DATABASE studentdb;"

# create the user
mysql -e "CREATE USER user1@192.168.56.3 IDENTIFIED BY 'mariadb';"

# handle privileges
mysql -e "GRANT ALL PRIVILEGES ON studentdb.* TO 'user1'@'192.168.56.3';"
mysql -e "FLUSH PRIVILEGES;"
