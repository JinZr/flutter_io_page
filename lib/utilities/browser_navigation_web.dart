import 'package:web/web.dart' as web;

void disableBrowserNavigationImpl() {
  void _pushState() {
    final currentUrl = web.window.location.href;
    web.window.history.pushState(null, '', currentUrl);
  }

  web.document.documentElement
      ?.style
      .setProperty('overscroll-behavior-x', 'none');
  web.document.body?.style.setProperty('overscroll-behavior-x', 'none');

  // Ensure there is a history entry so that navigating back immediately
  // triggers our popstate handler instead of leaving the page.
  _pushState();

  web.window.addEventListener('popstate', (event) {
    _pushState();
  });

  web.document.addEventListener('keydown', (event) {
    if (event is! web.KeyboardEvent) {
      return;
    }

    final key = event.key?.toLowerCase();
    if (key == null) {
      return;
    }

    final isAltArrowNavigation =
        event.altKey && (key == 'arrowleft' || key == 'arrowright');
    final isBrowserNavigationKey = key == 'browserback' ||
        key == 'browserforward' ||
        key == 'goback' ||
        key == 'goforward';

    if (isAltArrowNavigation || isBrowserNavigationKey) {
      event.preventDefault();
    }
  });
}
