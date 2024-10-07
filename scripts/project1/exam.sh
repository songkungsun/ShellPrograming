#!/bin/bash

# variable definition
num=1
basedir=$HOME/scripts/project1
totalnum=$(wc -l < $basedir/question/answr.txt)
TMP1=/tmp/tmp1


#funtion
probview() {
    echo
    cat $1
    echo
}

# main
ls -1 $basedir/question/question*.txt > $TMP1

while [ $num -le $totalnum ]
do
    pro_num=$num
    # echo $pro_num ; read
    prob_file=$basedir/question/question$pro_num.txt
    # echo $prob_file ; read
    probview $prob_file
    correct_num=$(cat $basedir/question/answr.txt |sed -n "${num}p"| awk -F: '{print $2}')
    # echo $correct_num
    echo -n "answer (1|2|3|4)"
    read answer

    if [ "$answer" = "$correct_num" ] ; then
        echo "[ OK ] good"
        num=$(expr $num + 1)
        echo
    else
        echo "[ FAIL ] retry"
        echo
    fi
done

echo "OVER GOOD" | boxes -d santa