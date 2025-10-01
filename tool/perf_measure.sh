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
  --web-renderer html \
  --source-maps \
  --pwa-strategy offline-first \
  --split-debug-info=perf/symbols \
  --analyze-size \
  --tree-shake-icons \
  --dart-define=FLUTTER_WEB_AUTO_DETECT=false \
  --output=build/web-html \
  | tee "${OUT_DIR}/build.log"

SIZE_DIR=$(find build -maxdepth 2 -name "*code-size-analysis*" -type d | head -n1)
if [[ -n "${SIZE_DIR:-}" ]]; then
  cp -R "${SIZE_DIR}" "${OUT_DIR}/size/"
fi

echo "Bundle sizes:" > "${OUT_DIR}/bundle_sizes.txt"
if [[ -f build/web-html/main.dart.js ]]; then
  wc -c build/web-html/main.dart.js >> "${OUT_DIR}/bundle_sizes.txt"
fi
find build/web-html -name '*.part.js' -print0 | xargs -0 -I{} wc -c {} >> "${OUT_DIR}/bundle_sizes.txt" || true

echo "Run a release web server separately before invoking Lighthouse." >> "${OUT_DIR}/README.md"
