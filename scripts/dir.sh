#!/bin/bash

echo -n "파일이름 입력 : "
 read FILE1

 # echo $FILE1
 if [ -f $FILE1 ] ; then
    echo "[ OK] $FILE1: 일반 파일"
 elif [ -d $FILE1 ]; then
    echo "[ OK ] $FILE1: 디렉토리:"
 else
    echo "[FAIL] $FILE1: 일반 파일 또는 디렉토리가 아님"
    exit 2
 fi

