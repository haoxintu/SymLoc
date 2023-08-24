#!/bin/bash

# compile and link
for file in ./CWE*.c
do
    echo "### Handle $file Now ###"
    clang-6.0 -O2 -g $file io.c
    valgrind ./a.out
done


# execute asan

