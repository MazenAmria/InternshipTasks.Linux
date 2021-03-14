#!/bin/bash

# install tmux
yum install -y tmux

# install httpd and mysql
yum install -y httpd mysql

# download the repo packages
yum install -y wget
wget -N -r --no-parent --mirror https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64/ -P /var/www/html

# create the repo
yum install -y yum-utils createrepo
createrepo --update /var/www/html/repo.zabbix.com/

# add the repo (and enable it)
yum-config-manager --add-repo http://localhost/repo.zabbix.com/

# download GPG keys to /etc/pki/rpm-gpg
wget -N -r -l1 -nd https://repo.zabbix.com/ -P /etc/pki/rpm-gpg/

# import the GPG keys
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX*

# cleaning the cache
yum clean all

# the repo config files are stored ad /etc/yum.repos.d/
# for any repo you can disable it by setting enabled=0
# alternativly you can use yum-config-manager --disable <repo>

# installing the following packages from the local repo only
yum --disablerepo='*' --enablerepo=localhost_repo.zabbix.com install -y zabbix zabbix-web php zabbix-server zabbix-agent
