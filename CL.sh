#!/bin/sh
echo "\n================ ENVIROMENT ========================\n"
env

echo "\n======= INSTALL - MESON / CMAKE / UDEV =============\n"
apt install meson cmake libudev-dev

echo "\n================ MESON configure ===================\n"
mkdir ./build
cd ./build

if [ $ARCH == 'mipsel' ]; then

fi
