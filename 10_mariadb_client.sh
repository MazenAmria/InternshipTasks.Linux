#!/bin/bash

# install mariadb and start it
yum install -y mariadb
systemctl start mariadb

# connect to the server with the created user
mysql -h 192.168.56.2 -u user1 -p
# password: mariadb

# You'll be given a CLI for the mariadb, you can write SQL inside:
# CREATE TABLE student (first_name VARCHAR(50), last_name VARCHAR(50), major VARCHAR(50), expected_grad INT, student_id INT PRIMARY KEY);
# INSERT INTO student VALUE ('Allen', 'Brown', 'Mechanical', 2018, 110001);
# INSERT INTO student VALUES -add all values here-
