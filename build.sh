#!/bin/sh

CURRENT_USER=`whoami`
CURRENT_PATH=`pwd`
XCODE_PATH=`xcode-select -print-path`
SDK_PATH=`ls -t -d $XCODE_PATH/Platforms/iPhoneSimulator.platform/Developer/SDKs/* | head -1`

function cleanTargets() {
    rm -rf ~/Library/Developer/Xcode/DerivedData
    rm -rf ~/Library/Application Support/iPhone Simulator
    rm -rf build
    xcodebuild -target OCLayAbout -sdk iphoneos -configuration Release clean;
    xcodebuild -target test-unit -sdk $XCODE_PATH/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator5.0.sdk/ -configuration Debug clean;
}

function runTests() {
    #xcodebuild -target package -sdk iphoneos -configuration Release build
    xcodebuild -verbose -target test-unit -sdk $SDK_PATH -configuration Debug build
    OUT=$?
    if [ $OUT -ne 0 ]
    then
        echo "Build FAILED : $OUT";
        exit 1
    fi
}

function buildRelease() {
    xcodebuild -target package -sdk iphoneos -configuration Debig build
    OUT=$?
    if [ $OUT -ne 0 ]
    then
        echo "Build FAILED : $OUT";
        exit 1
    fi
}

case "$1" in
  clean)
  cleanTargets;;

  test)
  runTests;;

  release)
  buildRelease;;
  *)
  echo "Usage: build.sh (clean|test|release) e.g. ./build.sh test";
  exit 1;;
esac

exit 0
