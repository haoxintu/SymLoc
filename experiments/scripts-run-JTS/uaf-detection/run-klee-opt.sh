#!/bin/bash

rm -rf *klee-output
# compile and link
rm CWE*.bc
for file in ./CWE*.c
do
    echo "### Handle $file Now ###"
    clang-9 -emit-llvm -O1 -g -c $file -o $file.bc
    llvm-link $file.bc io.bc -o $file-linked.bc
done

echo "compile and link done"

# execute klee

for file in ./*linked.bc
do
    echo "klee excutes $file"
    ~/disk-smu/research/klee-env/klee-official/klee/build/bin/klee -libc=uclibc -posix-runtime --output-dir="$file-klee-output" $file
done
