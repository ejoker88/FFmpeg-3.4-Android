#!/bin/bash

TOOLCHAIN=/home/rajdeep/my_toolchains/x86_64
CROSS_PREFIX=$TOOLCHAIN/bin/x86_64-linux-android-
rm -f $(pwd)/compat/strtod.o
function build_one
{
./configure --prefix=$PREFIX --enable-shared --disable-static --enable-protocol=file --enable-pic --enable-small --disable-programs --disable-doc --disable-symver --target-os=android --enable-cross-compile --cross-prefix=$CROSS_PREFIX --extra-cflags="-Os -fpic $ADDI_CFLAGS" --extra-ldflags="$ADDI_LDFLAGS" --sysroot=$TOOLCHAIN/sysroot $ADDITIONAL_CONFIG_FLAG
make clean
make -j2
make install
}

CPU=x86_64
mkdir -p $(pwd)/android/$CPU
PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS="-march=x86-64"
ADDI_LDFLAGS=""
ADDITIONAL_CONFIG_FLAG="--arch=x86_64 --enable-x86asm"
build_one
