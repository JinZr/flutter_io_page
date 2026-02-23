#!/usr/bin/env bash
set -euo pipefail

flutter build web \
  --release \
  --optimization-level 4 \
  --source-maps \
  --tree-shake-icons \
  --no-wasm-dry-run
