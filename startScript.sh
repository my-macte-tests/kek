#!/bin/bash

TEXT = "logoutput: /var/log/socks.log
errorlog: /var/log/socks_error.log

internal: eth0 port = 1080
external: eth0


socksmethod: username



user.privileged: root
user.unprivileged: nobody
user.libwrap: nobody


client pass {
        from: 0/0 to: 0/0
        log: connect disconnect error ioop
}

socks pass {
        from: 0/0 to: 0/0
        log: connect disconnect error ioop
}"

sudo apt install dante-server -y
useradd --shell /usr/sbin/nologin proxy_user_01
passwd proxy_user_01
sudo echo -n > /etc/danted.conf -y
sudo echo $TEXT >> /etc/danted.conf -y
systemctl enable danted
systemctl start danted
