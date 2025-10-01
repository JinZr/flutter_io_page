# Flutter Web Performance Optimization Plan

## Current Findings
- Release bundle (`main.dart.js`) weighs ~3.4 MB before compression.
- Build relies on CanvasKit; headless Lighthouse runs fail to render (no FCP) indicating renderer mismatch for CI tooling and unnecessary WASM payload.
- Multiple home screen cards fetch remote JSON on every rebuild, redoing network and JSON parsing work and blocking animations.
- Widget tests fail locally because web-only `setUrlStrategy` executes on non-web platforms.
- Heavy secondary sections (publications, academic service, gallery) are bundled eagerly even though they are below-the-fold.

## Goals
1. Reduce the initial JS payload by at least 20% and keep first screen lean.
2. Improve first frame time / TTI by deferring non-critical widgets and eliminating duplicate async work.
3. Stabilize runtime FPS during scroll/animations by minimizing rebuilds and isolating expensive paints.
4. Ensure CI/dev workflows can gather metrics (HTML renderer friendly, deterministic builds).

## Planned Changes

### Build & Asset Pipeline
- Force HTML renderer by default via `window.flutterConfiguration` so CanvasKit WASM is not shipped unless explicitly enabled. Document build flags (`--dart-define=FLUTTER_WEB_USE_SKIA=true`) when CanvasKit is required.
- Adopt `SPLIT_DEBUG_INFO` output directory and instruct CI to pass `--dart-define=SPLIT_DEBUG_INFO=perf/symbols` plus `--source-maps` to keep symbol maps out of the main bundle.
- Update `index.html` to use `{{flutter_service_worker_version}}` token and preconnect/preload critical assets.

### Code Structure & Deferred Loading
- Introduce deferred imports for heavyweight secondary cards (`SelectedPubCard`, `AcademicServiceCard`, `ContribCard`, `PolaroidCard`). Load their libraries after the first frame with placeholders to avoid blocking the first paint.
- Wrap expensive card bodies in `RepaintBoundary` to prevent list scroll jank.
- Provide lightweight skeleton placeholders sized to avoid layout shift while deferred sections load.

### Async/Data Layer
- Add in-memory caching to `loadRemoteJsonList` to avoid repeated HTTP fetches for the same JSON.
- Convert dynamic card builders to stateful widgets holding a single `Future`, preventing repeat rebuild fetches.
- Schedule remote JSON loads via `SchedulerBinding.instance.addPostFrameCallback` so the initial frame is not blocked.

### Runtime Tweaks
- Use `const` constructors and `AutomaticKeepAliveClientMixin` where appropriate for long lists.
- Add explicit `RepaintBoundary` around the carousel to reduce repaint cost.
- Ensure `setUrlStrategy` executes only on web (fixes widget tests and avoids extra work on non-web builds).

### Measurement & Reporting
- Record before/after bundle sizes, HTML Lighthouse scores (using HTML renderer), FPS traces from `flutter run -d chrome --profile --profile-dump`. Store raw data under `perf/before` and `perf/after`.
- Document reproduction steps in `perf/after/README.md` including commands with build flags and how to point Lighthouse to the static server.

## Next Steps After This Iteration
- Evaluate image pipeline (generate responsive variants via `flutter_image_compress` or offline toolchain).
- Explore code splitting per route if new pages are added.
- Consider replacing Google Fonts runtime fetching with pre-baked font subsets served locally.
