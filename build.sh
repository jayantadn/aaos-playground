#!/bin/sh

ANDROID_BRANCH="android12L-release"
REPO_URL="https://android.googlesource.com/platform/manifest"

if [ ! -d "$ANDROID_BRANCH/.repo" ]; then
	mkdir -p $ANDROID_BRANCH
	cd $ANDROID_BRANCH
	repo init -u $REPO_URL -b $ANDROID_BRANCH
	repo sync -j8
else
	cd $ANDROID_BRANCH
	echo "Android repository already exists. Skipping repo init and sync."
fi

. build/envsetup.sh && lunch sdk_car_x86_64-userdebug && m -j24


