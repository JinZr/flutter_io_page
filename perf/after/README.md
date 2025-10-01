# Performance Results After Optimizations

## Bundle Size
- `main.dart.js`: 2,171,279 bytes (was 3,526,514 bytes) → **38.4% reduction**.
- Deferred chunks emitted (`main.dart.js_N.part.js`) cover below-the-fold sections and are fetched lazily.
- SPLIT_DEBUG_INFO artifacts emitted under `perf/after/symbols/` (not checked in) via `--dart-define=SPLIT_DEBUG_INFO=perf/after/symbols`.

## Runtime Checks
- `flutter test -r expanded` ✅ (`6c8b9d`).
- Analyzer remains clean (`e21578`).

## Lighthouse
- Automated Lighthouse runs against the static server still fail with `NO_FCP` inside headless Chromium despite switching to the HTML renderer; the app paints correctly in a real browser, but Flutter's bootstrap script does not emit a first frame under the test harness (`10fb3c`). Manual profiling is required for precise Core Web Vitals.

## Reproduction
1. `flutter pub get`
2. `flutter build web --release --source-maps --pwa-strategy offline-first --no-tree-shake-icons=false --dart-define=SPLIT_DEBUG_INFO=perf/after/symbols --dart-define=FLUTTER_WEB_USE_SKIA=false`
3. Serve the contents of `build/web/` (e.g. `npx http-server build/web -p 8080`).
4. Run Lighthouse from a full Chrome session (not headless) targeting `http://127.0.0.1:8080/`.
