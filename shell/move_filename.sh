#!/bin/bash

if [$# -ne 1 ]; then
    echo "Usage: $0 <directory> <src> <dst>"
    exit 1
file1

D_WORK="$1"       	    
T_FILE1=/tmp/.tmp1  	

SRC=".$1"
DST=".$2"
ls -1 $D_WORK | grep "$(SRC)$" > $T_FILE1
for FILE in `cat $T_FILE1`
do
    mv $D_WORK/$FILE $(echo $D_WORK/$FILE | sed "s/$(SRC)$/$(DST)/g")
done