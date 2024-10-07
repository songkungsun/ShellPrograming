#!/bin/bash
# service.sh start|stop httpd
#-> systemctl enable httpd
#-> systemctl restart httpd

if [ $# -ne 2 ] ; then 
    echo "Usage: $0 <start|stop> UNIT"
    exit 1 
fi

ACTION=$1
UNIT=$2

#Funfion definitaion
UNIT_START() {
    systemctl enable $UNIT
    systemctl restart $UNIT
    systemctl status $UNIT
}
UNIT_STOP() {
    systemctl disable $UNIT
    systemctl stop $UNIT
}
EXIT() {
    exho "[FAIL] Miss"
    exit 1
}
# Main Function
case $ACTION in
    start)      UNIT_START  ;;
    stop)       UNIT_STOP   ;;
    *)          exit        ;;
esac
