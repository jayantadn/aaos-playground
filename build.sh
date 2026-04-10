#!/bin/bash

ANDROID_BRANCH="android12L-release"
REPO_URL="https://android.googlesource.com/platform/manifest"

mkdir -p $ANDROID_BRANCH 
cd $ANDROID_BRANCH 
repo init -u $REPO_URL -b $ANDROID_BRANCH
repo sync -j8

. build/envsetup.sh && lunch sdk_car_x86_64-userdebug && m -j$(nproc)


