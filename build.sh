#!/bin/sh

ANDROID_BRANCH="android12L-release"
REPO_URL="https://android.googlesource.com/platform/manifest"

mkdir -p $ANDROID_BRANCH 
cd $ANDROID_BRANCH 
repo init -u $REPO_URL -b $ANDROID_BRANCH
repo sync -j8

. build/envsetup.sh && lunch sdk_car_x86_64-userdebug && m -j32

# error: frameworks/libs/native_bridge_support/linker/Android.bp:28:1: "native_bridge_guest_linker" depends on undefined module "linker_bin_template"
