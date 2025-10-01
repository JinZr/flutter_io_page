# Flutter Web Performance Plan

## Goals
- Reduce initial JavaScript payload and perceived Time To Interactive (TTI).
- Improve frame stability during scroll and entrance animations.
- Establish reproducible profiling & reporting for Lighthouse and bundle size metrics.

## Key Tactics
1. **Build configuration**
   - Enforce HTML renderer for static content to avoid CanvasKit wasm downloads unless explicitly required.
   - Ship with `--pwa-strategy offline-first`, `--source-maps`, `--split-debug-info`, and icon tree shaking.
   - Automate `flutter build web --analyze-size` and keep JSON under `perf/*/size/`.

2. **Code-splitting & deferred loading**
   - Defer non-critical home sections (publications, contributions, photos) using Dart deferred libraries and a lightweight loader widget.
   - Keep hero content (intro card, app shell) eagerly loaded to minimize first paint.

3. **Runtime efficiency**
   - Cache asynchronous JSON loads and avoid spawning new network requests on each rebuild.
   - Preload local asset snapshots and upgrade to remote content in the background.
   - Add repaint boundaries where cards animate in to limit raster work.

4. **Assets & fonts**
   - Disable runtime font fetching so fonts are bundled and cacheable.
   - Ensure text JSON assets are part of the build for offline-first behaviour.

5. **Profiling workflow**
   - Provide a repeatable `tool/perf_measure.sh` script that records bundle sizes, Lighthouse metrics, and FPS samples.
   - Store raw reports under `perf/before/` and `perf/after/` with timestamped subfolders.

## Expected Impact
- ≥20% reduction to initial JS transfer thanks to deferred module splitting and renderer swap.
- Faster FCP/TTI by avoiding blocking HTTP requests on first frame and using local JSON snapshots.
- Smoother scrolling by isolating repaint workloads and eliminating redundant rebuild-triggered fetches.

## Risks & Mitigations
- Deferred libraries can delay card availability → provide skeleton placeholders and eager warm-up after first frame.
- Local JSON snapshot may fall behind remote source → keep background refresh that replaces content when remote succeeds.
- HTML renderer may reduce fidelity for advanced canvas effects → document how to revert to CanvasKit if required.
