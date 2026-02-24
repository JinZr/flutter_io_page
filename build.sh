#!/usr/bin/env bash
set -euo pipefail

flutter build web \
  --release \
  --wasm \
  --optimization-level 4 \
  --source-maps \
  --tree-shake-icons \
  --no-wasm-dry-run

# Flutter emits a sourceMappingURL for flutter.js, but does not output flutter.js.map.
# Strip the dangling reference to avoid noisy 404 warnings in browser DevTools.
flutter_js="build/web/flutter.js"
if [[ -f "$flutter_js" ]]; then
  tmp_file="$(mktemp)"
  grep -v '^//# sourceMappingURL=flutter\.js\.map$' "$flutter_js" > "$tmp_file"
  mv "$tmp_file" "$flutter_js"
fi