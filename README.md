# Flutter IO Page

Static personal homepage implemented in Flutter Web.

## Building for Web

```bash
./build.sh
```

The build script enforces the HTML renderer, offline-first service worker, and
size analysis with symbol splitting. Release output is written to the default
`build/web` folder (or `build/web-html` when using `tool/perf_measure.sh`).

### Recommended profiling workflow

1. Ensure a recent stable Flutter SDK is installed and on your `PATH`.
2. Run the helper script to rebuild and capture bundle size reports:

   ```bash
   tool/perf_measure.sh
   ```

3. Serve the release build and collect Lighthouse metrics:

   ```bash
   flutter run -d web-server --web-hostname 127.0.0.1 --web-port 8080 --release --web-renderer html
   # In another terminal run Lighthouse against http://127.0.0.1:8080
   ```

4. Save the Lighthouse JSON/HTML and FPS captures under `perf/before/` or
   `perf/after/`.

### Asset caching

Structured data (academic services, publications) is bundled in
`assets/texts/`. The widgets hydrate with the local snapshot immediately and
refresh from the GitHub raw endpoint in the background when a network
connection is available.
