import 'dart:html' as html;

import 'splash_visit_storage_interface.dart';

class _WebSplashVisitStorage implements SplashVisitStorage {
  const _WebSplashVisitStorage();

  static const String _storageKey = 'zr_jin_page:splash_seen_v1';

  @override
  bool get hasSeenSplash => html.window.localStorage[_storageKey] == 'true';

  @override
  void markSplashSeen() {
    html.window.localStorage[_storageKey] = 'true';
  }
}

SplashVisitStorage createSplashVisitStorage() => const _WebSplashVisitStorage();
