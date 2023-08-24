## Replication package used in the paper "Concretely Mapped Symbolic Memory Locations for Memory Error Detection" (Under review of IEEE TSE)

## This repository includes two parts:

## Part 1: The benchmarks and running scripts used in the evaluation

* See more details in the folder [experiments](experiments)

## Part 2: source code of the tool **SymLoc** implemented in the paper

* With the tutorial on building the **SymLoc** in the following instructions

## Building setup
### Requirements
Install the following packages:
```
sudo apt-get install cmake bison flex libboost-all-dev python perl zlib1g-dev build-essential curl libcap-dev git cmake libncurses5-dev python-minimal python-pip unzip libtcmalloc-minimal4 libgoogle-perftools-dev libsqlite3-dev doxygen
pip3 install tabulate wllvm
```

### LLVM 9.0
```
wget http://releases.llvm.org/9.0.0/llvm-9.0.0.src.tar.xz
wget http://releases.llvm.org/9.0.0/cfe-9.0.0.src.tar.xz
wget http://releases.llvm.org/9.0.0/clang-tools-extra-9.0.0.src.tar.xz
tar xvf llvm-9.0.0.src.tar.xz
tar xvf cfe-9.0.0.src.tar.xz
tar xvf clang-tools-extra-9.0.0.src.tar.xz
mv llvm-9.0.0.src llvm-src
mv cfe-9.0.0.src clang
mv clang llvm-src/tools/clang
mv clang-tools-extra-9.0.0.src extra 
mv extra llvm-src/tools/clang/tools/extra
cd llvm-src
mkdir build 
cd build
cmake  -DLLVM_TARGETS_TO_BUILD=X86 -DCMAKE_BUILD_TYPE="Release"  -DCMAKE_INSTALL_PREFIX=./ -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ ..
make -j8
make install
```

Update the following environment variables:
```
export PATH=<llvm_build_dir>/bin:$PATH
export LLVM_COMPILER=clang
```

### minisat
```
git clone https://github.com/stp/minisat.git
cd minisat
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local/ ../
sudo make install
```

### STP
```
git clone https://github.com/stp/stp.git
cd stp
git checkout tags/2.3.3
mkdir build
cd build
cmake ..
make
sudo make install
```

### klee-uclibc
```
git clone https://github.com/klee/klee-uclibc.git
cd klee-uclibc
git checkout 038b7dc050c07a7b4d941b48a0f548eea3089214 # we used that version in our experiments
./configure --make-llvm-lib
make
```

### Our Tool
To build our tool, do the following:
```
git clone https://github.com/haoxintu/SymLoc
cd SymLoc
mkdir build-symloc
cd build-symloc
cmake \
    -DENABLE_SOLVER_STP=ON \
    -DENABLE_POSIX_RUNTIME=ON \
    -DENABLE_KLEE_UCLIBC=ON \
    -DKLEE_UCLIBC_PATH=<klee_uclibc_dir> \
    -DLLVM_CONFIG_BINARY=<llvm_build_dir>/bin/llvm-config \
    -DLLVMCC=<llvm_build_dir>/bin/clang \
    -DLLVMCXX=<llvm_build_dir>/bin/clang++
make -j4
```

After this, you could find the executable `symloc` inside `build-symloc/bin`.
