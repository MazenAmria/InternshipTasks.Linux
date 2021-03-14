#!/bin/bash

# install tmux
yum install -y tmux

# install httpd and mysql
yum install -y httpd mysql

# download the repo packages
yum install -y wget
wget -N -r --no-parent --mirror https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64 -P /var/www/html

# create the repo
yum install -y yum-utils createrepo
createrepo --update /var/www/html/repo.zabbix.com

# add the repo (and enable it)
yum-config-manager --add-repo http://localhost/repo.zabbix.com

# download GPG key to /etc/pki/rpm-gpg
wget -N https://repo.zabbix.com/RPM-GPG-KEY-ZABBIX -P /etc/pki/rpm-gpg/

# enable GPG checking for the repo
repo=/etc/yum.repos.d/localhost_repo.zabbix.com.repo
sed -i "/^gpgcheck=.*$/d" $repo
echo "gpgcheck=1" >> $repo
sed -i "/^gpgkey=.*$/d" $repo
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX" >> $repo

# the repo config files are stored ad /etc/yum.repos.d/
# for any repo you can disable it by setting enabled=0
# alternativly you can use yum-config-manager --disable <repo>
yum-config-manager --disable {base,extras,updates}

# installing the following packages from the local repo
yum install -y zabbix zabbix-web php zabbix-server zabbix-agent
