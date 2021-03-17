#!/bin/bash

# add the repo (and enable it)
yum-config-manager --add-repo http://192.168.56.4/

# cleaning the cache
yum clean all

# the repo config files are stored ad /etc/yum.repos.d/
# for any repo you can disable it by setting enabled=0
# alternativly you can use yum-config-manager --disable <repo>

# installing the following packages from the local repo
yum install -y zabbix-server-mysql zabbix-web-mysql zabbix-agent zabbix-java-gateway
