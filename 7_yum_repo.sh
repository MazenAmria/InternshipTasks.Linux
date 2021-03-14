#!/bin/bash

# install tmux
yum install -y tmux

# install httpd and mysql
yum install -y httpd mysql

# download the repo packages
yum install -y wget
wget -r --no-parent --mirror https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64 -P /var/www/html

# create the repo
yum install -y yum-utils createrepo
createrepo --update /var/www/html/repo.zabbix.com

# add the repo (and enable it)
yum-config-manager --add-repo http://localhost/repo.zabbix.com

# the repo config files are stored ad /etc/yum.repos.d/
# for any repo you can disable it by setting enabled=0
# alternativly you can use yum-config-manager --disable <repo>
yum-config-manager --disable {base,extras,updates}

# installing the following packages from the local repo
yum install -y zabbix zabbix-web php zabbix-server zabbix-agent
