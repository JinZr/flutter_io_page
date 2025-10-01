#!/usr/bin/env bash
set -euo pipefail

flutter build web \
  --release \
  --pwa-strategy none \
  --optimization-level 4 \
  --source-maps \
  --tree-shake-icons \
  --dart-define=FLUTTER_WEB_AUTO_DETECT=false

