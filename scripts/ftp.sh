#!/bin/bash

#Function definition
HELP() {
    cat << EOF
    !		debug		mdir		sendport	site
    $		dir		mget		put		size
    account		disconnect	mkdir		pwd		status
EOF
}

INVALID () {
    echo "?Invalid command"
}

OPEN() {
    echo -n "접속할려고 하는 FTP 서버IP : "
    read IP1
    # echo $IP1
    ftp $IP1
}

QUIT() {
    :
}

# main
while true
do
    echo -n "myftp>"
    read CMD
    # echo $CMD
    case $CMD in
        'help') HELP       ;;
        'open') OPEN       ;;
        'quit') QUIT       ;;
        '')     :          ;;
        *)      INVALID    ;;
    esac
done
