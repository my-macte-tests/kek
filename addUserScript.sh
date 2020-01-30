#!/bin/bash

uname="$1"
upass="$2"
useradd --shell /usr/sbin/nologin $uname
sudo echo -e "$upass\n$upass\n" | sudo passwd $uname