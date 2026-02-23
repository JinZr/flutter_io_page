# Repository Guidelines

## Project Structure & Module Organization
- `lib/main.dart` is the app entry point and web bootstrap.
- `lib/home.dart` assembles the page shell; deferred cards live in `lib/home_components/`.
- Shared code is split between `lib/utilities/` (content loading, deferred helpers, links) and `lib/theme/` (theme and typography).
- Static resources are in `assets/images/`, `assets/texts/`, and `assets/fonts/`; web host files are in `web/`.
- Tests live in `test/`. Performance reports and measurements are tracked under `perf/`.
- `build/` contains generated release artifacts; treat it as output, not hand-edited source.

## Build, Test, and Development Commands
- `flutter pub get`: install/update dependencies.
- `flutter run -d chrome`: run locally with hot reload.
- `flutter analyze`: run linting/static analysis (`flutter_lints` via `analysis_options.yaml`).
- `flutter test --platform chrome -r expanded`: run full web widget/unit test suite with detailed output (matches CI gate).
- `flutter test --platform chrome -r expanded test/home_components/...`: run only card/component tests while iterating on UI.
- `flutter test --platform chrome -r expanded test/utilities/...`: run utility widget/unit tests (deferred loading, toolbar, lazy image, error view, cached content loader).
- `./build.sh`: production web build (`--release`, `--wasm`, source maps, icon tree-shaking).
- `tool/perf_measure.sh`: full perf pass (clean, analyze, test, WebAssembly build, and bundle size capture from `build/web-html`).

## Flutter Web Loading & Performance Notes (3.41+)
- Keep Flutter web flags aligned with `flutter build web -h` for the installed SDK. In current stable (3.41+), avoid removed/legacy flags such as `--analyze-size` and deprecated `--pwa-strategy`.
- Preserve lazy section construction in `lib/home.dart` (`ListView.builder`) so deferred sections are not eagerly built on first frame.
- Preserve deferred imports for below-the-fold cards and keep them wrapped in `DeferredWidget` placeholders.
- For carousel-heavy UI, prefer `CarouselView.weightedBuilder` over eager child lists when items can be lazily built.
- Keep content fetch deduping resilient: if editing `ContentRepository`, ensure `_remoteInFlight` entries are cleared in a `finally` path so failed requests can retry.
- For loading/perf changes, re-run `flutter analyze`, `flutter test --platform chrome -r expanded`, and `./build.sh`.

## Coding Style & Naming Conventions
- Format before committing: `dart format lib test tool`.
- Use Dart conventions: 2-space indentation, `PascalCase` for classes/widgets, `lowerCamelCase` for members, `snake_case.dart` file names.
- Prefer small composable widgets, explicit types where readability improves, and `const` constructors when possible.
- Keep analyzer warnings at zero before opening a PR.

## Responsive & Compact Mode
- This project is a multi-platform webpage; all UI work must preserve both regular and compact presentation modes.
- Maintain the current compact-mode convention (`MediaQuery.sizeOf(context).width < 700`) used across cards in `lib/home_components/` unless there is a clear reason to change it repo-wide.
- Keep narrow-width toolbar behavior aligned with `lib/utilities/link_toolbar.dart` breakpoints so actions remain usable on small screens.
- For layout changes, verify no text/button overflow in compact mode and keep interaction targets accessible on touch devices.

## Layout Tokens Extension
- `lib/theme/layout_tokens.dart` is the source of truth for shared layout values (spacing, paddings, radii) via the `LayoutTokens` `ThemeExtension`.
- Prefer `context.layout` (from `LayoutTokensX`) and token fields over hard-coded layout numbers in widgets.
- For compact rendering, use the existing pattern `final layout = isCompact ? LayoutTokens.compact() : context.layout;`.
- When adding a new layout token, update all required extension surfaces together: fields/constructor, `_regular`, `_compact`, `copyWith`, and `lerp`.
- Keep `LayoutTokens` registered in theme setup (`lib/theme/theme.dart`) so token access works app-wide.

## Testing Guidelines
- Use `flutter_test`; place tests in `test/` and name files `*_test.dart`.
- Keep the component test structure:
  - `test/home_components/`: card and section component tests.
  - `test/utilities/`: shared utility widget/unit tests.
  - `test/helpers/test_app.dart`: shared harness for test app/theme/surface setup.
- Add/adjust widget tests for UI behavior changes (regular vs compact mode, deferred loading, toolbar behavior).
- For layout token changes, validate both regular and compact modes to catch spacing/overflow regressions.
- Prefer viewport-aware assertions for multiplatform behavior (e.g., compact width around `430`, regular width around `1024`).
- CI/merge gate: `flutter analyze` and `flutter test --platform chrome -r expanded` must pass.
- Build/push workflow behavior: `.github/workflows/build-web-to-main.yml` runs `quality-checks` first; `build-and-push` executes only after passing checks.

## Commit & Pull Request Guidelines
- Recent history includes both specific subjects (`Refactor ...`, `Update ...`) and generic ones (`updated`, `minor updates`).
- Prefer specific, imperative commit subjects, e.g. `Refactor LinkToolbar overflow behavior`.
- PRs should include: purpose, key changes, commands run for validation, and screenshots/GIFs for UI changes.
- Link related issues and call out updates to `assets/texts/` or other content files.

## Content & Configuration Notes
- `ContentRepository` loads bundled JSON first, then refreshes from GitHub raw on `main`.
- When changing content-backed cards, keep local snapshots in `assets/texts/` synchronized with expected remote structure.
