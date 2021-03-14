#!/bin/bash

# open 443/tcp port
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# open 80/tcp port
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# make changes permanent
iptables-save > /etc/sysconfig/iptables
# after reboot these data has to be reloaded with the command
# iptables-restore < /etc/sysconfig/iptables

# block ssh connection for your colleague ip to the VM
iptables -I INPUT -s 192.168.56.4 -p tcp --dport ssh -j REJECT
