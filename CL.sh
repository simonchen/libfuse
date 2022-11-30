#!/bin/sh
echo "\n================ ENVIROMENT ========================\n"
env

echo "\n======= INSTALL - MESON / CMAKE / UDEV =============\n"
apt-get update
apt install meson cmake libudev-dev

echo "\n================ MESON configure ===================\n"
mkdir ./build
cd ./build
meson .. --cross-file=../cross-file-$ARCH.txt
meson configure
ninja

echo "\n================ Release =============================\n"
mkdir ./$ARCH
cp ./build/util/fusermount3 ./$ARCH/fusermount
cp ./build/util/mount.fuse3 ./$ARCH/mount.fuse
cp ./build/lib/libfuse3.a ./$ARCH/libfuse.a
ls -lt ./$ARCH/
