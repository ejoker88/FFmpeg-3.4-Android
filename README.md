# FFmpeg-3.4-Android

# Before you proceed please note: Versions of FFmpeg and Android NDK are very important. If you use other versions, then this repository might not work.I have used FFmpeg 3.4 and NDK r16b stable.

This repository helps to compile FFmpeg 3.4 Version for Android using Android NDK Standalone Toolchain.

Use build_all.sh file to run the build script, if you want to build FFmpeg shared library (.so) for all architectures (armeabi, armeabi-v7a, arm64-v8a, x86 and x86_64). Otherwise, use architecture specific build files that you want to target. Before running build scripts, in the architecture specific build files, please update TOOLCHAIN path. It should point to the NDK Standalone Toolchain path, which you would have created for the specific architecture. For more details about creating NDK Standalone Toolchain for each architecture and what you need to update, please visit Wiki page of this repository.

Link to Wiki page (Complete step by step tutorial):
https://github.com/ejoker88/FFmpeg-3.4-Android/wiki/Tutorial-:-FFmpeg-3.4-for-Android

If this repository helped, then please spread the word and help others.

Video Tutorial is also available at the YouTube Link: https://youtu.be/2OGbamEjYhc

Happy coding and developing Android apps!!


# Copyright
Copyright © 2018 Rajdeep Rajput (https://github.com/ejoker88)
