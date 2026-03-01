#!/usr/bin/env bash
set -euo pipefail

if ! command -v flutter >/dev/null 2>&1; then
  echo "flutter binary is required on PATH" >&2
  exit 127
fi

CHANNEL_INFO=$(flutter --version)
echo "Using Flutter: $CHANNEL_INFO"

echo "Cleaning build..."
flutter clean
flutter pub get

mkdir -p perf/before perf/after perf/symbols

STAMP=$(date +"%Y%m%d-%H%M%S")
OUT_DIR="perf/after/${STAMP}"
mkdir -p "${OUT_DIR}" "${OUT_DIR}/size"

cat >"${OUT_DIR}/environment.txt" <<ENV
Flutter version:
${CHANNEL_INFO}
ENV

flutter analyze | tee "${OUT_DIR}/analyze.log"
flutter test -r expanded | tee "${OUT_DIR}/test.log"

flutter build web \
  --release \
  --wasm \
  --no-wasm-dry-run \
  --source-maps \
  --tree-shake-icons \
  --output=build/web-html \
  | tee "${OUT_DIR}/build.log"

SIZE_REPORT="${OUT_DIR}/bundle_sizes.txt"

append_size() {
  local path="$1"
  if [[ ! -f "${path}" ]]; then
    return
  fi
  local bytes
  bytes=$(wc -c < "${path}" | tr -d ' ')
  printf "%12s  %s\n" "${bytes}" "${path}" >> "${SIZE_REPORT}"
}

append_gzip_size() {
  local path="$1"
  if [[ ! -f "${path}" ]]; then
    return
  fi
  local bytes
  bytes=$(gzip -c "${path}" | wc -c | tr -d ' ')
  printf "%12s  %s\n" "${bytes}" "${path}" >> "${SIZE_REPORT}"
}

append_brotli_size() {
  local path="$1"
  if [[ ! -f "${path}" ]]; then
    return
  fi
  local bytes
  bytes=$(brotli -c "${path}" | wc -c | tr -d ' ')
  printf "%12s  %s\n" "${bytes}" "${path}" >> "${SIZE_REPORT}"
}

{
  echo "Bundle sizes (bytes):"
  echo
  echo "Initial/runtime artifacts:"
} > "${SIZE_REPORT}"

PRIMARY_ARTIFACTS=(
  "build/web-html/main.dart.wasm"
  "build/web-html/main.dart.js"
  "build/web-html/main.dart.mjs"
  "build/web-html/canvaskit/skwasm.wasm"
  "build/web-html/canvaskit/skwasm_heavy.wasm"
  "build/web-html/canvaskit/canvaskit.wasm"
)

for artifact in "${PRIMARY_ARTIFACTS[@]}"; do
  append_size "${artifact}"
done

if compgen -G "build/web-html/main.dart.js_*.part.js" >/dev/null; then
  echo >> "${SIZE_REPORT}"
  echo "Deferred JS chunks (bytes):" >> "${SIZE_REPORT}"
  for chunk in build/web-html/main.dart.js_*.part.js; do
    append_size "${chunk}"
  done
fi

if command -v gzip >/dev/null 2>&1; then
  echo >> "${SIZE_REPORT}"
  echo "Gzip sizes (bytes):" >> "${SIZE_REPORT}"
  for artifact in "${PRIMARY_ARTIFACTS[@]}"; do
    append_gzip_size "${artifact}"
  done
  if compgen -G "build/web-html/main.dart.js_*.part.js" >/dev/null; then
    for chunk in build/web-html/main.dart.js_*.part.js; do
      append_gzip_size "${chunk}"
    done
  fi
fi

if command -v brotli >/dev/null 2>&1; then
  echo >> "${SIZE_REPORT}"
  echo "Brotli sizes (bytes):" >> "${SIZE_REPORT}"
  for artifact in "${PRIMARY_ARTIFACTS[@]}"; do
    append_brotli_size "${artifact}"
  done
  if compgen -G "build/web-html/main.dart.js_*.part.js" >/dev/null; then
    for chunk in build/web-html/main.dart.js_*.part.js; do
      append_brotli_size "${chunk}"
    done
  fi
fi

echo "Run a release web server separately before invoking Lighthouse." >> "${OUT_DIR}/README.md"
