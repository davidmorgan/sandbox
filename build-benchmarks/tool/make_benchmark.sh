#!/bin/bash --

size="$1"
package_name="built_value_$size"

rm -rf "$package_name"
mkdir -p "$package_name/lib"

cat <<EOF > "$package_name/pubspec.yaml"
name: built_value_$size
publish_to: none
resolution: workspace

environment:
  sdk: ^3.6.0

dependencies:
  built_value: any

dev_dependencies:
  build_runner: any
  built_value_generator: any
EOF

cat <<EOF > "$package_name/lib/app.dart"
// ignore_for_file: unused_import
EOF

for f in $(seq 1 "$size"); do
  cat <<EOF > "$package_name/lib/bv$f.dart"
// ignore_for_file: unused_import
import 'package:built_value/built_value.dart';

import 'app.dart';

part 'bv$f.g.dart';

// CACHE_BUSTER

abstract class Value implements Built<Value, ValueBuilder> {
  Value._();
  factory Value(void Function(ValueBuilder) updates) = _\$Value;
}
EOF

  cat <<EOF >> "$package_name/lib/app.dart"
import 'bv$f.dart';
EOF
done
