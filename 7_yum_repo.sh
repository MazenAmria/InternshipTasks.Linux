yum install -y tmux

yum install -y httpd mysql

mkdir /var/www/html/zabbix
cd /var/www/html/zabbix
wget -q -r -t1 --no-parent -nd --mirror https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64
yum install -y yum-utils createrepo
createrepo --update /var/www/html/zabbix/zabbix/4.4/rhel/7/x86_64
yum-config-manager --add-repo http://<my_id>/zabbix
yum-config-manager --disable {base,extras,updates}

yum install -y zabbix zabbix-web php zabbix-server zabbix-agent
