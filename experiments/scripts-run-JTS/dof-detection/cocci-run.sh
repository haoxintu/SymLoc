#!/bin/bash

# compile and link
for file in ./CWE*.c
do
    echo "### Handle $file Now ###"
    spatch --sp-file ./doublefree.cocci $file io.c
done


# execute asan

