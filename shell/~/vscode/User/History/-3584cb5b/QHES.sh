#!/bin/bash

export LANG=en_US.UFT-8

# DATE 
DATE=$(date +'%F %T')

# NAME
: << EOF
YESNO=''
while [ "$YESNO" != 'y' ]
do
    echo -n "작성자 이름 입력(ex: Song,Keungsun): "
    read NAME
    echo ; echo "작성자 이름 : $NAME" ; echo
    echo -n "작성된 내용이 맞습니까? (y/n) : "
    read YESNO
done
EOF
NAME=SONG

# OS
OS=$(cat /etc/centos-release )

# KERNEL
KERNEL=$(uname -sr)

# CPU
CPUNUM=$(lscpu -e | tail -n +2 |wc -l)
CPUTYPE=$(cat /proc/cpuinfo | grep 'model name' | uniq)
CPU="$CPUNUM ($CPUTYPE)"

#MEM
MEM=$(free -h | grep '^Mem:' | awk '{print $2}')
# DISK
DISK=$(lsblk | grep disk | wc -l)

# NETWORK 
NETNUM=$(nmcli device | tail -n +2 |grep -v '^lo' | awk '{print $1}')
for i in $NETNUM
do
    NIC=$i
    cat << EOF
Network: $NIC
    IP : $IP
    GW : $GW
    DNS: $DNS
EOF
done

echo
echo "결과 보고서"
# result
cat << EOF
Server Vul. Checker version 1.0

DATE: $DATE
NAME: $NAME


(1) Server Information
============================================
OS      : $OS
Kernel  : $KERNEL
CPU     : $CPU
MEM     : $MEM
DISK    : $DISK

Network:
    IP :
    GW :
    DNS:
EOF