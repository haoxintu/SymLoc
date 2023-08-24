#!/bin/bash

# compile and link
for file in ./CWE*.c
do
    echo "### Handle $file Now ###"
    gcc -O2 -g $file io.c
    valgrind ./a.out
    rm a.out
done


# execute asan

