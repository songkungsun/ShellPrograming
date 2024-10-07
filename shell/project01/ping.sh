#!/bin/bash

START=200
END=230
NET=172.16.6
RESULT=/tmp/tmp1
> $RESULT

for i in $(seq $START $END)
do
    ping -c 1 $NET.$i >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "[OK] $NET.$i is alive" | tree -a $RESULT
    else
        echo "[FAIL] $NET.$i is dead" >> $RESULT
    fi
done