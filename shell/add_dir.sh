#!/bin/bash

BASEDIR=/test
[ -d $BASEDIR ] && rm -rf $BASEDIR/*

for i in $(seq 1 4)
  do
        mkdir $BASEDIR/$i
        for j in $(seq 1 4)
        do
            mkdir -p /test/$i/$j
        done
done  
