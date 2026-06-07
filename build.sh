#!/usr/bin/env bash
set -euo pipefail

output_dir="build/web"
tmp_output_dir="build/web.next"

build_args=(
  flutter build web
  --release
  --wasm
  --optimization-level 4
  --tree-shake-icons
  --no-wasm-dry-run
  --output="$tmp_output_dir"
)

if [[ "${ENABLE_SOURCE_MAPS:-0}" == "1" ]]; then
  build_args+=(--source-maps)
fi

rm -rf "$tmp_output_dir"
"${build_args[@]}"
rm -rf "$output_dir"
mv "$tmp_output_dir" "$output_dir"

# Flutter emits a sourceMappingURL for flutter.js, but does not output flutter.js.map.
# Strip the dangling reference to avoid noisy 404 warnings in browser DevTools.
flutter_js="$output_dir/flutter.js"
if [[ -f "$flutter_js" ]]; then
  tmp_file="$(mktemp)"
  grep -v '^//# sourceMappingURL=flutter\.js\.map$' "$flutter_js" > "$tmp_file"
  mv "$tmp_file" "$flutter_js"
fi
