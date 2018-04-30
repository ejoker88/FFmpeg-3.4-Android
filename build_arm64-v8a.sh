#!/bin/bash

TOOLCHAIN=/home/rajdeep/my_toolchains/arm64
CROSS_PREFIX=$TOOLCHAIN/bin/aarch64-linux-android-
rm -f $(pwd)/compat/strtod.o
function build_one
{
./configure --prefix=$PREFIX --enable-shared --disable-static --enable-protocol=file --enable-pic --enable-small --disable-programs --disable-doc --disable-symver --target-os=android --enable-cross-compile --cross-prefix=$CROSS_PREFIX --extra-cflags="-Os -fpic $ADDI_CFLAGS" --extra-ldflags="$ADDI_LDFLAGS" --sysroot=$TOOLCHAIN/sysroot $ADDITIONAL_CONFIG_FLAG
make clean
make -j2
make install
}

CPU=arm64-v8a
mkdir -p $(pwd)/android/$CPU
PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS="-march=armv8-a"
ADDI_LDFLAGS="-L$TOOLCHAIN/sysroot/usr/lib"
ADDITIONAL_CONFIG_FLAG="--arch=aarch64 --enable-yasm"
build_one
