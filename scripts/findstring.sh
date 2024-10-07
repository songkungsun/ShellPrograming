#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <pattern> <filename>"
    exit 1
fi
PATTERN="$1"
FILENAME="$2"

if grep $PATTERN $FILENAME > /dev/null 2>&1 ; then
    echo "[OK] found it $PATTERN from $FILENAME"
else
    echo "[FAIL] can't find $PATTERN from $FILENAME"
fi

grep $PATTERN $FILENAME > /dev/null 2>&1 
if [ $? -eq 0 ] ; then
    echo "[OK] found it $PATTERN from $FILENAME"
else
    echo "[FAIL] can't find $PATTERN from $FILENAME"
fi