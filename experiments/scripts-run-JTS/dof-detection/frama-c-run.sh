#!/bin/bash

# compile and link
for file in ./CWE*.c
do
    echo "### Handle $file Now ###"
    frama-c -val $file io.c
done


# execute asan

