| Metric | Before | After | Delta | Notes |
| --- | --- | --- | --- | --- |
| Initial critical transfer size | _tbd_ | _tbd_ | _tbd_ | Sum startup artifacts from `bundle_sizes.txt` (raw + compressed). |
| Deferred chunk transfer size | _tbd_ | _tbd_ | _tbd_ | Sum `main.dart.js_*.part.js` sizes (raw + compressed). |
| WebAssembly core size (`main.dart.wasm`) | _tbd_ | _tbd_ | _tbd_ | Compare raw and gzip/brotli transfer sizes. |
| Renderer runtime size | _tbd_ | _tbd_ | _tbd_ | Track skwasm/canvaskit wasm artifacts reported by script. |
| Lighthouse Performance | _tbd_ | _tbd_ | _tbd_ | Mobile config, throttled. |
| First Contentful Paint | _tbd_ | _tbd_ | _tbd_ | Report from Lighthouse. |
| Time to Interactive | _tbd_ | _tbd_ | _tbd_ | Report from Lighthouse. |
| Total Blocking Time | _tbd_ | _tbd_ | _tbd_ | Report from Lighthouse. |
| Speed Index | _tbd_ | _tbd_ | _tbd_ | Report from Lighthouse. |
| Scroll FPS (feed) | _tbd_ | _tbd_ | _tbd_ | Capture via Flutter DevTools performance overlay. |
