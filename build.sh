#!/bin/bash

LIB_DIR="/lib/x86_64-linux-gnu"
# Check and symlink libncurses.so.5 if missing
if [ ! -e "$LIB_DIR/libncurses.so.5" ] && [ -e "$LIB_DIR/libncurses.so.6" ]; then
	echo "libncurses.so.5 not found, creating symlink to libncurses.so.6..."
	sudo ln -sf "$LIB_DIR/libncurses.so.6" "$LIB_DIR/libncurses.so.5"
fi
# Check and symlink libtinfo.so.5 if missing
if [ ! -e "$LIB_DIR/libtinfo.so.5" ] && [ -e "$LIB_DIR/libtinfo.so.6" ]; then
	echo "libtinfo.so.5 not found, creating symlink to libtinfo.so.6..."
	sudo ln -sf "$LIB_DIR/libtinfo.so.6" "$LIB_DIR/libtinfo.so.5"
fi

ANDROID_BRANCH="android12L-release"
REPO_URL="https://android.googlesource.com/platform/manifest"

mkdir -p $ANDROID_BRANCH 
cd $ANDROID_BRANCH 
repo init -u $REPO_URL -b $ANDROID_BRANCH
repo sync -j8

. build/envsetup.sh && lunch sdk_car_x86_64-userdebug && m -j$(nproc)

