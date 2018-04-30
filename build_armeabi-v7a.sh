#!/bin/bash

TOOLCHAIN=/home/rajdeep/my_toolchains/arm
CROSS_PREFIX=$TOOLCHAIN/bin/arm-linux-androideabi-
rm -f $(pwd)/compat/strtod.o
function build_one
{
./configure --prefix=$PREFIX --enable-shared --disable-static --enable-protocol=file --enable-pic --enable-small --disable-programs --disable-doc --disable-symver --target-os=android --enable-cross-compile --cross-prefix=$CROSS_PREFIX --extra-cflags="-Os -fpic $ADDI_CFLAGS" --extra-ldflags="$ADDI_LDFLAGS" --sysroot=$TOOLCHAIN/sysroot $ADDITIONAL_CONFIG_FLAG
make clean
make -j2
make install
}

CPU=armeabi-v7a
mkdir -p $(pwd)/android/$CPU
PREFIX=$(pwd)/android/$CPU 
ADDI_CFLAGS="-marm -march=armv7-a -mfloat-abi=softfp -mthumb -mfpu=vfpv3-d16 -mtune=cortex-a8"
ADDI_LDFLAGS="-marm -march=armv7-a -Wl,--fix-cortex-a8"
ADDITIONAL_CONFIG_FLAG="--arch=arm --disable-asm"
build_one
