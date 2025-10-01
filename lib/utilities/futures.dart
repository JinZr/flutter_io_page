import 'dart:async';

import 'content_repository.dart';

Future<List<dynamic>> loadCachedJsonList(String fileName) async {
  final repo = ContentRepository.instance;

  try {
    final local = await repo.loadLocalList(fileName);
    // Fire and forget remote warm-up.
    unawaited(_warmUpRemote(repo, fileName));
    return local;
  } catch (_) {
    // No bundled asset; rely on remote fetch and surface errors upstream.
    return repo.loadRemoteList(fileName);
  }
}

Future<void> _warmUpRemote(ContentRepository repo, String fileName) async {
  try {
    await repo.loadRemoteList(fileName);
  } catch (_) {
    // Ignore remote errors in warm-up path; the UI uses the local snapshot.
  }
}
