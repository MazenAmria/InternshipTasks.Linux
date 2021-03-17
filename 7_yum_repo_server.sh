#!/bin/bash

# install tmux
yum install -y tmux

# install httpd and mysql
yum install -y httpd mysql

# start httpd to share the repo locally
systemctl start httpd

# import GPG key
curl https://repo.zabbix.com/RPM-GPG-KEY-ZABBIX-A14FE591 > ~/RPM-GPG-KEY-ZABBIX-A14FE591
rpm --import ~/RPM-GPG-KEY-ZABBIX-A14FE591

# install Zabbix release to create the repo
rpm -Uv https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64/zabbix-release-4.4-1.el7.noarch.rpm

# now on yum repolist we see zabbix repo has been created
# zabbix/x86_64                   Zabbix Official Repository - x86_64
# zabbix-non-supported/x86_64     Zabbix Official Repository non-supported - x86_64

mkdir -p /var/www/html/repos/{zabbix,zabbix-non-supported}

# fetch the repo to the local server using reposync
reposync \
        --gpgcheck --plugins \
        --delete --newest-only \
        --repoid=zabbix \
        --download-metadata --downloadcomps \
        --download_path=/var/www/html/repos/

reposync \
        --gpgcheck --plugins \
        --delete --newest-only \
        --repoid=zabbix-non-supported \
        --download-metadata --downloadcomps \
        --download_path=/var/www/html/repos/

# create the repo
yum install -y createrepo
createrepo /var/www/html/
