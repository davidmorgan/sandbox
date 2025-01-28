#!/bin/bash --

random="$RANDOM$RANDOM$RANDOM"
sed -i -e "s#CACHE_BUSTER.*#CACHE_BUSTER$random#" lib/bv1.dart
