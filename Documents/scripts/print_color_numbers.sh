#!/usr/bin/env bash

if [ -z $1 ]; then
    BREAK=5
else
    BREAK=$1
fi
for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i} "
    if [ $(( i % $BREAK )) -eq $(($BREAK-1)) ] ; then
        printf "\n"
    fi
done
