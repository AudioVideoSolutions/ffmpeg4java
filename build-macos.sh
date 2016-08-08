#/bin/sh
export BUILD_DIR=`pwd`/build

rm -fR ffmpeg

git clone https://github.com/nextbreakpoint/FFmpeg.git ffmpeg

cp Makefile.lib.macos ffmpeg/Makefile.lib.macos
cp Makefile.jni.macos ffmpeg/Makefile.jni.macos

cp Patch.macos ffmpeg/Patch.macos

cd ffmpeg

git checkout ce36e74e75751c721185fbebaa4ee8714b44c5a5

cd ..

patch -p0 < ffmpeg/Patch.macos

cd ffmpeg

make -f Makefile.lib.macos ffmpeg

make -f Makefile.jni.macos all
