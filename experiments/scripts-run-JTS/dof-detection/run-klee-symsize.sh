#!/bin/bash

rm -rf *klee-output

# compile and link
for file in ./CWE*.c
do
    # deal with wired character
    echo "### Handle $file Now ###"
    clang-9 -emit-llvm -g -c $file -o $file.bc
    llvm-link-9 $file.bc io.bc -o $file-linked.bc
done

echo "compile and link done"

# execute klee

for file in ./*linked.bc
do
    echo "klee excutes $file"
     ~/disk-smu/research/klee-env/klee-symsize/build/bin/klee -search=bfs -allocate-sym-size=1 -capacity=100 -sym-size-mode=eager -use-forked-solver -use-loop-merge=1 -use-optimized-merge=1 -optimize-ite-using-exec-tree=1 -optimize-array-ite-using-exec-tree=1 --exit-on-error-type=Ptr -libc=uclibc -posix-runtime --output-dir="$file-klee-output" $file --model-symbolic-size --model-symbolic-fd-size
done
