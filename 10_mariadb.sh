yum install -y mariadb-server
systemctl start mariadb
systemctl enable mariadb

sudo iptables -A INPUT -p tcp --dport 3306 -j ACCEPT

mysql -e "CREATE DATABASE studentdb;"
mysql -e "CREATE USER user1@localhost IDENTIFIED BY 'mariadb';"
mysql -e "GRANT ALL PRIVILEGES ON studentdb.* TO 'user1'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

mysql -u user1 -p
# password: mariadb

# SQL part:
# CREATE TABLE student (first_name VARCHAR(50), last_name VARCHAR(50), major VARCHAR(50), expected_grad INT, student_id INT PRIMARY KEY);
# INSERT INTO student VALUE ('Allen', 'Brown', 'Mechanical', 2018, 110001);
# INSERT INTO student VALUES -add all values here-
