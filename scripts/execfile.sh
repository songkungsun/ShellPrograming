#!/bin/bash

echo -n "파일이름 입력? : "
read FILENAME

# echo $FILENAME
if [ -x "$FILENAME" ]; then
    $FILENAME
else
    echo "[ FAIL ] $FILENAME:파일에 실행 권한 없습니다."
    exit 1
fi