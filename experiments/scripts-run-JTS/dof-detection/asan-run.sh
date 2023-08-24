#!/bin/bash

# compile and link
for file in ./CWE*.c
do
    echo "### Handle $file Now ###"
    clang-6.0 -fsanitize=address -O2 $file io.c
    ./a.out
done


# execute asan

