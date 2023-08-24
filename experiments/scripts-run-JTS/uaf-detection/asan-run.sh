#!/bin/bash

# compile and link
for file in ./CWE*.c
do
    # deal with wired character
    # sed -i 's/.$//g' $file
    echo "### Handle $file Now ###"
    clang-6.0 -fsanitize=address -g $file io.c
    ./a.out
done


# execute asan

