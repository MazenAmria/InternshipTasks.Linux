netstat -na | grep :443
netstat -na | grep :80
# No output, the ports aren't used
systemctl start firewalld
systemctl enable firewalld

firewall-cmd --add-port=443/tcp --permanent
# ouptut: success
firewall-cmd --add-port=80/tcp --permanent
# ouptut: success
