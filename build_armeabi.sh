#!/bin/bash

TOOLCHAIN=/home/rajdeep/my_toolchains/arm
CROSS_PREFIX=$TOOLCHAIN/bin/arm-linux-androideabi-
rm -f $(pwd)/compat/strtod.o
function build_one
{
./configure --prefix=$PREFIX --enable-shared --disable-static --enable-protocol=file --enable-pic --enable-small --disable-doc --disable-programs --disable-symver --target-os=android --enable-cross-compile --cross-prefix=$CROSS_PREFIX --extra-cflags="-Os -fpic $ADDI_CFLAGS" --extra-ldflags="$ADDI_LDFLAGS" --sysroot=$TOOLCHAIN/sysroot $ADDITIONAL_CONFIG_FLAG
make clean
make -j2
make install
}

CPU=armeabi
mkdir -p $(pwd)/android/$CPU
PREFIX=$(pwd)/android/$CPU 
ADDI_CFLAGS="-marm -march=armv5te -mtune=arm9tdmi -msoft-float"
ADDI_LDFLAGS=""
ADDITIONAL_CONFIG_FLAG="--arch=arm --cpu=armv5te --enable-armv5te --disable-asm --disable-stripping"
build_one
