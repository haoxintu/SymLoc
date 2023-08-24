#!/bin/bash

rm -rf *klee-output

# compile and link
for file in ./CWE*.c
do
    # deal with wired character
    echo "### Handle $file Now ###"
    clang-9 -O1 -emit-llvm -g -c $file -o $file.bc
    llvm-link-9 $file.bc io.bc -o $file-linked.bc
    # klee -libc=uclibc -posix-runtime --output-dir="$file-klee-output" $file-linked.bc
    # break
done

echo "compile and link done"

# execute klee

for file in ./*linked.bc
do
    echo "klee excutes $file"
    ~/disk-smu/research/klee-env/klee-official/klee/build/bin/klee -libc=uclibc -posix-runtime --allocate-determ --output-dir="$file-klee-output" $file
done
