#!/bin/bash
#################
#     *
#    **
#   ***
#  ****
# *****
#################


#ex
MAX=5
for i in $(seq 1 $MAX)
do
    NUM=$i
    BLANK_NUM=$(expr $MAX - $NUM)

    # 왼쪽 공백(' ') 개수
    # seq 4 -1 1 => 4에서 -1 만큼씩 빼서 1까지 
    INIT_NUM=$(expr $MAX - $i)
    for j in $(seq $INIT_NUM -1 1)
    do
        echo -n ' '
    done

    # 오른쪽 별(*) 개수
    for z in $(seq $i)
    do
        echo -n '*'
    done

    # 엔터(\n) 추가
    echo
done 
##################################
MAX=5
for i in $(seq 1 $MAX)
do  
    #echo $i
    NUM=$i
    BLANK_NUM=$(expr $MAX - $NUM)
    # echo "$BLANK_NUM : $NUM"
    for j in $(seq 1 $BLANK_NUM)
    do
        echo -n " "
    done
    for k in $(seq 1 $NUM)
    do
        echo -n "*"
    done
    echo
done
