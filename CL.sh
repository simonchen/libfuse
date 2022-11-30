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
mkdir ./$ENV_HOST
cp ./build/util/fusermount3 ./$ENV_HOST/fusermount
cp ./build/util/mount.fuse3 ./$ENV_HOST/mount.fuse
cp ./build/lib/libfuse3.a ./$ENV_HOST/libfuse.a
ls -lt ./$ENV_HOST/
