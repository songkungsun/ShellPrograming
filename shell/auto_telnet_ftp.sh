#!/bin/bash

IP=172.16.6.250

#Auto telnet
Cmd() {
    sleep 2 ; echo 'root'
    sleep 0.5; echo 'centos'
    sleep 0.5; echo 'hostname'
    sleep 0.5; echo 'tar cvzf /tmp/linux250.tar.gz /home'
    sleep 0.5; echo 'exit'
}

Cmd | telnet $IP

#Auto ftp
ftp -n $IP << EOF
user root centos
cd /tmp
lcd /root
bin
hash
prompt
mget linux250.txt
quit
EOF

echo
echo "RESULT"
ls -l /root/linux*.txt