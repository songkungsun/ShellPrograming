#!/bin/bash

FTPUSERS=/etc/vsftpd/ftpusers

for uname in $(cat $FTPUSERS | egrep -v '^#|^$')
do
    echo $uname
done
