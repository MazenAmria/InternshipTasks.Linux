yum install -y tmux

yum install -y httpd mysql

cd /var/www/html
yum install -y wget
wget -r --no-parent --mirror https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64
mv /var/www/html/repo.zabbix.com/ /var/www/html/
yum install -y yum-utils createrepo
createrepo --update /var/www/html/zabbix/4.4/rhel/7/x86_64
yum-config-manager --add-repo http://<host_ip>/zabbix/4.4/rhel/7/x86_64

cd /etc/yum.repos.d/
# Here you find the repo files, for any repo
# you can disable it by setting enabled=0
# Alternativly you can use yum-config-manager --disable

yum-config-manager --disable {base,extras,updates}

yum install -y zabbix zabbix-web php zabbix-server zabbix-agent
