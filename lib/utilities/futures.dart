import 'content_repository.dart';

Future<List<dynamic>> loadCachedJsonList(String fileName) async {
  final repo = ContentRepository.instance;

  try {
    return await repo.loadLocalList(fileName);
  } catch (_) {
    // No bundled asset; rely on remote fetch and surface errors upstream.
    return repo.loadRemoteList(fileName);
  }
}
