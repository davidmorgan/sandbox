#!/bin/bash --

build_target=$1
built_value_target=$2
echo "$build_target,$built_value_target"

if test -d "$build_target/build_experimental"; then
  cat pubspec.template | sed -e "s#BUILD#$build_target#" | sed -e "s#BUILT_VALUE#$built_value_target#" > pubspec.yaml
else
  cat pubspec.template | sed -e "s#BUILD#$build_target#" | sed -e "s#BUILT_VALUE#$built_value_target#" | grep -v 'build_experimental' > pubspec.yaml
fi
for size in 10 25 50 100 200 500 1000 2000; do
  sed -i -e "s#workspace:#workspace:\n- built_value_$size#" pubspec.yaml
done

echo -n "Writing source files..."
for size in 10 25 50 100 200 500 1000 2000; do
  tool/make_benchmark.sh $size
done
echo "done."

echo "libraries,initial build/ms,no change rebuild/ms,edit and rebuild/ms"
for size in 10 25 50 100 200 500 1000 2000; do
  tool/run_benchmark.sh "$size"
done
