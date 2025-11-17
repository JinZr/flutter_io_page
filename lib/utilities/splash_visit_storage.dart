import 'splash_visit_storage_interface.dart';
import 'splash_visit_storage_stub.dart'
    if (dart.library.html) 'splash_visit_storage_web.dart';

export 'splash_visit_storage_interface.dart' show SplashVisitStorage;

SplashVisitStorage getSplashVisitStorage() => createSplashVisitStorage();
