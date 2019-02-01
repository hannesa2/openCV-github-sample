#!/usr/bin/env sh

if [ $# -eq 0 ]; then
    echo no parameter given, you can run it eg with this commands
    echo ""
    echo "  $0 3.4.5  \033[37m# version to add \033[0m"
    echo ""
    exit 1
fi

rm -rf *
git checkout addNewRelease.sh
wget https://sourceforge.net/projects/opencvlibrary/files/$1/opencv-$1-android-sdk.zip/download -O opencv-$1-android.zip
#cp ~/Downloads/opencv-$1-android-sdk.zip opencv-$1-android.zip

unzip opencv-$1-android.zip
rm opencv-$1-android.zip

mv -f OpenCV-android-sdk/* .
rm -rf OpenCV-android-sdk

git add *.apk *.so *.a *.html
git commit -m "Version opencv-$1 artifacts and docu"

git add .
git commit -m "Version opencv-$1 code"
git tag -a $1 -m "Android $1"
