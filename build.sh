#!/usr/bin/env bash
set -euo pipefail

flutter build web \
  --release \
  --web-renderer html \
  --pwa-strategy offline-first \
  --source-maps \
  --split-debug-info=perf/symbols \
  --tree-shake-icons \
  --analyze-size \
  --dart-define=FLUTTER_WEB_AUTO_DETECT=false

