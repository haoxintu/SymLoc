#!/bin/bash

rm -rf *klee-output

# compile and link
for file in ./CWE*.c
do
    echo "### Handle $file Now ###"
    clang -emit-llvm -g -c $file -O2 -o $file.bc
    llvm-link $file.bc io.bc -o $file-linked.bc
done

echo "compile and link done"

# execute klee

for file in ./*linked.bc
do
    echo "klee excutes $file"
    klee -libc=uclibc -posix-runtime --output-dir="$file-klee-output" $file
done
