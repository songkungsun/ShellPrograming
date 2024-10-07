#!/bin/bash

# Function definition
YES(){
    echo "YES" | boxes -d critical
}
NO() {
    echo
    echo "NO" | boxes -d critical
}
FAIL() {
    echo "[FAIL]"
    exit 2
}
#Variavle definition



# Main Funcion
echo -n "선택하십쇼(y/n)"
read CHOICE

case $CHOICE in
    y|Y|yes|YES|Yes)    YES ;;
    n|N|no|NO|No)       NO ;;
    *)                  FAIL ;;
esac
