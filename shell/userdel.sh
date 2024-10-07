#!/bin/bash

USERLIST=/root/shell/user.list

cat $USERLIST | while read UNAME UPASS
do 
    userdel -r "$UNAME"
    [ $? -eq 0 ] \
        && echo "[OK]" \
        || echo "[FAIL]"
done
