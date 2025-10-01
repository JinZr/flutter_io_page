# Baseline Measurements

- Flutter version: 3.35.5 (stable)
- Build command: `flutter build web --release --source-maps --pwa-strategy offline-first --no-tree-shake-icons=false`
- Initial bundle sizes (uncompressed): see `bundle_sizes.txt`.
- Lighthouse: Unable to capture metrics for the default CanvasKit build in headless Chrome (NO_FCP). This motivated switching the default renderer to HTML in the optimization pass so automated tooling can evaluate the app.
- Tests: `flutter test -r expanded` failed before changes because `setUrlStrategy` executed on non-web platforms (see chunk `b1cc1a`).
