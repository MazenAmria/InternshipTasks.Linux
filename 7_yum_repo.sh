yum install -y tmux

yum install -y httpd mysql

mkdir /var/www/html/zabbix
cd /var/www/html/zabbix
wget -r --no-parent https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64
yum install -y yum-utils createrepo
