#!/bin/bash

sudo apt install dante-server -y
sudo useradd --shell /usr/sbin/nologin proxy_user_01
echo -e "password\npassword\n" | sudo passwd proxy_user_01
sudo passwd proxy_user_01
sudo sh -c 'echo -n > /etc/danted.conf'
sudo sh -c 'echo "logoutput: /var/log/socks.log\nerrorlog: /var/log/socks_error.log\ninternal: eth0 port = 1080\nexternal: eth0\nsocksmethod: username\nuser.privileged: root\nuser.unprivileged: nobody\nuser.libwrap: nobody\nclient pass {\nfrom: 0/0 to: 0/0\nlog: connect disconnect error ioop\n}\nsocks pass {\nfrom: 0/0 to: 0/0\nlog: connect disconnect error ioop\n}" >> /etc/danted.conf'
sudo systemctl enable danted
sudo systemctl start danted
