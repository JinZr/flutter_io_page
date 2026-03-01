# Performance Reports

- Place baseline measurements under `perf/before/`.
- Place optimized measurements under `perf/after/`.
- Use `tool/perf_measure.sh` to capture timestamped bundle-size reports for core runtime artifacts and deferred chunks.
- Track both raw bytes and compressed transfer sizes (`gzip`, `brotli` when available) from `bundle_sizes.txt`.
- Lighthouse JSON/HTML exports should be named `lighthouse-<metric>.json` (or `.html`).
