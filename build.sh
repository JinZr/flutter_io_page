#!/usr/bin/env bash
set -euo pipefail

flutter build web \
  --release \
  --base-href "/flutter_io_page/" \
  --pwa-strategy none \
  --optimization-level 4 \
  --source-maps \
  --tree-shake-icons \
  --wasm
