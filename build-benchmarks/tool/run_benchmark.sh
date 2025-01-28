#!/bin/bash --

build() {
    start=${EPOCHREALTIME/./}
    dart run build_runner build -d &>/dev/null
    echo -n ",$(( (${EPOCHREALTIME/./} - start)/1000 ))"
}

set -e

size=$1
cd "built_value_$size"
rm -rf .dart_tool
dart pub get &>/dev/null

dart run build_runner build --help &>/dev/null
echo -n "$size"
build
build

random="$RANDOM$RANDOM$RANDOM"
sed -i -e "s#CACHE_BUSTER.*#CACHE_BUSTER$random#" lib/bv1.dart
build
echo
