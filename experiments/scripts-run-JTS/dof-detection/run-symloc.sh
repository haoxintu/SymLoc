#!/bin/bash

rm -rf *klee-output

# compile and link
for file in ./CWE*.c
do
    echo "### Handle $file Now ###"
    clang-9 -O3 -emit-llvm -g -c $file -o $file.bc
    llvm-link-9 $file.bc io.bc -o $file-linked.bc
done

echo "compile and link done"

# execute klee

for file in ./*linked.bc
do
    echo "klee excutes $file"
    symloc -libc=uclibc -posix-runtime --output-dir="$file-sym-klee-output" $file
    #~/disk-smu/research/temp-klee/klee/build/bin/klee -libc=uclibc -posix-runtime --output-dir="$file-sym-klee-output" $file
    #klee -libc=uclibc -posix-runtime $file
    break
done
