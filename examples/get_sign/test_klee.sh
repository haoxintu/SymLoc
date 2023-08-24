#!/bin/bash

rm -rf klee-*

# recompile first
clang -emit-llvm -c get_sign.c

# change .bc to readable .ll
llvm-dis get_sign.bc

# execute klee
klee get_sign.bc
