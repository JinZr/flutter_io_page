import 'browser_navigation_stub.dart'
    if (dart.library.html) 'browser_navigation_web.dart';

/// Disables browser back/forward navigation gestures when running on the web.
void disableBrowserNavigation() => disableBrowserNavigationImpl();
