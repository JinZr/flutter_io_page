import 'splash_visit_storage_interface.dart';

class _FallbackSplashVisitStorage implements SplashVisitStorage {
  const _FallbackSplashVisitStorage();

  @override
  bool get hasSeenSplash => false;

  @override
  void markSplashSeen() {}
}

SplashVisitStorage createSplashVisitStorage() =>
    const _FallbackSplashVisitStorage();
