yum install -y mariadb-server
systemctl start mariadb

iptables -A INPUT -p tcp --dport 3306 -j ACCEPT

mysql -e "CREATE DATABASE studentdb;"
mysql -e "CREATE USER user1@localhost IDENTIFIED BY 'mariadb';"
mysql -e "GRANT ALL PRIVILEGES ON studentdb.* TO 'user1'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
