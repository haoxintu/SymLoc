#!/bin/bash

rm -rf *klee-output
# compile and link
rm CWE*.bc
for file in ./CWE*.c
do
    # deal with wired character
    # sed -i 's/.$//g' $file
    echo "### Handle $file Now ###"
    clang-9 -emit-llvm -g -c $file -o $file.bc
    llvm-link $file.bc io.bc -o $file-linked.bc
    # klee -libc=uclibc -posix-runtime --output-dir="$file-klee-output" $file-linked.bc
    # break
done

echo "compile and link done"

# execute klee

for file in ./*linked.bc
do
    echo "klee excutes $file"
    ~/disk-smu/research/klee-env/klee-official/klee/build/bin/klee -libc=uclibc -posix-runtime -allocate-determ --output-dir="$file-klee-output" $file
   # klee -libc=uclibc -posix-runtime $file
   # break
done
